# Test Automation Framework #

Based on playwright end-to-end testing.
Target - https://ryasrdp.github.io/ site

---

For using this framework install Node.JS from https://nodejs.org/en/

---

For running automation tests locally use next steps after all installations:

1. Open framework in root folder via terminal (./comprehensive-taf).
2. Run command

```npm install```

---

## Git strategy

* Main working branch - **_dev_**
* Merging with dev branch only after successful pipelines.
* One approval is required

---

## Scripts for running

* The framework includes several scripts for performing various tasks:

### Running all tests

* To run all tests, run the command:
```bash
npm run test
```

### Run tests by tag (e.g form)

```bash
npm run test:tag -- form
```

---

### Code linting

To check the quality of your code with ESLint, run the command:
```bash
npm run lint
```

**Description**:
- Checks your project files for linting rules.
- Fixes found issues automatically (if possible).

---

## Installing Playwright

If Playwright was not installed automatically, run the following command:
```bash
npx playwright install
```

This command will install the browsers required to run the tests (Chromium)

---

## Possible errors

### 1. Playwright is not installed
If you see an error about missing Playwright when running tests, run the command:
```bash
npm install @playwright/test
```

### 2. Node.js is not installed
If the `npm` command does not work, make sure you have Node.js installed. Download it from the [official website](https://nodejs.org/en/).

---

## Useful links

- [Playwright Documentation](https://playwright.dev/docs/intro)
- [Node.js Documentation](https://nodejs.org/)
- [ESLint Documentation](https://eslint.org/docs/latest/)

---
