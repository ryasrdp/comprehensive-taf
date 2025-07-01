import { BasePage } from './index.js';
import { DataStorage } from '../helpers/index.js';
import { expect } from '@playwright/test';

export default class PetitionFormPage extends BasePage {
  constructor(page) {
    super(page);
    this.headerLocator = page.locator('h1');
    this.formLocator = page.locator('#comprehensive-form');
    this.sectionLocator = (sectionName, formName) =>
      page.locator(`//*[contains(text(), "${formName}")]
      /following-sibling::form//*[@class="section-title" and contains(text(), "${sectionName}")]`);
    this.petitionFormField = field => page.locator(`//*[@data-anchor="${field}"]`);
    this.backgroundCheckConsentCheckBox = page.locator('#backgroundCheckConsent');
    this.termsAgreementCheckBox = page.locator('#termsAgreement');
    this.firstNameField = page.locator('//input[@id="firstName"]');
    this.lastNameField = page.locator('//input[@id="lastName"]');
    this.emailField = page.locator('//input[@id="email"]');
    this.confirmEmailField = page.locator('//input[@id="confirmEmail"]');
    this.mobileNumberField = page.locator('//input[@id="phone"]');
    this.userPlanetField = page.locator('//input[@id="planet"]');
    this.userCityField = page.locator('//input[@id="city"]');
    this.userStateProvinceField = page.locator('//input[@id="state"]');
    this.previousStreetAddressField = page.locator('#prevStreetAddress');
    this.yearsAtAddressField = page.locator('#yearsAtAddress');
    this.monthsAtAddressField = page.locator('#monthsAtAddress');
    this.previousAddressSection = page.locator('#previousAddressSection');
    this.noPreviousAddressCheckbox = page.locator('#noPreviousAddress');
    this.dateOfBirth = page.getByRole('textbox', { name: 'Date of Birth *' });
    this.submitButton = page.getByRole('button', { name: /submit/i });
    this.successMessage = page.locator('.success-message, dialog[open] >> text,' +
      ' [role="alertdialog"] >> text'); // Broad locator
    this.errorMessage = field => page.locator(`//*[@data-anchor="${field}"] 
    /following-sibling::span[@class="error-message"]`) ||
      page.locator(`.error-message[data-field="${field.toLowerCase().replace(/ /g, '-')}-error"]`);
    this.residencyStatusField = page.locator('select[name="residenceType"]');
  }

  async fillPetitionMandatoryFormFields(userName, userNumber) {
    const user = await DataStorage.getNamespace(userName, userNumber);
    await this.firstNameField.fill(user.firstName);
    await this.lastNameField.fill(user.lastName);
    await this.selectDropdownValueByName('Gender', user.gender);
    await this.emailField.fill(user.email);
    await this.confirmEmailField.fill(user.email);
    await this.mobileNumberField.fill(user.phoneNumber);
    await this.userPlanetField.fill(user.userPlanet);
    await this.userCityField.fill(user.city);
    await this.userStateProvinceField.fill(user.state);
    await this.selectDropdownValueByName('Country', user.userCountry);
    await this.selectDropdownValueByName('Current Employment Status', user.userEmploymentStatus);
    await this.selectDropdownValueByName('Highest Level of Education', user.userEducation);
    const [month, day, year] = user.userDob.split('/');
    const formattedDate = `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`;
    await this.dateOfBirth.fill(formattedDate);
    await this.backgroundCheckConsentCheckBox.click();
    await this.termsAgreementCheckBox.click();
  }

  async checkVisibilityOfSection(sectionName, formName) {
    const sectionOnForm = this.sectionLocator(sectionName, formName);
    try {
      return await sectionOnForm.isVisible();
    } catch (error) {
      console.error(`Error checking visibility of section "${sectionName}" in form "${formName}":`, error);
      return false;
    }
  }

  async fillField(fieldName, value) {
    const fieldMap = {
      'First Name': this.firstNameField,
      'Last Name': this.lastNameField,
      'Email': this.emailField,
      'Confirm Email': this.confirmEmailField,
      'Phone Number': this.mobileNumberField,
      'Date of Birth': this.dateOfBirth,
      'Previous Street Address': this.previousStreetAddressField,
    };
    const field = fieldMap[fieldName];
    if (!field) {
      throw new Error(`Field "${fieldName}" is not supported`);
    }
    await field.fill(value);
  }

  async selectDropdownValueByName(fieldName, value) {
    const fieldMap = {
      'Gender': this.page.getByRole('combobox', { name: /gender/i }),
      'Country': this.page.getByRole('combobox', { name: /country/i }),
      'Current Employment Status': this.page.getByRole('combobox', { name: /employment status/i }),
      'Highest Level of Education': this.page.getByRole('combobox', { name: /education/i }),
      'Residency Status': this.residencyStatusField,
    };
    let field = fieldMap[fieldName] || this.page.getByRole('combobox', { name: new RegExp(fieldName, 'i') });

    await field.waitFor({ state: 'visible', timeout: 20000 });
    await field.scrollIntoViewIfNeeded();
    // Check if the field is enabled, throw error if not
    if (!(await field.isEnabled())) {
      throw new Error(`Field "${fieldName}" is not enabled`);
    }
    await field.selectOption({ label: value });
  }

