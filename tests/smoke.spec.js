// @ts-check
const fs = require('fs');
const path = require('path');
const { test, expect } = require('@playwright/test');

const KEYWORD_REGEX = /end\s+of\s+line/i;
const RAW_FRONT_MATTER_REGEX = /^---\s*[\r\n]+layout:\s*home/im;
const screenshotPath = process.env.HOMEPAGE_SCREENSHOT_PATH;

test('homepage renders the generated Jekyll home page', async ({ page }) => {
  // Navigate and check HTTP status
  const response = await page.goto('/', { timeout: 30000 });

  if (!response || response.status() !== 200) {
    const status = response ? response.status() : 'no response';
    throw new Error(`Smoke test failed: homepage returned HTTP ${status}`);
  }

  const html = await page.content();
  if (RAW_FRONT_MATTER_REGEX.test(html)) {
    throw new Error('Smoke test failed: homepage is serving raw Jekyll front matter');
  }

  await expect(page).toHaveTitle(/Harshit Yadav/i);
  await expect(page.locator('#sidebar')).toContainText(KEYWORD_REGEX, {
    timeout: 30000,
    message: 'Smoke test failed: keyword "End of Line" not found in rendered sidebar',
  });
  await expect(page.locator('#post-list article')).toHaveCount(10);

  if (screenshotPath) {
    fs.mkdirSync(path.dirname(screenshotPath), { recursive: true });
    await page.screenshot({ path: screenshotPath, fullPage: true });
  }
});
