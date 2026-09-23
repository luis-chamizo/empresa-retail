-- ==== ACTIVIDAD 1: GESTIÓN DE PEDIDOS ====
CREATE DATABASE IF NOT EXISTS gestion_pedidos;
USE gestion_pedidos;
CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY,
  nom_cliente VARCHAR(50) NOT NULL,
  estado CHAR(2) NOT NULL
);
CREATE TABLE pedidos (
  id_orden INT PRIMARY KEY,
  fecha DATE NOT NULL,
  id_cliente INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
CREATE TABLE items (
  num_item INT PRIMARY KEY,
  desc_item VARCHAR(50) NOT NULL,
  precio DECIMAL(10,2) NOT NULL
);
CREATE TABLE detalle_pedido (
  id_orden INT,
  num_item INT,
  cant INT NOT NULL,
  PRIMARY KEY (id_orden, num_item),
  FOREIGN KEY (id_orden) REFERENCES pedidos(id_orden),
  FOREIGN KEY (num_item) REFERENCES items(num_item)
);
INSERT INTO clientes VALUES (101,'MARTI','CA'),(107,'HERMAN','WI'),(110,'WE-SPORTS','MI');
INSERT INTO pedidos VALUES (2301,'2003-02-23',101),(2302,'2003-02-25',107),(2303,'2003-02-27',110);
INSERT INTO items VALUES (3786,'RED',35),(4011,'RAQUETA',65),(9132,'PAQ-3',4.75),(5794,'PAQ-6',5),(3142,'FUNDA',10);
INSERT INTO detalle_pedido VALUES (2301,3786,3),(2301,4011,6),(2301,9132,8),(2302,5794,4),(2303,4011,2),(2303,3142,2);

-- ==== ACTIVIDAD 2: GESTIÓN PELÍCULAS ALQUILADAS ====
CREATE DATABASE IF NOT EXISTS gestion_peliculas;
USE gestion_peliculas;
CREATE TABLE saludos (
  id_saludo INT PRIMARY KEY,
  salutation VARCHAR(10) NOT NULL
);
CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY,
  full_names VARCHAR(60) NOT NULL,
  physical_address VARCHAR(100) NOT NULL,
  id_saludo INT NOT NULL,
  FOREIGN KEY (id_saludo) REFERENCES saludos(id_saludo)
);
CREATE TABLE peliculas (
  id_pelicula INT PRIMARY KEY,
  movie VARCHAR(80) NOT NULL
);
CREATE TABLE alquileres (
  id_cliente INT,
  id_pelicula INT,
  PRIMARY KEY (id_cliente, id_pelicula),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula)
);
INSERT INTO saludos VALUES (1,'Mr.'),(2,'Ms.');
INSERT INTO clientes VALUES (1,'Janet Jones','First Street Plot No 4',2),(2,'Robert Phil','3rd Street 34',1),(3,'Robert Phil','5th Avenue',1);
INSERT INTO peliculas VALUES (1,'Pirates of the Caribbean'),(2,'Clash of the Titans'),(3,'Forgetting Sarah Marshal'),(4,'Daddy''s Little Girls');
INSERT INTO alquileres VALUES (1,1),(1,2),(2,3),(2,4),(3,2);

-- ==== ACTIVIDAD 3: GESTIÓN TIENDA DE TECNOLOGÍA ====
CREATE DATABASE IF NOT EXISTS gestion_tienda;
USE gestion_tienda;
CREATE TABLE clientes (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(60) NOT NULL
);
CREATE TABLE productos (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(60) NOT NULL
);
CREATE TABLE compras (
  customer_id INT,
  product_id INT,
  PRIMARY KEY (customer_id, product_id),
  FOREIGN KEY (customer_id) REFERENCES clientes(customer_id),
  FOREIGN KEY (product_id) REFERENCES productos(product_id)
);
INSERT INTO clientes VALUES (101,'John Doe'),(102,'Jane Smith'),(103,'Alice Brown');
INSERT INTO productos VALUES (1,'Laptop'),(2,'Mouse'),(3,'Tablet'),(4,'Keyboard'),(5,'Monitor'),(6,'Pen');
INSERT INTO compras VALUES (101,1),(101,2),(102,3),(103,4),(103,5),(103,6);

