# 📅 Cronograma de Trabajo y Asignación de Tareas - Logistics Dashboard
**Período:** 1 de Diciembre 2025 - 20 de Enero 2026

Este documento detalla la distribución de tareas y la línea de tiempo de ejecución del proyecto *Route Assigner*, asignada al equipo de desarrollo.

---

## 👥 Equipo de Desarrollo

| Nombre | Rol Principal | Enfoque |
|--------|--------------|---------|
| **José Andrés Domínguez Peñaloza** | Lead Dev / Backend Logic | Algoritmos de optimización, integración de Mapas y lógica del núcleo. |
| **Keyler David Guerra Urdaneta** | Frontend / UI-UX | Diseño de interfaz, Dashboards, estética del sistema y componentes React. |
| **Daniel Andrés Mejía de la Hoz** | Fullstack / Integraciones | Integración IA (Gemini), Vista del Conductor (Móvil) y Despliegue. |

---

## 📊 Diagrama de Gantt

```mermaid
gantt
    title Cronograma de Desarrollo - Logistics Dashboard
    dateFormat  YYYY-MM-DD
    axisFormat  %d/%m
    
    section 🚀 Fase 1: Inicialización
    Configuración entorno (Vite/React)       :done, jose, 2025-12-01, 3d
    Diseño de estructura de directorios      :done, keyler, 2025-12-01, 3d
    Configuración inicial Git y Repositorio  :done, daniel, 2025-12-02, 2d

    section 🗺️ Fase 2: Núcleo de Mapas
    Integración MapLibre GL JS              :done, jose, 2025-12-04, 5d
    Componentes UI Base (Sidebar, Botones)  :done, keyler, 2025-12-05, 6d
    Conexión API Google Maps (Tiles)        :done, daniel, 2025-12-06, 4d

    section 🧠 Fase 3: Lógica y Algoritmos
    Algoritmo Vecino Más Cercano (Greedy)   :done, jose, 2025-12-11, 5d
    Algoritmo 2-Opt (Genético Híbrido)      :done, jose, 2025-12-16, 7d
    Integración Google TSP (Optimization)   :done, jose, 2025-12-20, 5d
    Diseño de Tarjetas de Ruta y Feedback   :done, keyler, 2025-12-15, 6d

    section 🤖 Fase 4: Inteligencia Artificial
    Setup Gemini API y Prompt Engineering   :done, daniel, 2026-01-02, 5d
    Parsing de Direcciones a Coordenadas    :done, daniel, 2026-01-06, 4d
    Interfaz de Chat (RouteBot) UI          :done, keyler, 2026-01-04, 5d

    section 📱 Fase 5: Conductor y Móvil
    Desarrollo DriverView (Vista Móvil)     :done, daniel, 2026-01-10, 5d
    Sincronización Admin-Conductor (Sync)   :done, jose, 2026-01-14, 3d
    Estilos Responsivos y Animaciones       :done, keyler, 2026-01-12, 5d

    section 🚀 Fase 6: Cierre y Despliegue
    Refactorización y Limpieza de Código    :done, jose, 2026-01-18, 2d
    Documentación Técnica                   :done, daniel, 2026-01-19, 1d
    Despliegue final en Vercel              :done, keyler, 2026-01-20, 1d
```

---

## 📝 Detalle de Responsabilidades por Desarrollador

### 👨‍💻 José Andrés Domínguez (Lógica y Mapas)
*   **01-05 Dic:** Implementación del motor de mapas (`MapComponent`) y gestión de marcadores.
*   **11-23 Dic:** Desarrollo intensivo de `googleDirectionsService.js`. Creación de las estrategias de ruteo (`greedy`, `two-opt`) y lógica matemática de distancias.
*   **14-17 Ene:** Implementación de la lógica de sincronización `localStorage` para comunicar el Dashboard con la vista del conductor.
*   **18 Ene:** Revisión de performance y corrección de bugs críticos en el renderizado de líneas.

### 👨‍🎨 Keyler David Guerra (Frontend y Experiencia)
*   **01-10 Dic:** Creación del sistema de diseño (colores oscuros, tarjetas, tipografías). Construcción de `Sidebar.jsx`.
*   **15-22 Dic:** Diseño de las tarjetas de algoritmos ("Ruta Rápida", "Genético") y visualización de estadísticas (Km, Tiempo).
*   **04-09 Ene:** Diseño del Chatbot (`RouteBot`) y sus burbujas de mensaje.
*   **12-16 Ene:** Adaptación "Mobile First". Asegurar que la UI se vea perfecta en celulares (Carrusel de opciones, botones flotantes).
*   **20 Ene:** Despliegue y configuración visual final.

### 👨‍🔧 Daniel Andrés Mejía (Integraciones y Móvil)
*   **02-05 Dic:** Configuración de repositorios y variables de entorno (`.env`).
*   **02-08 Ene:** Integración con Google Gemini. Desarrollo del `geminiService.js` para traducir texto natural a coordenadas JSON.
*   **10-15 Ene:** Construcción de la `DriverView.jsx`. Lógica para leer parámetros URL y botones de "Navegar con Waze/Maps".
*   **19 Ene:** Redacción de documentación técnica y manuales de usuario.
