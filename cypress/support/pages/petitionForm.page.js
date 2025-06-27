class PetitionFormPage {
    visit() {
      cy.visit('/petition-for-space-travel'); 
    }
  
    selectIncomeType(option) {
      cy.get('select[placeholder="Select your income type"]').select(option);
    }
  
    submit() {
      cy.contains('Submit').click();
    }
  
    getIncomeTypeInOutput() {
      return cy.contains('Income Type').next(); 
    }
  
    getIncomeTypeValidationError() {
      return cy.contains('Please select an income type.');
    }
  }
  
  export default new PetitionFormPage();
  