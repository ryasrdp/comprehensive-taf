import { expect } from '@playwright/test';
import { createBdd } from 'playwright-bdd';
import PetitionFormPage from '../../src/pageObjects/PetitionFormPage.js';

const { Given, When, Then } = createBdd();

let petitionForm;

Given('I open the Petition for Space Travel form', async ({ page }) => {
  petitionForm = new PetitionFormPage(page);
  await page.goto('https://ryasrdp.github.io/');
});

Then('I should see the "Employer City" field in the Employment Information section', async ({}) => {
  const field = petitionForm.page.locator('th').filter({ hasText: /^Employer City$/ }).first();
  await expect(field).toBeVisible();
});

Then('the field should not be marked as mandatory', async ({}) => {
  const input = petitionForm.page.locator('input[name="Employer City"], input#employerCity');
  await expect(input).not.toHaveAttribute('required', '');
});

Then('the placeholder should be visible when the field is empty', async ({}) => {
  const input = petitionForm.page.locator('input[name="Employer City"], input#employerCity');
  const placeholder = await input.getAttribute('placeholder');
  expect(placeholder).toBeTruthy();
  await expect(input).toBeEmpty();
});

Given('I type invalid characters into the {string} field', async ({}, fieldName) => {
  await petitionForm.selectFieldValueByName(fieldName, '@4561!');
});

When('I click the Submit button', async ({}) => {
  await petitionForm.clickOnButton('Submit');
});

Then('I should see the validation error {string}', async ({ page }, message) => {
  await expect(page.locator(`text=${message}`)).toBeVisible();
});

Given('I fill in the {string} field with {string}', async ({}, fieldName, value) => {
  await petitionForm.selectFieldValueByName(fieldName, value);
});

Then('I should see {string} in the output table', async ({ page }, value) => {
  const cell = page.locator('#outputEmployerCity');
  await expect(cell).toHaveText(value);
});