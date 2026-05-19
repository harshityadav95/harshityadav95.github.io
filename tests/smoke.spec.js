// @ts-check
const { test, expect } = require('@playwright/test');

const BASE_URL = 'http://localhost:4000';
const KEYWORD = 'End Of Line';

test('homepage contains keyword "End Of Line"', async ({ page }) => {
  // Navigate and check HTTP status
  const response = await page.goto(BASE_URL, { timeout: 30000 });

  if (!response || response.status() !== 200) {
    const status = response ? response.status() : 'no response';
    throw new Error(`Smoke test failed: homepage returned HTTP ${status}`);
  }

  // Assert the visible body text contains the keyword
  await expect(page.locator('body')).toContainText(KEYWORD, {
    timeout: 30000,
    message: `Smoke test failed: keyword '${KEYWORD}' not found in page body`,
  });
});
