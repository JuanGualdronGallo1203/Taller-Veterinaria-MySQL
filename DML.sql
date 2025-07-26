-- Insertar dueños
INSERT INTO Duenos (Cedula, nombre, telefono, direccion) VALUES
('1234567890', 'María González', '3001234567', 'Calle 123 #45-67'),
('2345678901', 'Carlos Pérez', '3102345678', 'Av. Principal #22-33'),
('3456789012', 'Ana Rodríguez', '3203456789', 'Carrera 56 #78-90'),
('4567890123', 'Luis Sánchez', '3014567890', 'Diagonal 34 #12-34'),
('5678901234', 'Sofía Martínez', '3155678901', 'Transversal 78 #56-78');

-- Insertar veterinarios
INSERT INTO Veterinario (nombre, Cedula) VALUES
('Dr. Jorge Ramírez', '9876543210'),
('Dra. Laura Torres', '8765432109'),
('Dr. Andrés Gómez', '7654321098');

-- Insertar mascotas
INSERT INTO Mascotas (ID_Duenos, nombre, especie, raza, edad, sexo, vacunado) VALUES
(1, 'Max', 'Perro', 'Labrador', 3, 'Macho', TRUE),
(1, 'Luna', 'Gato', 'Siamés', 2, 'Hembra', TRUE),
(2, 'Rocky', 'Perro', 'Bulldog', 5, 'Macho', FALSE),
(3, 'Milo', 'Gato', 'Persa', 1, 'Macho', TRUE),
(4, 'Bella', 'Perro', 'Chihuahua', 4, 'Hembra', TRUE),
(5, 'Simba', 'Gato', 'Mestizo', 2, 'Macho', FALSE),
(2, 'Coco', 'Perro', 'Golden Retriever', 2, 'Macho', TRUE),
(3, 'Nala', 'Gato', 'Angora', 3, 'Hembra', TRUE),
(4, 'Thor', 'Perro', 'Husky', 1, 'Macho', FALSE),
(5, 'Lola', 'Perro', 'Poodle', 7, 'Hembra', TRUE);

-- Insertar servicios
INSERT INTO Servicios (nombre, descripcion, precio) VALUES
('Consulta médica', 'Revisión general de salud', 50000),
('Vacunación', 'Aplicación de vacunas según edad', 30000),
('Baño completo', 'Baño con shampoo especializado', 40000),
('Desparasitación', 'Aplicación de antiparasitarios', 35000),
('Corte de uñas', 'Corte y limado de uñas', 20000);

-- Insertar visitas
INSERT INTO Visitas (fecha, ID_Servicios, ID_Mascotas, ID_Veterinario) VALUES
('2023-01-15', 1, 1, 1),
('2023-01-20', 2, 1, 2),
('2023-02-05', 3, 2, 3),
('2023-02-10', 1, 3, 1),
('2023-02-15', 4, 4, 2),
('2023-03-01', 5, 5, 3),
('2023-03-10', 2, 6, 1),
('2023-03-15', 3, 7, 2),
('2023-04-05', 1, 8, 3),
('2023-04-20', 4, 9, 1);

-- Insertar tratamientos
INSERT INTO Tratamientos (ID_Visitas, ID_Veterinario, nombre, observacion) VALUES
(1, 1, 'Antibióticos', 'Para infección en oído'),
(4, 1, 'Analgésicos', 'Dolor articular'),
(5, 2, 'Antiparasitario', 'Aplicación mensual'),
(7, 1, 'Vacuna antirrábica', 'Refuerzo anual'),
(10, 1, 'Vitamina B12', 'Para mejorar apetito');