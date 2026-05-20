// @ts-check
const fs = require('fs');
const path = require('path');
const { test, expect } = require('@playwright/test');

const KEYWORD_REGEX = /end\s+of\s+line/i;
const screenshotPath = process.env.HOMEPAGE_SCREENSHOT_PATH;

test('homepage contains keyword "End of Line"', async ({ page }) => {
  // Navigate and check HTTP status
  const response = await page.goto('/', { timeout: 30000 });

  if (!response || response.status() !== 200) {
    const status = response ? response.status() : 'no response';
    throw new Error(`Smoke test failed: homepage returned HTTP ${status}`);
  }

  // Assert the visible body text contains the keyword
  await expect(page.locator('body')).toContainText(KEYWORD_REGEX, {
    timeout: 30000,
    message: 'Smoke test failed: keyword "End of Line" not found in page body',
  });

  if (screenshotPath) {
    fs.mkdirSync(path.dirname(screenshotPath), { recursive: true });
    await page.screenshot({ path: screenshotPath, fullPage: true });
  }
});
