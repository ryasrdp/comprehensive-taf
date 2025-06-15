import fs from 'fs';
import path from 'path';
import { generate } from 'cucumber-html-reporter';

const reportDir = path.resolve('test-reports');
const jsonFile = path.join(reportDir, 'report.json');
const htmlFile = path.join(reportDir, 'report.html');

if (fs.existsSync(jsonFile) && fs.readFileSync(jsonFile, 'utf8').trim()) {
  generate({
    theme: 'bootstrap', // Выберите тему отчета
    jsonFile: jsonFile,
    output: htmlFile,
    reportSuiteAsScenarios: true,
    launchReport: true,
    metadata: {
      'App Version': '1.0.0',
      'Test Environment': 'STAGING',
      Browser: 'Chrome 91.0.4472.101',
      Platform: 'Windows 10',
      Parallel: 'Scenarios',
      Executed: 'Remote',
    },
  });
  // eslint-disable-next-line
  console.log(`HTML report generated: ${htmlFile}`);
} else {
  // eslint-disable-next-line
  console.error(`JSON report file is missing or empty: ${jsonFile}`);
}
