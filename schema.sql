-- Base de Datos Relacional: Automatización de Ventas
-- Autor: Mateo (Backend & DB Engineer)

CREATE TABLE IF NOT EXISTS leads (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  telefono VARCHAR(50),
  empresa VARCHAR(255),
  cargo VARCHAR(100),
  origen VARCHAR(100) DEFAULT 'web',
  score INT DEFAULT 0,
  etapa VARCHAR(50) DEFAULT 'nuevo',
  notas TEXT,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS pipeline_stages (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  orden INT NOT NULL,
  color VARCHAR(20) DEFAULT '#6366f1',
  activo BOOLEAN DEFAULT true
);

CREATE TABLE IF NOT EXISTS deals (
  id SERIAL PRIMARY KEY,
  lead_id INT REFERENCES leads(id),
  stage_id INT REFERENCES pipeline_stages(id),
  titulo VARCHAR(255) NOT NULL,
  valor NUMERIC(14,2) NOT NULL DEFAULT 0,
  probabilidad INT DEFAULT 50,
  fecha_cierre_estimada DATE,
  estado VARCHAR(50) DEFAULT 'abierto',
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS automation_workflows (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  trigger_event VARCHAR(100) NOT NULL,
  canal VARCHAR(50) DEFAULT 'whatsapp',
  mensaje_template TEXT NOT NULL,
  delay_minutos INT DEFAULT 0,
  activo BOOLEAN DEFAULT true,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mensajes_enviados (
  id SERIAL PRIMARY KEY,
  lead_id INT REFERENCES leads(id),
  workflow_id INT REFERENCES automation_workflows(id),
  canal VARCHAR(50) NOT NULL,
  contenido TEXT NOT NULL,
  estado VARCHAR(50) DEFAULT 'enviado',
  enviado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS analytics_eventos (
  id SERIAL PRIMARY KEY,
  tipo VARCHAR(100) NOT NULL,
  lead_id INT REFERENCES leads(id),
  deal_id INT REFERENCES deals(id),
  metadata JSONB,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO pipeline_stages (nombre, orden, color) VALUES
  ('Nuevo Lead', 1, '#6366f1'),
  ('Contactado', 2, '#8b5cf6'),
  ('Propuesta Enviada', 3, '#a855f7'),
  ('Negociación', 4, '#f59e0b'),
  ('Ganado', 5, '#10b981'),
  ('Perdido', 6, '#ef4444')
ON CONFLICT DO NOTHING;

CREATE INDEX IF NOT EXISTS idx_leads_etapa ON leads(etapa);
CREATE INDEX IF NOT EXISTS idx_leads_score ON leads(score DESC);
CREATE INDEX IF NOT EXISTS idx_deals_estado ON deals(estado);
CREATE INDEX IF NOT EXISTS idx_deals_stage ON deals(stage_id);
CREATE INDEX IF NOT EXISTS idx_mensajes_lead ON mensajes_enviados(lead_id);
CREATE INDEX IF NOT EXISTS idx_analytics_tipo ON analytics_eventos(tipo);
