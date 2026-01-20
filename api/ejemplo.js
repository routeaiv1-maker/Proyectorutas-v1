export default function handler(request, response) {
    // 1. Recibimos datos (por ejemplo, alguien nos pregunta por una ruta)
    const { nombre } = request.query;

    // 2. Procesamos (aquí podrías consultar una base de datos real)
    const saludo = nombre ? `Hola ${nombre}, bienvenido a la API de RouteAI` : 'Hola desconocido';

    const datos = {
        mensaje: saludo,
        estado: 'activo',
        servicios_disponibles: ['optimizacion', 'geocodificacion'],
        fecha: new Date().toISOString()
    };

    // 3. Respondemos en formato JSON (lo que entienden las máquinas)
    response.status(200).json(datos);
}
