import { test, expect } from '@playwright/test';
import PetitionFormPage from '/src/pageObjects/PetitionFormPage.js';

test.describe('Employer City Field Validation', () => {
    test('should validate Employer City input and output', async ({ page }) => {
        const petitionForm = new PetitionFormPage(page);

        await page.goto('https://ryasrdp.github.io/');


        const isSectionVisible = await petitionForm.checkVisibilityOfSection('Employment Information', 'Petition for Space Travel');
        expect(isSectionVisible).toBe(true);


        const employerCityField = petitionForm.fieldLocatorByName('Employer City');
        expect(await employerCityField.isVisible()).toBe(true);
        const placeholder = await employerCityField.getAttribute('placeholder');
        expect(placeholder).toBe('Enter city');


        await petitionForm.selectFieldValueByName('Employer City', '');
        await petitionForm.clickOnButton('Submit');



        await petitionForm.selectFieldValueByName('Employer City', '@4561!');
        await petitionForm.clickOnButton('Submit');
        await expect(page.locator('text=Field must contain valid characters')).toBeVisible();

        await petitionForm.selectFieldValueByName('Employer City', 'New York');
        await petitionForm.clickOnButton('Submit');

        await expect(page.locator('text=New York')).toBeVisible();
    });
});