# Documento de Especificación Funcional (DEF) - Automatización de Ventas
> Autor: Valeria (Analista Funcional Lead & Product Owner)
> Deadline Estricto: 3 a 4 horas (Entrega Urgente Express)
> Estado: Aprobado para Producción en Vercel

## 1. Objetivo del Producto
Automatizar el ciclo de vida del lead desde la primera interacción hasta el cierre comercial, minimizando la latencia de respuesta a menos de 60 segundos y garantizando una tasa de seguimiento del 100%.

## 2. Requerimientos Funcionales (RF)
- **RF-01:** Captura omnicanal de leads (formulario web, WhatsApp directo, API webhooks).
- **RF-02:** Scoring automatizado basado en cargo, tamaño de empresa y rapidez de respuesta.
- **RF-03:** Tablero Kanban con etapas: Nuevo Lead ➔ Contactado ➔ Propuesta Enviada ➔ Negociación ➔ Ganado/Perdido.
- **RF-04:** Secuencias automatizadas de seguimiento por WhatsApp con variables de personalización.
- **RF-05:** Telemetría de conversión y reportes ejecutivos en ARS/USD.

## 3. Criterios de Aceptación (DoD)
- Certificación Playwright E2E sin fallas.
- Responsive mobile-first de 375px a 1440px.
- Cero errores en consola de JavaScript y despliegue HTTPS en Vercel.