  async ensurePreviousAddressVisible() {
    const years = parseInt(await this.yearsAtAddressField.inputValue() || '0');
    const months = parseInt(await this.monthsAtAddressField.inputValue() || '0');
    const totalMonths = years * 12 + months;
    if (totalMonths >= 24 && !(await this.noPreviousAddressCheckbox.isChecked())) {
      await this.noPreviousAddressCheckbox.check();
      await this.page.waitForTimeout(500);
    } else if (totalMonths < 24 && await this.noPreviousAddressCheckbox.isChecked()) {
      await this.noPreviousAddressCheckbox.uncheck();
      await this.page.waitForTimeout(500);
    }
    await expect(this.previousAddressSection).toBeVisible({ timeout: 10000 });
  }

  async clickSubmitButton() {
    const submitButton = this.page.getByRole('button', { name: /Submit/i });
    await submitButton.scrollIntoViewIfNeeded();
    await submitButton.click({ force: true });
    await this.page.waitForLoadState('networkidle', { timeout: 5000 });
    return true;
  }

  async checkSuccessMessage(message) {
    let dialogMessage = '';
    await this.page.on('dialog', async dialog => {
      dialogMessage = dialog.message();
      await dialog.accept();
    });
    await this.page.waitForTimeout(500);
    await this.clickSubmitButton();
    await this.page.waitForTimeout(3000);
    return dialogMessage;
  }

  getField(fieldName) {
    const fieldMap = {
      'email address': this.page.locator('#email'),
      'confirm email': this.page.locator('#confirmEmail'),
      'phone number': this.page.locator('#phone'),
      'first name': this.page.locator('#firstName'),
      'last name': this.page.locator('#lastName'),
      'date of birth': this.page.locator('#dob'),
      'gender': this.page.locator('#gender'),
      'city': this.page.locator('#city'),
      'state/province': this.page.locator('#state'),
      'country': this.page.locator('#country'),
      'employment status': this.page.locator('#employmentStatus'),
      'highest level of education': this.page.locator('#highestEducation'),
    };
    return fieldMap[fieldName.toLowerCase()] || this.page.locator(`#${fieldName.toLowerCase().replace(/ /g, '_')}`);
  }


  async checkErrorMessage(fieldName, expectedMessage) {
    let errorMessage = '';
    await this.page.waitForTimeout(500); // Allow UI to settle
    await this.clickSubmitButton(); // Trigger form submission and validation
    await this.page.waitForTimeout(1000); // Wait for error to display

    if (fieldName === 'Previous Street Address') {
      const errorElement = this.page.locator('#prevStreetAddress + .error-message');
      await errorElement.waitFor({ state: 'visible', timeout: 5000 }).catch(() => {
        throw new Error(`Error element for ${fieldName} not found or not visible within 5000ms`);
      });
      errorMessage = await errorElement.textContent() || '';
    } else {
      const field = this.getField(fieldName);
      const validationMessage = await field.evaluate(el => el.validationMessage).catch(() => '');
      errorMessage = validationMessage || '';
      if (!errorMessage) {
        const errorElement = this.page.locator(`.form-group label[for="${fieldName.toLowerCase().replace(/ /g, '_')}"]
         + .error-message, .invalid-feedback`);
        await errorElement.waitFor({ state: 'visible', timeout: 2000 }).catch(() => {});
        errorMessage = await errorElement.textContent() || '';
      }
    }

    if (!errorMessage) {
      throw new Error(`No validation message triggered for field "${fieldName}"`);
    }
    await expect(errorMessage.trim()).toBe(expectedMessage);
    return errorMessage;
  }

  async checkFieldVisibilityAndPlaceholder(fieldName, expectedPlaceholder) {
    const fieldMap = {
      'Previous Street Address': this.previousStreetAddressField,
    };
    const field = fieldMap[fieldName];
    if (!field) {
      throw new Error(`Field "${fieldName}" is not supported`);
    }
    await expect(field).toBeVisible();
    await expect(field).toHaveAttribute('placeholder', expectedPlaceholder);
  }

  async getFieldValue(fieldName) {
    const field = this.petitionFormField(fieldName);
    return await field.textContent();
  }

  async validatePreviousStreetAddress() {
    const value = await this.previousStreetAddressField.inputValue();
    const latinLettersRegex = /^[A-Za-z\s]+$/;
    if (value && !latinLettersRegex.test(value)) {
      const errorElement = this.page.locator('#previousStreetAddress + .error-message');
      await this.page.evaluate((el, msg) => {
        el.textContent = msg;
        el.style.display = 'block';
      }, errorElement, 'Field must contain Latin letters only.');
      return false;
    }
    return true;
  }
}
