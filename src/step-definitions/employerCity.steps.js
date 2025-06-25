import { expect } from '@playwright/test';
import { createBdd } from 'playwright-bdd';
import PetitionFormPage from '../../src/pageObjects/PetitionFormPage.js';

const { Given, When, Then } = createBdd();

function toId(fieldName) {
  return fieldName
    .replace(/\s+(.)/g, (_, char) => char.toUpperCase())
    .replace(/^./, str => str.toLowerCase());
}

Given('I open the Petition for Space Travel form', async ({ page }) => {
  await page.goto('https://ryasrdp.github.io/');
});

// Проверка, что поле отображается
Then('I should see the "Employer City" field in the Employment Information section', async ({ page }) => {
  const field = page.locator('th').filter({ hasText: /^Employer City$/ }).first();
  await expect(field).toBeVisible();
});

Then('the field should not be marked as mandatory', async ({ page }) => {
  const input = page.locator('input[name="Employer City"], input#employerCity');
  await expect(input).not.toHaveAttribute('required', '');
});

Then('the placeholder should be visible when the field is empty', async ({ page }) => {
  const input = page.locator('input[name="Employer City"], input#employerCity');
  const placeholder = await input.getAttribute('placeholder');
  expect(placeholder).toBeTruthy();
  await expect(input).toBeEmpty();
});

Given('I type invalid characters into the {string} field', async ({ page }, fieldName) => {
  const input = page.locator(`input[name="${fieldName}"], input#${toId(fieldName)}`);
  await input.waitFor({ state: 'visible' });
  await input.fill('@4561!');
});

When('I click the Submit button', async ({ page }) => {
  await page.getByRole('button', { name: 'Submit' }).click();
});

Then('I should see the validation error {string}', async ({ page }, message) => {
  await expect(page.getByText(message)).toBeVisible();
});

Given('I fill in the {string} field with {string}', async ({ page }, fieldName, value) => {
  const input = page.locator(`input[name="${fieldName}"], input#${toId(fieldName)}`);
  await input.waitFor({ state: 'visible' });
  await input.fill(value);
});

Then('I should see {string} in the output table', async ({ page }, value) => {
  const cell = page.locator('#outputEmployerCity');
  await expect(cell).toHaveText(value);
});
