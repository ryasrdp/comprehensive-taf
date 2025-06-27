/* global describe, it, cy, beforeEach */

import petitionForm from '../support/pages/petitionForm.page';

describe('Income Type field in Petition for Space Travel form', () => {
  beforeEach(() => {
    petitionForm.visit();
  });

  it('Allows selecting an Income Type and shows it in output', () => {
    petitionForm.selectIncomeType('Salary');
    petitionForm.submit();
    petitionForm.getIncomeTypeInOutput().should('contain.text', 'Salary');
  });

  it('Allows submitting the form without selecting Income Type (optional field)', () => {
    petitionForm.submit();
    petitionForm.getConfirmation().should('be.visible');
  });
});

