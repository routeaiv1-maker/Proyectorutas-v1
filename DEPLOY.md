# Guía de Despliegue: GitHub y Vercel

Esta guía te explica paso a paso cómo subir tu proyecto a GitHub y luego desplegarlo en Vercel.

## Parte 1: Subir a GitHub

Ya hemos configurado tu repositorio localmente. Los pasos que realizamos fueron:

1.  **Inicializar Git (`git init`)**: Transforma tu carpeta en un repositorio controlado por Git.
2.  **Agregar archivos (`git add .`)**: Prepara todos los archivos para ser guardados.
3.  **Guardar cambios (`git commit`)**: Guarda una "foto" del estado actual de tu código.
4.  **Renombrar rama (`git branch -M main`)**: El estándar moderno es llamar `main` a la rama principal.
5.  **Conectar remoto (`git remote add origin ...`)**: Vincula tu carpeta local con el servidor de GitHub.

### El paso final

Solo falta enviar tus archivos a la nube. Ejecuta este comando en tu terminal:

```bash
git push -u origin main
```

*Si es la primera vez, GitHub te pedirá usuario y contraseña (o token).*

---

## Parte 2: Desplegar en Vercel

Una vez tu código esté en GitHub, subirlo a internet (Vercel) es muy fácil:

1.  Ve a [vercel.com](https://vercel.com) e inicia sesión (puedes usar tu cuenta de GitHub).
2.  Haz clic en **"Add New..."** -> **"Project"**.
3.  Verás una lista de tus repositorios de GitHub. Importa `Proyectorutas-v1`.
4.  **Configuración del Proyecto**:
    *   **Framework Preset**: Vite (Vercel lo detectará automáticamente).
    *   **Root Directory**: `logistics-dashboard` (asegúrate de seleccionar la carpeta correcta si no está en la raíz).
    *   **Environment Variables**: Aquí es IMPORTANTE. Debes copiar las variables de tu archivo `.env` (como tu API Key de Google Maps y Gemini) y pegarlas aquí.
        *   `VITE_GOOGLE_MAPS_API_KEY`: [Tu clave]
        *   `VITE_GEMINI_API_KEY`: [Tu clave]
        *   `VITE_APP_URL`: (La URL que te dará Vercel, o déjala por defecto por ahora)

5.  Haz clic en **"Deploy"**.

¡Y ya está! Vercel construirá tu sitio y te dará un enlace público (ej. `proyectorutas-v1.vercel.app`) que podrás compartir con tus clientes y conductores.

### Actualizaciones Futuras

Cada vez que hagas cambios en tu código:

1.  `git add .`
2.  `git commit -m "Descripción del cambio"`
3.  `git push`

Vercel detectará el nuevo cambio en GitHub y actualizará tu sitio web automáticamente en segundos.
