# 📘 Documentación Técnica Completa: Sistema de Logística Inteligente (Route Assigner)

Este documento detalla la estructura, lógica, tecnologías y flujos de trabajo del proyecto **Logistics Dashboard**. Diseñado para desarrolladores y administradores que deseen entender la profundidad del sistema.

---

## 1. 🏗️ Arquitectura y Stack Tecnológico

El proyecto es una **Single Page Application (SPA)** moderna construida para velocidad, interactividad y facilidad de despliegue.

*   **Frontend Framework:** [React 18](https://react.dev/) (construido con [Vite](https://vitejs.dev/) para máximo rendimiento).
*   **Lenguaje:** JavaScript (ES6+).
*   **Mapas y Georreferenciación:**
    *   **MapLibre GL JS:** Motor de renderizado de mapas vectorial (Open Source).
    *   **Google Maps API:** Proveedor de Tiles (capas visuales), Geocodificación y Algoritmos de Tráfico (TSP).
*   **Inteligencia Artificial:**
    *   **Google Gemini 1.5 Flash:** Procesamiento de lenguaje natural para "entender" direcciones escritas en texto libre (chat).
*   **Enrutamiento y Backend (Lógico):**
    *   **wouter:** Enrutador ligero para manejar las vistas (`/` Dashboard, `/driver/:id`).
    *   **localStorage:** Persistencia de datos local y sincronización en tiempo real entre pestañas (Demo Sync).
    *   **n8n (Webhooks):** Orquestador de automatizaciones para enviar correos y notificaciones a conductores.
*   **Estilos:** CSS Modules + Estilos en línea (JSS) para componentes dinámicos responsivos.

---

## 2. 📂 Estructura del Proyecto

```bash
logistics-dashboard/
├── .env                  # Variables de entorno (API Keys de Google, Gemini, N8N)
├── index.html            # Punto de entrada HTML
├── vercel.json           # Configuración de despliegue y reglas de ruteo SPA
├── src/
│   ├── App.jsx           # Enrutador principal (Switch entre Admin y Driver)
│   ├── main.jsx          # Montaje de la aplicación React
│   │
│   ├── api/              # (Opcional) Funciones Serverless para Vercel
│   │
│   ├── components/       # Bloques de construcción de la UI
│   │   ├── AdminDashboard.jsx  # 🧠 CEREBRO PRINCIPAL. Maneja el estado global.
│   │   ├── Sidebar.jsx         # Panel lateral (Chat IA, Lista de Puntos, Opciones).
│   │   ├── MapComponent.jsx    # Visualización del mapa, marcadores y líneas.
│   │   ├── DriverView.jsx      # Vista móvil para el conductor.
│   │   ├── Dashboard.jsx       # Panel de métricas y estadísticas.
│   │   └── AgentsPanel.jsx     # Gestión de conductores (CRUD).
│   │
│   └── utils/            # Lógica pura y servicios
│       ├── geminiService.js            # Conexión con la IA.
│       ├── geocodingService.js         # Conversión Dirección <-> Coordenadas.
│       ├── googleDirectionsService.js  # Algoritmos de optimización (Greedy, 2-Opt, Google).
│       ├── osrmService.js              # (Fallback) Servicio de rutas open source.
│       └── metricsService.js           # Cálculo de estadísticas de uso.
```

---

## 3. 🧠 Lógica Detallada de los Módulos

### A. Módulo de Administración (`AdminDashboard.jsx`)
Es el componente padre. Su responsabilidad es:
1.  **Orquestar Estado:** Almacena los `waypoints` (paradas), la configuración de ruta (inicio/fin fijo) y los agentes.
2.  **Sincronización:** Escucha eventos del navegador (`window.addEventListener('storage')`). Si un conductor marca una entrega en otra pestaña, este componente se actualiza automáticamente.
3.  **Integración N8N:** Cuando se asigna una ruta, empaqueta los datos y los envía al webhook de n8n para notificar al conductor.

### B. Módulo de Mapas (`MapComponent.jsx`)
No es solo una imagen pasiva. Contiene lógica visual avanzada:
*   **Capas Dinámicas:** Dibuja la "línea verde" (preview) y la "línea azul" (ruta final) usando fuentes GeoJSON.
*   **Marcadores Interactivos:** Diferencia visualmente entre Inicio (Verde), Fin (Rojo) e Intermedios (Azul).
*   **Control de Zoom Inteligente:** Usa `fitBounds` con padding para asegurar que la ruta siempre se vea completa, sin importar si es de 1km o 100km.
*   **Responsividad:** Detecta móvil para mover controles (como el botón "Limpiar") y evitar que queden tapados por la interfaz.

### C. Módulo de Optimización (`googleDirectionsService.js`)
El corazón matemático. Ofrece 4 estrategias:
1.  **Orden Original:** Respeta estrictamente la secuencia del usuario.
2.  **Vecino Más Cercano (Greedy):** Desde el punto A, busca el B más cercano, luego el C. Rápido pero no siempre perfecto.
3.  **Algoritmo Genético (2-Opt Hybrid):** Toma una ruta y prueba "desenredar" cruces. Si intercambiar el destino B con el C mejora la distancia, lo hace. Repite esto miles de veces.
4.  **Google TSP (Pro):** Usa la API de Google "Optimize Waypoints". Considera tráfico real, giros a la izquierda y velocidad de vía. (Limitado a 25 puntos).

### D. Vista del Conductor (`DriverView.jsx`)
Una App web progresiva (PWA)-like para móviles:
*   **Stateless (sin servidor):** Lee los datos de la ruta desde la URL (`?data=...base64...`). Esto permite que funcione sin backend.
*   **Navegación:** Botones que abren directamente la App nativa de Google Maps/Waze con las coordenadas.
*   **Estado Local:** Al marcar "Completado", guarda en `localStorage`, lo que dispara la sincronización con el panel del administrador si están en el mismo dispositivo.

---

## 4. 🤖 Flujo de la Inteligencia Artificial (Gemini)
El archivo `geminiService.js` contiene el prompt de sistema (System Prompt) que instruye a la IA.
**Flujo:**
1.  Usuario escribe: *"Tengo que ir a la calle 30 con 4 y luego al plaza del parque"*.
2.  Gemini recibe el texto y contexto (ubicación actual).
3.  Gemini responde con un **JSON estructurado** (no texto): `[{ "address": "Calle 30 #4...", "lat": ..., "lng": ... }]`.
4.  El sistema parsea ese JSON y pone los marcadores en el mapa automáticamente.

---

## 5. 🚀 Guía de Uso Paso a Paso

### Paso 1: Agregar Direcciones
*   **Manual:** Usa la barra de búsqueda (autocompletado de Google Places).
*   **IA:** Abre el chat (botón Robot) y dicta o escribe direcciones sueltas.
*   **Mapa:** Activa "Modo Agregar Puntos" y toca el mapa directamente.

### Paso 2: Configurar y Optimizar
1.  Define si tienes un **Inicio Fijo** (tu bodega) o **Fin Fijo**.
2.  Haz clic en **"⚡ Optimizar Ruta"**.
3.  Se abrirá/desplegará el panel de algoritmos. En PC verás tarjetas detalladas; en móvil un carrusel.
4.  Usa el botón **(i)** para leer cómo funciona cada algoritmo.
5.  Selecciona la mejor opción y dale a **"Aplicar"**.

### Paso 3: Asignar a Conductor
1.  Ve a la pestaña **"Conductores"** (icono usuarios).
2.  Selecciona un conductor disponible (o crea uno).
3.  Clic en **"Asignar Ruta"**.
4.  El sistema generará un enlace único y (si está configurado) enviará un correo.

### Paso 4: Ejecución (Conductor)
1.  El conductor abre el enlace en su celular.
2.  Ve la lista de paradas ordenada.
3.  Pulsa **"Navegar"** para ir.
4.  Pulsa **"Entregar"** al llegar. (Esto actualiza la barra de progreso verde).

---

## 6. 🔧 Comandos Clave (Desarrollo)

*   `npm run dev`: Inicia el servidor local de desarrollo.
*   `npm run build`: Genera la carpeta `dist/` optimizada para producción.
*   `git push origin main`: Envía cambios a GitHub (y dispara deploy en Vercel si está conectado).

---

> **Nota de Seguridad:** Este proyecto usa API Keys de Google Maps. Asegúrate de nunca subir el archivo `.env` real a repositorios públicos. Las claves deben tener restricciones HTTP (referrers) configuradas en la consola de Google Cloud para evitar uso no autorizado.
