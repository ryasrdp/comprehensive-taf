//import { Then, When } from '@cucumber/cucumber';
import { PetitionFormPage } from '../pageObjects/index.js';
import { expect } from '@playwright/test';
import { DataStorage, Randomizer } from '../helpers/index.js';
import data from '../../config/constants.js';
import { createBdd } from 'playwright-bdd';

const { When, Then } = createBdd();

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

Then(
  /^Check field "([^"]*)" is (present|absent) on "([^"]*)" section$/,
  async ({ page }, fieldName, isPresent, sectionName) => {
    const petitionFormPage = new PetitionFormPage(page);
    const fieldVisible = await petitionFormPage.checkVisibilityOfField(sectionName, fieldName);
    if (isPresent === 'present') {
      expect(fieldVisible).toBeTruthy();
    } else if (isPresent === 'absent') {
      expect(fieldVisible).toBeFalsy();
    }
  },
);

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

Then(
  'Check Field {string} on {string} section contain value {string} on submitted Petition form',
  async ({ page }, fieldName, sectionName, fieldValue) => {
    const petitionFormPage = new PetitionFormPage(page);
    const petitionFieldValue = await petitionFormPage.petitionFormFieldOnSection(sectionName, fieldName).textContent();
    await expect(fieldValue).toBe(petitionFieldValue);
  },
);

Then(
  'Check validation error {string} is shown for field {string}',
  async ({ page }, errorMessage, fieldLabel) => {
    const petitionFormPage = new PetitionFormPage(page);
    const actualErrorMessage = await petitionFormPage.getValidationErrorForField(fieldLabel);

    expect(actualErrorMessage).toBe(errorMessage);
  },
);


When('Fill Mandatory Petition Form for {string} {string}', async ({ page }, student, number) => {
  const petitionFormPage = new PetitionFormPage(page);
  await petitionFormPage.fillPetitionMandatoryFormFields(student, number);
});
