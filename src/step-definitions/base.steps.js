import { createBdd } from 'playwright-bdd';
import { BasePage } from '../pageObjects/index.js';
import { expect } from '@playwright/test';
import { DataStorage, Randomizer, UserCreator } from '../helpers/index.js';
import data from '../../config/constants.js';

const { Given, When, Then } = createBdd();

Given('Open web page url {string}', async ({ page }, url) => {
  await page.setViewportSize({ width: 1920, height: 1080 });
  await page.goto(url, { waitUntil: 'domcontentloaded' });
});

When('Click on {string} button', async ({ page }, buttonName) => {
  const basePage = new BasePage(page);
  await basePage.clickOnButton(buttonName);
});

Then('Verify tooltip {string} is displayed for {string} field', async ({ page }, tooltipMessage, fieldName) => {
  const basePage = new BasePage(page);
  const requiredField = await basePage.formField(fieldName);
  await requiredField.waitFor({ state: 'visible' });
  await requiredField.focus();
  const isFieldInvalid = await requiredField.evaluate(field => field.checkValidity() === false);
  expect(isFieldInvalid).toBeTruthy();
  const validationMessage = await requiredField.evaluate(field => field.validationMessage);
  expect(validationMessage).toBe(tooltipMessage);
});

When('Select {string} value in {string} field', async ({ page }, value, fieldName) => {
  const basePage = new BasePage(page);
  await basePage.selectFieldValueByName(fieldName, value);
});

When(/^Select "([^"]*)" value in "([^"]*)" field on "([^"]*)" section$/,
  async ({ page }, value, fieldName, sectionName) => {
  const basePage = new BasePage(page);
  await basePage.selectSectionFieldValueByName(fieldName, value, sectionName);
});

When(/^Select "([^"]*)" value in "([^"]*)" Date field$/, async ({ page }, value, fieldName) => {
  const basePage = new BasePage(page);
  await basePage.selectDateFieldValueByName(fieldName, value);
});

When(
  /^Select "([^"]+)" "([^"]+)" "([^"]+)" value in "([^"]+)" field/,
  async ({ page }, user, userNumber, value, fieldName) => {
    const userFieldsMap = Randomizer.getKeyByValue(data.userDataFields, value);
    if (!userFieldsMap) {
      // eslint-disable-next-line
      console.warn(`Value "${value}" not found in userDataFields. Using fallback.`);
    }
    const finalResult = userFieldsMap || value;
    const userDataFromStorage = await DataStorage.getNamespace(user, userNumber)[finalResult];
    const basePage = new BasePage(page);
    await basePage.selectFieldValueByName(fieldName, userDataFromStorage);
  },
);

When('Select {string} value in {string} dropdown', async ({ page }, value, dropdownName) => {
  const basePage = new BasePage(page);
  await basePage.selectDropdownValueByName(dropdownName, value);
});

Given(/^Create "([^"]+)" "([^"]+)" using storage(?: (.+))?$/, async ({ }, namespace, id, optionsJson) => {
  const options = optionsJson ? JSON.parse(optionsJson) : {};
  const user = UserCreator.createUser(options);
  await DataStorage.setNamespace(namespace, id, user);
});

When('Close alert with message {string}', async ({ page }, expectedMessage) => {
  const basePage = new BasePage(page);
  let actualMessage = '';
  page.on('dialog', async dialog => {
    actualMessage = dialog.message();
    await dialog.accept();
  });
  await page.click(basePage.alertButtom);
  expect(actualMessage).toBe(expectedMessage);
});
