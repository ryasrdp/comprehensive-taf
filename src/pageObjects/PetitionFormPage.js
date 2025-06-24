import { BasePage } from './index.js';
import { DataStorage } from '../helpers/index.js';

export default class PetitionFormPage extends BasePage {
  constructor(page) {
    super(page);
    this.headerLocator = page.locator('h1');
    this.formLocator = page.locator('#comprehensive-form');
    this.sectionLocator = (sectionName, formName) =>
      page.locator(`//*[contains(text(),
   "${formName}")]/following-sibling::form//*[@class="section-title" and contains(text(), "${sectionName}")]`);
    this.fieldOnSectionLocator = (sectionName, fieldName) => page.locator('//*[@class="section-title" and ' +
      `contains(text(),"${sectionName}")]/..//label[contains(text(),"${fieldName}")]`);
    this.petitionFormField = field => page.locator(`//*[@data-anchor="${field}"]`);
    this.petitionFormFieldOnSection = (section, field) =>
      page.locator(`//th[contains(text(),"${section}")]/../../..//*[@data-anchor="${field}"]`);
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
    this.dateOfBirdth = page.getByRole('textbox', { name: 'Date of Birth *' });
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
    await this.dateOfBirdth.fill(user.userDob);
    await this.backgroundCheckConsentCheckBox.click();
    await this.termsAgreementCheckBox.click();
  }

  async checkVisibilityOfSection(sectionName, formName) {
    const sectionOnForm = this.sectionLocator(sectionName, formName);
    try {
      return await sectionOnForm.isVisible();
    } catch (error) {
      // eslint-disable-next-line
      console.error(`Error checking visibility of section "${sectionName}" in form "${formName}":`, error);
      return false;
    }
  }
  async checkVisibilityOfField(sectionName, fieldName) {
    const sectionOnForm = this.fieldOnSectionLocator(sectionName, fieldName);
    try {
      return await sectionOnForm.isVisible();
    } catch (error) {
      // eslint-disable-next-line
      console.error(`Error checking visibility of field "${fieldName}" in section "${sectionName}":`, error);
      return false;
    }
  }
}
