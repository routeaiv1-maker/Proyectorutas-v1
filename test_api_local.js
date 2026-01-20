// test_api_local.js
import handler from './api/ejemplo.js';

// 1. Simulamos la "Petición" (Request) que llegaría del navegador
const simulacionRequest = {
    query: {
        nombre: "Keyler" // Probamos enviando tu nombre
    }
};

// 2. Simulamos la "Respuesta" (Response) para ver qué nos devuelve la API
const simulacionResponse = {
    status: function (codigo) {
        console.log(`🟢 Estado HTTP: ${codigo}`);
        return this; // Permite encadenar .json()
    },
    json: function (datos) {
        console.log("📦 Datos devueltos por la API:");
        console.log(JSON.stringify(datos, null, 2));
    }
};

console.log("--- Iniciando Prueba de API Local ---");
handler(simulacionRequest, simulacionResponse);
console.log("--- Fin de la prueba ---");
