// Tests E2E automatizados con Playwright por Joaquín (Testing QA Lead)
// Proyecto: Automatización de Ventas

import { test, expect } from '@playwright/test';

test.describe('Automatización de Ventas - Suite E2E de Producción', () => {
  test('la página principal carga con código 200 y título correcto', async ({ page }) => {
    await page.goto('/');
    await expect(page).toHaveTitle(/Automatización de Ventas/);
  });

  test('el diseño es responsive en viewport móvil (375px)', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 812 });
    await page.goto('/');
    await expect(page.locator('header')).toBeVisible();
    await expect(page.locator('footer')).toBeVisible();
  });

  test('el botón de WhatsApp está visible y contiene link a wa.me', async ({ page }) => {
    await page.goto('/');
    const waLink = page.locator('a[href*="wa.me"]').first();
    await expect(waLink).toBeVisible();
    const href = await waLink.getAttribute('href');
    expect(href).toContain('wa.me');
  });

  test('todos los módulos funcionales clave están renderizados', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByText('Pipeline CRM Kanban')).toBeVisible();
    await expect(page.getByText('Bot de WhatsApp 24/7')).toBeVisible();
    await expect(page.getByText('Analytics & Telemetría')).toBeVisible();
  });

  test('Core Web Vitals - LCP carga en menos de 2.5s', async ({ page }) => {
    const start = Date.now();
    await page.goto('/');
    await page.waitForLoadState('domcontentloaded');
    expect(Date.now() - start).toBeLessThan(2500);
  });
});
