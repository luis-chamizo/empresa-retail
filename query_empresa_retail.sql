/*Tabla Canal*/
insert into canal(can_nombre,can_tipo)
values('Facebook','Buscador');

select can_id_canal, can_nombre, can_tipo
from canal;

update canal
set can_nombre = 'Telegram', can_tipo = 'Red Social'
where can_id_canal = 5;

delete from canal where can_id_canal = 1;

/*Tabla de Clientes*/
INSERT INTO cliente
(cli_nombre, cli_apellido, cli_correo, cli_telefono, cli_ciudad, cli_fecha_registro)
VALUES
('Juan', 'Perez', 'juan.perez@gmail.com', '3001234567', 'Popayan', '2026-01-15'),
('Maria', 'Gomez', 'maria.gomez@gmail.com', '3012345678', 'Cali', '2026-01-20'),
('Carlos', 'Rodriguez', 'carlos.rodriguez@gmail.com', '3023456789', 'Bogota', '2026-02-05'),
('Laura', 'Martinez', 'laura.martinez@gmail.com', '3034567890', 'Medellin', '2026-02-10'),
('Andres', 'Lopez', 'andres.lopez@gmail.com', '3045678901', 'Pasto', '2026-02-18');

/* Tabla de Campania */

INSERT INTO campania
(cam_nombre, cam_presupuesto, cam_fecha_inicio, cam_fecha_final, canal_can_id_canal)
VALUES
('Campaña Regreso a Clases', 2500000, '2026-01-10', '2026-02-10', 2),
('Promocion Facebook Enero', 3000000, '2026-01-15', '2026-02-15', 3),
('Ofertas Especiales', 1800000, '2026-02-01', '2026-03-01', 4),
('Campaña Productos Nuevos', 4200000, '2026-02-15', '2026-03-15', 5),
('Descuentos Temporada', 3500000, '2026-03-01', '2026-04-01', 6);


/* Tabla de Interaccion */

INSERT INTO interaccion
(int_tipo, int_fecha, campania_cam_id_campania, cliente_cli_id_cliente)
VALUES
('visita', '2026-01-20', 1, 6),
('clic', '2026-01-25', 2, 7),
('comentario', '2026-02-10', 3, 8),
('descarga', '2026-02-20', 4, 9),
('clic', '2026-03-05', 5, 10);

/* Tabla de Conversion */

INSERT INTO conversion
(con_tipo, con_valor, con_fecha, cliente_cli_id_cliente)
VALUES
('compra', 150000, '2026-01-22', 6),
('registro', 0, '2026-01-27', 7),
('suscripcion', 50000, '2026-02-12', 8),
('compra', 280000, '2026-02-22', 9),
('compra', 175000, '2026-03-07', 10);