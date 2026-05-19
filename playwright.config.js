// @ts-check
const { defineConfig, devices } = require('@playwright/test');

const port = process.env.PORT || '4000';
const siteDir = process.env.SITE_DIR || '_site';
const baseURL = process.env.PLAYWRIGHT_BASE_URL || `http://127.0.0.1:${port}`;

module.exports = defineConfig({
  testDir: './tests',
  retries: 0,
  reporter: 'list',
  use: {
    baseURL,
  },
  webServer: {
    command: `node tools/serve-static.js "${siteDir}" ${port}`,
    url: baseURL,
    reuseExistingServer: !process.env.CI,
    timeout: 30000,
  },
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
  ],
});