-- ==== ACTIVIDAD 4: GESTIÓN BIBLIOTECA ====
CREATE DATABASE IF NOT EXISTS gestion_biblioteca;
USE gestion_biblioteca;
CREATE TABLE clientes (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(60) NOT NULL,
  customer_email VARCHAR(80) NOT NULL UNIQUE,
  customer_address VARCHAR(120) NOT NULL
);
CREATE TABLE libros (
  book_id INT PRIMARY KEY,
  book_title VARCHAR(100) NOT NULL,
  book_author VARCHAR(60) NOT NULL,
  book_price DECIMAL(10,2) NOT NULL
);
CREATE TABLE pedidos (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES clientes(customer_id)
);
CREATE TABLE detalle_pedido (
  order_id INT,
  book_id INT,
  quantity INT NOT NULL,
  PRIMARY KEY (order_id, book_id),
  FOREIGN KEY (order_id) REFERENCES pedidos(order_id),
  FOREIGN KEY (book_id) REFERENCES libros(book_id)
);
INSERT INTO clientes VALUES
 (1,'John Smith','john@email.com','123 Main St, Boston, MA 02101'),
 (2,'Jane Doe','jane@email.com','456 Oak Avenue, Portland, OR 97201'),
 (3,'Sarah Johnson','sarah.j@company.com','789 Pine Street, Seattle, WA 98101');
INSERT INTO libros VALUES (1,'Database Design Principles','C.J. Date',45.99),(2,'SQL Cookbook','Anthony Molinaro',39.99),(3,'Advanced SQL Techniques','Joe Celko',52.99);
INSERT INTO pedidos VALUES (1,1,'2024-01-15'),(2,1,'2024-01-20'),(3,2,'2024-01-18'),(4,1,'2024-02-01'),(5,3,'2024-02-03');
INSERT INTO detalle_pedido VALUES (1,1,2),(1,2,1),(2,1,1),(3,2,1),(4,3,1),(5,1,3);

-- ==== ACTIVIDAD 5: GESTIÓN DE UN VIVERO ====
CREATE DATABASE IF NOT EXISTS gestion_vivero;
USE gestion_vivero;
CREATE TABLE locaciones (
  location_code INT PRIMARY KEY,
  location_name VARCHAR(60) NOT NULL
);
CREATE TABLE tipos_suelo (
  soil_category CHAR(1) PRIMARY KEY,
  soil_description VARCHAR(40) NOT NULL
);
CREATE TABLE plantas (
  plant_code INT PRIMARY KEY,
  plant_name VARCHAR(40) NOT NULL,
  soil_category CHAR(1) NOT NULL,
  FOREIGN KEY (soil_category) REFERENCES tipos_suelo(soil_category)
);
CREATE TABLE locacion_planta (
  location_code INT,
  plant_code INT,
  PRIMARY KEY (location_code, plant_code),
  FOREIGN KEY (location_code) REFERENCES locaciones(location_code),
  FOREIGN KEY (plant_code) REFERENCES plantas(plant_code)
);
INSERT INTO locaciones VALUES (11,'Kirstenbosch Gardens'),(12,'Karbonkelberg Mountains');
INSERT INTO tipos_suelo VALUES ('A','Sandstone'),('B','Sandstone/limestone'),('C','Limestone');
INSERT INTO plantas VALUES (431,'Leucadendron','A'),(446,'Protea','B'),(482,'Erica','C'),(449,'Restio','B');
INSERT INTO locacion_planta VALUES (11,431),(11,446),(11,482),(12,431),(12,449);

