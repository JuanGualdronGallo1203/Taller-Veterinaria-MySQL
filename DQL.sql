-- 1. Creación de tabla a partir de consulta (Mascotas vacunadas)
CREATE TABLE MascotasVacunadas AS
SELECT m.nombre AS mascota, d.nombre AS dueño, m.especie, m.raza
FROM Mascotas m
JOIN Duenos d ON m.ID_Duenos = d.ID
WHERE m.vacunado = TRUE;

-- 2. Alias en campos (Listado de dueños con información básica)
SELECT 
    nombre AS Nombre_Completo,
    telefono AS Teléfono_Contacto,
    direccion AS Dirección_Residencia
FROM Duenos;

-- 3. Alias en subconsultas (Mascotas con más visitas)
SELECT m.nombre AS Mascota, COUNT(v.ID) AS Total_Visitas
FROM Mascotas m
JOIN Visitas v ON m.ID = v.ID_Mascotas
GROUP BY m.nombre
ORDER BY Total_Visitas DESC;

-- 4. Funciones de agregación - COUNT (Total de mascotas por especie)
SELECT especie, COUNT(*) AS Cantidad_Mascotas
FROM Mascotas
GROUP BY especie;

-- 5. Funciones de agregación - AVG (Edad promedio de mascotas por especie)
SELECT especie, ROUND(AVG(edad), 1) AS Edad_Promedio
FROM Mascotas
GROUP BY especie;

-- 6. Funciones de agregación - MAX (Servicio más costoso)
SELECT nombre, precio AS Precio_Máximo
FROM Servicios
WHERE precio = (SELECT MAX(precio) FROM Servicios);

-- 7. Alias en funciones de agregación (Resumen de servicios)
SELECT 
    COUNT(*) AS Total_Servicios,
    AVG(precio) AS Precio_Promedio,
    SUM(precio) AS Valor_Total_Servicios
FROM Servicios;

-- 8. CONCAT (Información completa de dueños)
SELECT CONCAT(nombre, ' - Tel: ', telefono, ' - Dir: ', direccion) AS Información_Completa
FROM Duenos;

-- 9. UPPER, LOWER (Listado de mascotas en diferentes formatos)
SELECT 
    UPPER(nombre) AS Nombre_Mayúsculas,
    LOWER(especie) AS Especie_Minúsculas
FROM Mascotas;

-- 10. LENGTH, SUBSTRING (Nombres de mascotas y longitud)
SELECT 
    nombre,
    LENGTH(nombre) AS Longitud_Nombre,
    SUBSTRING(nombre, 1, 3) AS Primeras_3_Letras
FROM Mascotas;

-- 11. TRIM (Búsqueda exacta eliminando espacios)
SELECT nombre
FROM Duenos
WHERE TRIM(nombre) = 'María González';

-- 12. ROUND (Precio promedio de servicios con 2 decimales)
SELECT ROUND(AVG(precio), 2) AS Precio_Promedio_Redondeado
FROM Servicios;

-- 13. IF (Clasificación de mascotas por edad)
SELECT 
    nombre,
    edad,
    IF(edad < 2, 'Cachorro', IF(edad >= 5, 'Adulto Mayor', 'Adulto')) AS Etapa_Vida
FROM Mascotas;

-- 14. JOIN con GROUP BY (Veterinarios y cantidad de visitas atendidas)
SELECT 
    v.nombre AS Veterinario,
    COUNT(vis.ID) AS Visitas_Atendidas
FROM Veterinario v
JOIN Visitas vis ON v.ID = vis.ID_Veterinario
GROUP BY v.nombre
ORDER BY Visitas_Atendidas DESC;

-- 15. Consulta compleja con múltiples JOINs (Historial completo de visitas)
SELECT 
    d.nombre AS Dueño,
    m.nombre AS Mascota,
    s.nombre AS Servicio,
    vis.fecha AS Fecha_Visita,
    vet.nombre AS Veterinario,
    IFNULL(t.nombre, 'Sin tratamiento') AS Tratamiento
FROM Visitas vis
JOIN Mascotas m ON vis.ID_Mascotas = m.ID
JOIN Duenos d ON m.ID_Duenos = d.ID
JOIN Servicios s ON vis.ID_Servicios = s.ID
JOIN Veterinario vet ON vis.ID_Veterinario = vet.ID
LEFT JOIN Tratamientos t ON vis.ID = t.ID_Visitas
ORDER BY vis.fecha DESC;

-- Consulta adicional 16: Mascotas no vacunadas con sus dueños (uso de WHERE y JOIN)
SELECT 
    m.nombre AS Mascota,
    m.especie,
    d.nombre AS Dueño,
    d.telefono
FROM Mascotas m
JOIN Duenos d ON m.ID_Duenos = d.ID
WHERE m.vacunado = FALSE;

-- Consulta adicional 17: Servicios más solicitados (uso de GROUP BY y HAVING)
SELECT 
    s.nombre AS Servicio,
    COUNT(v.ID) AS Veces_Solicitado
FROM Servicios s
JOIN Visitas v ON s.ID = v.ID_Servicios
GROUP BY s.nombre
HAVING COUNT(v.ID) > 1
ORDER BY Veces_Solicitado DESC;

-- 16. JOIN con múltiples tablas y ORDER BY (Historial de visitas con detalles completos)
SELECT 
    d.nombre AS Dueño,
    m.nombre AS Mascota,
    s.nombre AS Servicio,
    s.precio AS Precio,
    vis.fecha AS Fecha,
    vet.nombre AS Veterinario
FROM Visitas vis
JOIN Mascotas m ON vis.ID_Mascotas = m.ID
JOIN Duenos d ON m.ID_Duenos = d.ID
JOIN Servicios s ON vis.ID_Servicios = s.ID
JOIN Veterinario vet ON vis.ID_Veterinario = vet.ID
ORDER BY vis.fecha DESC;

-- 17. GROUP BY con HAVING (Servicios con precio superior al promedio)
SELECT 
    nombre AS Servicio,
    precio
FROM Servicios
WHERE precio > (SELECT AVG(precio) FROM Servicios)
ORDER BY precio DESC;

-- 18. JOIN con LEFT JOIN (Todos los dueños y sus mascotas, incluso si no tienen)
SELECT 
    d.nombre AS Dueño,
    d.telefono,
    COUNT(m.ID) AS Cantidad_Mascotas
FROM Duenos d
LEFT JOIN Mascotas m ON d.ID = m.ID_Duenos
GROUP BY d.nombre, d.telefono;

-- 19. Subconsulta en WHERE (Mascotas que han recibido tratamientos)
SELECT 
    m.nombre AS Mascota,
    m.especie
FROM Mascotas m
WHERE m.ID IN (SELECT v.ID_Mascotas FROM Visitas v JOIN Tratamientos t ON v.ID = t.ID_Visitas);

-- 20. GROUP_CONCAT (Dueños con lista de sus mascotas)
SELECT 
    d.nombre AS Dueño,
    GROUP_CONCAT(m.nombre SEPARATOR ', ') AS Mascotas
FROM Duenos d
JOIN Mascotas m ON d.ID = m.ID_Duenos
GROUP BY d.nombre;

-- 21. CASE WHEN (Clasificación de precios de servicios)
SELECT 
    nombre AS Servicio,
    precio,
    CASE 
        WHEN precio < 30000 THEN 'Económico'
        WHEN precio BETWEEN 30000 AND 50000 THEN 'Regular'
        ELSE 'Premium'
    END AS Categoría_Precio
FROM Servicios
ORDER BY precio;