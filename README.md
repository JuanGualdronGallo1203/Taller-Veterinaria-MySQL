# Taller-Veterinaria-MySQL

Este proyecto implementa una base de datos relacional para la veterinaria , la cual permite gestionar información clave sobre dueños de mascotas, mascotas, servicios veterinarios, visitas, tratamientos y veterinarios.

---

## 📁 Archivos Incluidos

- `estructura.sql`: Script DDL para crear la base de datos y todas sus tablas con llaves primarias y foráneas.
- `datos.sql`: Script DML con datos de prueba insertados en las tablas.
- `consultas.sql`: Script DQL con más de 20 consultas SQL que exploran diversos aspectos de la información.

---

## 🧱 Estructura de la Base de Datos

### 🧑‍⚕️ Veterinario
- `ID`: PK autoincremental.
- `nombre`: Nombre completo del veterinario.
- `Cedula`: Identificador único.

### 👤 Dueños
- `ID`: PK autoincremental.
- `Cedula`, `nombre`, `telefono`, `direccion`.

### 🐶 Mascotas
- `ID`: PK autoincremental.
- `ID_Duenos`: FK que referencia al dueño.
- `nombre`, `especie`, `raza`, `edad`, `sexo`, `vacunado`.

### 🧼 Servicios
- `ID`: PK autoincremental.
- `nombre`, `descripcion`, `precio`.

### 📅 Visitas
- `ID`: PK autoincremental.
- `fecha`
- `ID_Servicios`, `ID_Mascotas`, `ID_Veterinario`: FK que referencian las otras tablas.

### 💊 Tratamientos
- `ID`: PK autoincremental.
- `ID_Visitas`, `ID_Veterinario`: FK.
- `nombre`, `observacion`.

---

## 🧪 Datos Insertados

- **Dueños:** 5 registros
- **Veterinarios:** 3 registros
- **Mascotas:** 10 registros
- **Servicios:** 5 registros
- **Visitas:** 10 registros
- **Tratamientos:** 5 registros

---

## 🔍 Consultas Incluidas (DQL)

El archivo `consultas.sql` contiene al menos **21 consultas** SQL que demuestran:

### 📌 Consultas requeridas
- ✔️ **Creación de tabla desde consulta** (`MascotasVacunadas`)
- ✔️ **Alias** en campos y subconsultas
- ✔️ Funciones de agregación: `COUNT`, `AVG`, `MAX`, `SUM`
- ✔️ Funciones de texto: `CONCAT`, `UPPER`, `LOWER`, `TRIM`, `SUBSTRING`, `LENGTH`
- ✔️ Funciones numéricas: `ROUND`
- ✔️ Clasificaciones: `IF`, `CASE`
- ✔️ Agrupamientos con `GROUP BY`, `HAVING`
- ✔️ Subconsultas en `WHERE`, `IN`
- ✔️ `JOIN`, `LEFT JOIN`, múltiples joins
- ✔️ Agrupación con `GROUP_CONCAT`

---

## ⚙️ Uso del Proyecto

1. Ejecuta `estructura.sql` para crear las tablas en tu gestor MySQL.
2. Ejecuta `datos.sql` para cargar los registros iniciales.
3. Ejecuta `consultas.sql` para probar los distintos escenarios de consulta y análisis de datos.

---

 imagen del diagrama <img src="./img/Imagen de WhatsApp 2025-07-27 a las 20.18.09_7be6120c" alt="imagen" />
 video explicativo: <video src="https://drive.google.com/file/d/1OUKtHARn9ZpnDyUTJwANUVoKsKZxLKGf/view?usp=drivesdk">

## 🧑‍💻 Autor

**Cristian Pérez**
**Juan Sebastian Gualdron**
