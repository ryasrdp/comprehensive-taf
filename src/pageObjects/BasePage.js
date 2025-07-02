export class BasePage {
  constructor(page) {
    this.page = page;
    this.dropdownLocatorByName = dropdownName =>
      page.locator(`//label[contains(text(), "${dropdownName}")]/following-sibling::select`);
    this.alertButtom = page.locator('button#trigger-alert');
    this.dateFieldLocatorByName = fieldName => page.getByRole('textbox', { name: `${fieldName}` });
    this.formField = fieldName => page.locator(`//label[.="${fieldName}"]/following-sibling::input`);
    this.formSectionFieldInput = (sectionName, fieldName) =>
      page.locator(`//*[.="${sectionName}"]/..//label[.="${fieldName}"]/following-sibling::input`);
    this.fieldLocatorByName = fieldName =>
      page.locator(`//label[contains(text(), "${fieldName}")]/following-sibling::input`);
    this.fieldBySectionLocatorByName = (fieldName, sectionName) =>
      page.locator(
        `//*[@class="section-title" and contains(normalize-space(.), "${sectionName}")]` +
        `/..//label[contains(normalize-space(.), "${fieldName}")]`,
      ).first();
  }

  async clickOnButton(name) {
    await this.page.getByRole('button', { name }).click();
  }

  static async waitForClickable(locator) {
    await locator.waitFor({ state: 'visible' });
    const isEnabled = await locator.isEnabled();
    return isEnabled;
  }

  /**
   * Selects a value in a field by its name.
   * @param {string} fieldName - The name of the field.
   * @param {string} value - The value to set in the field.
   */
  async selectFieldValueByName(fieldName, value) {
    const field = this.fieldLocatorByName(fieldName);
    await field.waitFor({ state: 'visible' });
    const isEditable = await field.isEditable();
    if (!isEditable) {
      // eslint-disable-next-line
      console.warn(`Field "${fieldName}" is not editable.`);
      return false;
    }
    await field.fill(value);
    return true;
  }

  /**
   * Selects a date value in a field by its name.
   * @param {string} fieldName - The name of the date field.
   * @param {string} value - The date value to set in the field (format: YYYY-MM-DD or as required by the field).
   * @returns {boolean} - Returns `true` if the date value was successfully set, otherwise `false`.
   */
  async selectDateFieldValueByName(fieldName, value) {
    const field = this.dateFieldLocatorByName(fieldName);
    await field.focus();
    await field.waitFor({ state: 'visible' });
    const isEditable = await field.isEditable();
    if (!isEditable) {
      // eslint-disable-next-line
      console.warn(`Date field with "${fieldName}" is not editable.`);
      return false;
    }
    await field.fill(value);
    return true;
  }

  /**
   * Selects a value in a dropdown field by its name.
   * @param {string} dropdownName - The name of the dropdown field.
   * @param {string} value - The value to select in the dropdown (must match one of the available options).
   * @returns {Promise<void>} - Resolves when the value is successfully selected.
   */
  async selectDropdownValueByName(dropdownName, value) {
    await this.dropdownLocatorByName(dropdownName).click();
    await this.dropdownLocatorByName(dropdownName).selectOption(value);
  }

  async selectSectionFieldValueByName(fieldName, value, sectionName = null) {
    const field = this.fieldBySectionLocatorByName(fieldName, sectionName);
    await field.waitFor({ state: 'visible' });
    const isEditable = await field.isEditable();
    if (!isEditable) {
      // eslint-disable-next-line
      console.warn(`Field "${fieldName}" is not editable.`);
      return false;
    }
    await field.fill(value);
    return true;
  }
}
