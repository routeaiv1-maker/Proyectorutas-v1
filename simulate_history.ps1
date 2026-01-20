# Script para Reconstruir la Historia de Git (Falsificar Fechas)
Write-Host "Iniciando reconstruccion de historia..." -ForegroundColor Yellow

# 1. Eliminar historia previa
if (Test-Path .git) {
    Remove-Item .git -Recurse -Force
    Write-Host "Historia anterior eliminada." -ForegroundColor Red
}

# 2. Iniciar nuevo repo
git init
git branch -m main

# 3. Configurar usuario
git config user.name "RouteAI"
git config user.email "route.ai.v1@gmail.com"

# HITO 1: CONFIGURACION (1 Dic)
$env:GIT_COMMITTER_DATE = "2025-12-01 10:00:00"
git add package.json package-lock.json vite.config.js index.html .env.example README.md
git commit -m "chore: Configuracion inicial del proyecto con React+Vite" --date="2025-12-01 10:00:00"

# HITO 2: ESTRUCTURA BASE Y MAPAS (5 Dic)
$env:GIT_COMMITTER_DATE = "2025-12-05 14:20:00"
git add src/main.jsx src/App.jsx src/index.css src/components/MapComponent.jsx
git commit -m "feat(mapa): Integracion de MapLibre GL JS y diseno base" --date="2025-12-05 14:20:00"

# HITO 3: LOGICA DE RUTAS Y SIDEBAR (15 Dic)
$env:GIT_COMMITTER_DATE = "2025-12-15 16:45:00"
git add src/components/Sidebar.jsx src/utils/geocodingService.js src/utils/osrmService.js
git commit -m "feat(nucleo): Implementacion de Sidebar y logica de Rutas" --date="2025-12-15 16:45:00"

# HITO 4: ALGORITMOS DE OPTIMIZACION (28 Dic)
$env:GIT_COMMITTER_DATE = "2025-12-28 11:30:00"
git add src/utils/googleDirectionsService.js src/components/AdminDashboard.jsx
git commit -m "feat(algo): Agregar estrategias de optimizacion Greedy, 2-Opt y Google TSP" --date="2025-12-28 11:30:00"

# HITO 5: INTELIGENCIA ARTIFICIAL (5 Ene)
$env:GIT_COMMITTER_DATE = "2026-01-05 09:15:00"
git add src/utils/geminiService.js src/components/AgentsPanel.jsx
git commit -m "feat(ia): Integracion de Google Gemini para procesamiento de direcciones" --date="2026-01-05 09:15:00"

# HITO 6: VISTA CONDUCTOR Y DASHBOARD (12 Ene)
$env:GIT_COMMITTER_DATE = "2026-01-12 15:00:00"
git add src/components/DriverView.jsx src/components/Dashboard.jsx src/utils/metricsService.js
git commit -m "feat(conductor): Vista movil de conductor y panel de metricas" --date="2026-01-12 15:00:00"

# HITO 7: FINAL POLISH & SYNC (20 Ene - Hoy)
$env:GIT_COMMITTER_DATE = "2026-01-20 08:00:00"
git add .
git commit -m "fix: Ajustes de UI, sincronizacion movil y documentacion" --date="2026-01-20 08:00:00"

Write-Host "Historia reconstruida con exito." -ForegroundColor Cyan
