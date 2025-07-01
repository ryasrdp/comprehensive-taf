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