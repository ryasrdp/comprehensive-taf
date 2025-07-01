import { PetitionFormPage } from '../pageObjects/index.js';
import { expect } from '@playwright/test';
import { DataStorage, Randomizer } from '../helpers/index.js';
import data from '../../config/constants.js';
import { createBdd } from 'playwright-bdd';

const { Given, When, Then } = createBdd();

Given('Open web page url {string}', async ({ page }, url) => {
  await page.goto(url);
});

Given('Create {string} {string} using storage', async ({}, userName, userNumber) => {
  const { UserCreator } = await import('../helpers/index.js');
  UserCreator.addUser(userName, userNumber);
});

Given('Create {string} {string} using storage \\{{string}: {string}}', async ({}, userName, userNumber, key, value) => {
  const { UserCreator } = await import('../helpers/index.js');
  const options = { [key]: value };
  UserCreator.addUser(userName, userNumber, options);
});

Then(
  /^Check section "([^"]*)" is (present|absent) on "([^"]*)" form$/,
  async ({ page }, sectionName, isPresent, formName) => {
    const petitionFormPage = new PetitionFormPage(page);
    const sectionVisible = await petitionFormPage.checkVisibilityOfSection(sectionName, formName);
    if (isPresent === 'present') {
      expect(sectionVisible).toBeTruthy();
    } else if (isPresent === 'absent') {
      expect(sectionVisible).toBeFalsy();
    }
  },
);

When('Fill Mandatory Petition Form for {string} {string}', async ({ page }, userName, userNumber) => {
  const petitionFormPage = new PetitionFormPage(page);
  await petitionFormPage.fillPetitionMandatoryFormFields(userName, userNumber);
});



When('Select {string} in {string} field', async ({ page }, value, fieldName) => {
  const petitionFormPage = new PetitionFormPage(page);
  const section = petitionFormPage.sectionLocator('Address Information', 'Petition to leave planet Earth');
  await section.scrollIntoViewIfNeeded();
  await petitionFormPage.checkVisibilityOfSection('Address Information', 'Petition to leave planet Earth');

  const noPreviousAddressCheckbox = page.locator('#noPreviousAddress');
  if (await noPreviousAddressCheckbox.isChecked()) {
    await noPreviousAddressCheckbox.uncheck();
    await page.waitForTimeout(500);
  }

  await page.locator('#yearsAtAddress').fill('1');
  await page.locator('#monthsAtAddress').fill('6');
  await page.waitForTimeout(500);

  try {
    await petitionFormPage.selectDropdownValueByName(fieldName, value);
    const previousStreetAddressField = page.locator('#prevStreetAddress')
      || page.getByRole('textbox', { name: 'Previous Street Address' });
    try {
      await previousStreetAddressField.waitFor({ state: 'visible', timeout: 10000 });
    } catch (e) {
    }
  } catch (error) {
    if (error.message.includes('is not enabled')) {
      throw error;
    }
    console.error('Timeout or other error during selection:', error.message);
  }
});

When('Enter {string} in {string} field', async ({ page }, value, fieldName) => {
  const petitionFormPage = new PetitionFormPage(page);
  // eslint-disable-next-line no-nested-ternary
  const field = fieldName === 'Previous Street Address' ? page.locator('#prevStreetAddress') :
    // eslint-disable-next-line no-nested-ternary
    fieldName === 'Years at Current Address' ? page.locator('#yearsAtAddress') :
      fieldName === 'Months at Current Address' ? page.locator('#monthsAtAddress') :
        page.locator(`//input[@id="${fieldName.toLowerCase().replace(/ /g, '_')}"]`) ||
        page.getByRole('textbox', { name: fieldName });
  if (fieldName === 'Previous Street Address') {
    await petitionFormPage.ensurePreviousAddressVisible();
  }
  await field.scrollIntoViewIfNeeded();
  try {
    await field.waitFor({ state: 'visible', timeout: 10000 });
    await field.fill(value);
  } catch (error) {
    throw new Error(`Failed to fill ${fieldName}: ${error.message}`);
  }
});

When('Click on {string} button', async ({ page }, buttonName) => {
  const petitionFormPage = new PetitionFormPage(page);
  const button = page.getByRole('button', { name: new RegExp(buttonName, 'i') });
  await button.scrollIntoViewIfNeeded();
  await button.click({ force: true });
  await petitionFormPage.page.waitForLoadState('networkidle', { timeout: 5000 });
});



When('Insert {string} in {string} field', async ({ page }, value, fieldName) => {
  const petitionFormPage = new PetitionFormPage(page);
  const field = page.locator(fieldName === 'Email Address'
      ? '#email' : `//input[@id="${fieldName.toLowerCase().replace(/ /g, '_')}"]`) ||
    page.getByRole('textbox', { name: fieldName });
  await field.scrollIntoViewIfNeeded();
  try {
    await field.waitFor({ state: 'visible', timeout: 10000 });
    await field.fill(value);
  } catch (error) {
    throw new Error(`Failed to fill ${fieldName}: ${error.message}`);
  }
});



Then('Check field {string} is visible with placeholder {string}', async ({ page }, fieldName, placeholder) => {
  const petitionFormPage = new PetitionFormPage(page);
  await petitionFormPage.checkVisibilityOfSection('Address Information', 'Petition to leave planet Earth');
  await petitionFormPage.checkFieldVisibilityAndPlaceholder(fieldName, placeholder);
});

Then(
  'Check Field {string} contain value {string} {string} {string} on submitted Petition form',
  async ({ page }, fieldName, user, userNumber, fieldValue) => {
    const userFieldsMap = Randomizer.getKeyByValue(data.userDataFields, fieldValue);
    const petitionFormPage = new PetitionFormPage(page);
    const userDataFromStorage = await DataStorage.getNamespace(user, userNumber)[userFieldsMap];
    const petitionFieldValue = await petitionFormPage.petitionFormField(fieldName).textContent();
    await expect(userDataFromStorage).toBe(petitionFieldValue);
  },
);

Then(
  'Check Field {string} contain value {string} on submitted Petition form',
  async ({ page }, fieldName, fieldValue) => {
    const petitionFormPage = new PetitionFormPage(page);
    const petitionFieldValue = await petitionFormPage.petitionFormField(fieldName).textContent();
    await expect(fieldValue).toBe(petitionFieldValue);
  },
);

Then('Check success message {string} is displayed', async ({ page }, message) => {
  const petitionFormPage = new PetitionFormPage(page);
  const dialogMessage = await petitionFormPage.checkSuccessMessage(message);
  await expect(dialogMessage.toLowerCase()).toContain(message.toLowerCase());
});


Then('Verify error message {string} is displayed for {string} field', async ({ page }, message, fieldName) => {
  const petitionFormPage = new PetitionFormPage(page);
  const dialogMessage = await petitionFormPage.checkErrorMessage(fieldName, message);
  await expect(dialogMessage.toLowerCase()).toContain(message.toLowerCase());
});
