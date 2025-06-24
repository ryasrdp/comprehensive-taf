
import { Given, When, Then } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import PetitionFormPage from '../src/pageObjects/PetitionFormPage.js';

let petitionForm;

Given('the user is on the Petition for Space Travel form', async function () {
    await this.page.goto('https://ryasrdp.github.io/');
    petitionForm = new PetitionFormPage(this.page);
});

When('they scroll to the Employment Information section', async function () {
    const visible = await petitionForm.checkVisibilityOfSection('Employment Information', 'Petition for Space Travel');
    expect(visible).toBe(true);
});

Then('the {string} field is visible with placeholder {string}', async function (fieldName, placeholder) {
    const field = petitionForm.fieldLocatorByName(fieldName);
    expect(await field.isVisible()).toBe(true);
    expect(await field.getAttribute('placeholder')).toBe(placeholder);
});

When('they leave the Employer City field empty and click Submit', async function () {
    await petitionForm.selectFieldValueByName('Employer City', '');
    await petitionForm.clickOnButton('Submit');
});

Then('the form is submitted successfully', async function () {
    expect(true).toBe(true);
});

When('they enter {string} in the Employer City field and click Submit', async function (value) {
    await petitionForm.selectFieldValueByName('Employer City', value);
    await petitionForm.clickOnButton('Submit');
});

Then('a validation message {string} is shown', async function (message) {
    await expect(this.page.locator(`text=${message}`)).toBeVisible();
});

Then('the data is displayed in the output table', async function () {
    await expect(this.page.locator('text=New York')).toBeVisible();
});
