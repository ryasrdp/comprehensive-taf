# EHU-ATJS-20265 – Add "Work Phone" Field to Employment Information

## 1. Story Point Estimation: 3 SP  
**Rationale:**  
- Simple UI addition (1)  
- One new locator + three step definitions (1)  
- Validation & summary-table check (1)

---

## 2. Manual Test Checklist

1. **Visibility**  
   - Navigate to form → Employment Information section is visible → “Work Phone” label present.
2. **Positive E.164 Inputs**  
   - +12025550123 → entering & submitting shows it in results.  
   - +447911123456 → same.  
   - +81312345678 → same.
3. **Optional Field**  
   - Leave blank → submit → results show empty cell.
4. **Negative Inputs** *(skipped until backend supports)*  
   - abc123, 123-456-7890, ++11234567890 → expect inline error:  
     `Please enter a valid phone number in E.164 format.`

---

## 3. BDD Scenario

```gherkin
@form
Feature: EHU-ATJS-20265 Add "Work Phone" in Employment Information

  Scenario Outline: Check Work Phone field accepts valid values
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Fill "<work_phone>" in "Work Phone" field on "Employment Information" section
    And Fill Mandatory Petition Form for "USER" "1"
    When Click on "Submit" button
    Then Check Field "Work Phone" contain value "<work_phone>" on submitted Petition form

    Examples:
      | work_phone     |
      | +12025550123   |
      | +447911123456  |
      | +81312345678   |

  Scenario: Check Work Phone field is optional
    Given Open web page url "https://ryasrdp.github.io/"
    And Create "USER" "1" using storage
    Then Check section "Employment Information" is present on "Petition to leave planet Earth" form
    And Fill Mandatory Petition Form for "USER" "1"
    When Click on "Submit" button
    Then Check Field "Work Phone" contain value "" on submitted Petition form

  @skip
  Scenario Outline: Check Work Phone field shows validation error for invalid values
    …
