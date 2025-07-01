import { test, expect } from '@playwright/test';

test.describe('@form', () => {
  test('отправка формы с валидными данными', async ({ page }) => {
    await page.goto('https://ryasrdp.github.io/');

    // Личные данные
    await page.locator('[placeholder="Enter your first name"]').fill('Anna');
    await page.locator('[placeholder="Enter your last name"]').fill('Ivanova');
    await page.locator('[placeholder="MM/DD/YYYY"]').fill('12/10/1995');
    await page.getByRole('combobox', { name: /gender/i }).selectOption({ label: 'Female' });

    // Контактные данные
    await page.fill('[placeholder="Enter your email address"]', 'anna@example.com');
    await page.fill('[placeholder="Re-enter your email address"]', 'anna@example.com');
    await page.fill('[placeholder="Enter your phone number"]', '+375291112233');

    // Отправка формы
    await page.getByRole('button', { name: /submit/i }).click();

    // Проверка результата
    const successMessage = page.locator('text=Thank you for your submission');
    await expect(successMessage).toBeVisible();
  });
});
