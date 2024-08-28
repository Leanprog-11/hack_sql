create table discounts(
  id_discount serial primary key,
  porcentage DECIMAL(5, 2),
  status VARCHAR (50) not null 
);

create table offers(
  id_offer serial primary key,
   status VARCHAR (50) not null 
);

create table products_customers(
  id_customer INTEGER,
  id_product integer not NULL
);

create table products(
  id_product serial primary key,
  id_discount integer not NULL,
  id_offer integer not NULL,
  id_tax integer not NULL,
  name varchar(50) not null,
  detail VARCHAR(255) not null,
  maximum_stock INT,
  minimun_stock INT,
  current_stock INT,
  price DECIMAL(10, 2) CHECK (price >= 0), 
  price_with_tax DECIMAL(10, 2) CHECK (price_with_tax >= 0)
);

create table customers(
  id_customer serial primary key,
  id_country integer not NULL,
  id_role integer not NULL,
  email varchar(100) not null,
  name varchar(50) not null,
  age INT,
  password VARCHAR(255),
  physical_address VARCHAR(255)
);

create table invoices(
  id_invoice serial primary key,
  id_customer INTEGER NOT nULL,
  id_payment integer not null,
  id_invoice_status integer not null,
  date DATE NOT NULL,
  total_to_pay INT
  );
  
  create table countries(
  id_country serial primary key,
  name varchar(50) not null 
);

create table roles(
  id_role serial primary key,
  name varchar(50) not null 
);

create table orders(
  id_order serial primary key,
  id_invoice integer not NULL,
  id_product integer not NULL,
  detail VARCHAR(255) not null,
  amount INT,
  price DECIMAL(10, 2) CHECK (price >= 0)
);

create table invoice_status(
  id_invoice_status serial primary key,
  status VARCHAR (50) not null
);

create table payments(
  id_payment serial primary key,
  type VARCHAR (50) not null
);

create table taxes(
  id_tax serial primary key,
  porcentage DECIMAL(5, 2)
);

ALTER TABLE products
ADD FOREIGN KEY (id_discount) REFERENCES discounts(id_discount),
ADD FOREIGN key (id_offer) REFERENCES offers(id_offer),
ADD FOREIGN key (id_tax) REFERENCES taxes(id_tax);

ALTER TABLE invoices
ADD FOREIGN KEY (id_customer) REFERENCES customers(id_customer),
ADD FOREIGN key (id_payment) REFERENCES payments(id_payment),
ADD FOREIGN key (id_invoice_status) REFERENCES invoice_status(id_invoice_status);

ALTER TABLE products_customers
ADD FOREIGN KEY (id_product) REFERENCES products(id_product),
ADD FOREIGN key (id_customer) REFERENCES customers(id_customer);

ALTER TABLE customers
ADD FOREIGN KEY (id_country) REFERENCES countries(id_country),
ADD FOREIGN key (id_role) REFERENCES roles(id_role);

ALTER TABLE orders
ADD FOREIGN KEY (id_product) REFERENCES products(id_product),
ADD FOREIGN key (id_invoice) REFERENCES invoices(id_invoice);

insert into countries (name)
values ('Argentina'), ('España'), ('Brazil');

SELECT * FROM customers;

insert into taxes (porcentage)
VALUES (25), (40), (15);

insert into roles (name)
VALUES ('Administrador'), ('Especialista'), ('Tecnico');

INSERT into customers (id_country, id_role, email, name, age, password, physical_address)
VALUES (1,2, 'foo@foo.com', 'Ivana', 23, 'Ivana*24', 'Buenos Aires'), (2,3, 'faaz@fazz.com', 'Rosa', 30, 'Rosa*24', 'Madrid'), (3,1, 'qux@qux.com', 'Victor', 18, 'Victor*24', 'Rio Janeiro');

INSERT into discounts (status, porcentage)
VALUES ('Activo', 40), ('Sin descuento', 0), ('En evaluacion', 0);

INSERT into offers (status)
VALUES ('En oferta'), ('Sin oferta'), ('Poco tiempo de oferta');

INSERT INTO payments (type)
VALUES ('Efectivo'), ('Credito'), ('Debito');

INSERT INTO products (id_discount, id_offer, id_tax, name, detail, maximum_stock, minimun_stock, current_stock, price, price_with_tax)
VALUES (1,1,1, 'Cargador', 'Carga rapida', 150, 30, 80, 25.50, 31.80), (2,2,2, 'Audifonos', 'Inalambricos', 200, 50, 150, 15, 21), (3, 3, 3, 'Forro', '360', 150, 50, 120, 5.5, 6.3); 

INSERT INTO products_customers (id_customer, id_product)
VALUES (1,1), (2,2), (3,3);

INSERT INTO invoice_status (status)
VALUES ('Facturada'), ('Procesando'), ('Rechazada');

INSERT INTO invoices (id_customer, id_payment, id_invoice_status, date, total_to_pay)
VALUES (1,1,1, '2024-12-20', 150.5), (2,2,2, '2024-10-08', 180.20), (3,3,3, '2024-08-30', 201.62);

INSERT INTO orders (id_invoice, id_product, detail, amount, price)
VALUES (1,1, 'Cliente mayorista', 150, 1826.2), (2,2, 'Cliente minorista', 50, 1250), (3,3, 'Por credito', 120, 2000);

SELECT * FROM customers;

DELETe FROM products_customers
WHERE id_customer = 1;

DELETE FROM invoices
WHERE id_customer= 1;

DELETE FROM customers
WHERE id_customer= 1;

UPDATE customers
SET email= 'qux@qux.qux', name = 'Victorino' WHERE id_customer =3;

SELECT * FROM customers;

SELECT * FROM taxes;

UPDATE taxes
SET porcentage = 20 WHERE id_tax = 1;

UPDATE taxes
SET porcentage = 35 WHERE id_tax = 2;

UPDATE taxes
SET porcentage = 8 WHERE id_tax = 3;

SELECT * from products;

UPDATE products
SET price = 20 WHERE id_product = 1;

UPDATE products
SET price = 18 WHERE id_product = 2;

UPDATE products
SET price = 8 where id_product = 3;