// npx playwright test で実行（初回: npm init playwright@latest）
import { test, expect } from '@playwright/test';

test('top page has title', async ({ page }) => {
  await page.goto('https://example.com');
  await expect(page).toHaveTitle(/Example/);
});
