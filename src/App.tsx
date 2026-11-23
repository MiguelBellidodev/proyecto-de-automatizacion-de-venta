import React from 'react';

export default function App() {
  return (
    <main className="min-h-screen bg-slate-950 text-white p-8">
      <h1 className="text-4xl font-extrabold mb-4">Automatización de Ventas</h1>
      <p className="text-slate-400 text-lg mb-8">
        Sistema integral de automatización comercial con CRM, WhatsApp Bot y Analytics.
      </p>
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="p-6 rounded-2xl border border-slate-800 bg-slate-900/60">
          <h3 className="font-bold mb-2">📊 Pipeline CRM</h3>
          <p className="text-sm text-slate-400">Gestión visual de oportunidades con deal scoring.</p>
        </div>
        <div className="p-6 rounded-2xl border border-slate-800 bg-slate-900/60">
          <h3 className="font-bold mb-2">🤖 Bot WhatsApp</h3>
          <p className="text-sm text-slate-400">Seguimiento automatizado con secuencias inteligentes.</p>
        </div>
        <div className="p-6 rounded-2xl border border-slate-800 bg-slate-900/60">
          <h3 className="font-bold mb-2">📈 Analytics</h3>
          <p className="text-sm text-slate-400">Métricas de conversión y ROI en tiempo real.</p>
        </div>
      </div>
    </main>
  );
}
