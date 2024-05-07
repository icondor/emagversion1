-- Dropping tables if they exist to avoid conflicts during recreation
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS basket CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS addresses CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS categories CASCADE;

-- Creating the 'users' table
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username CHARACTER(40) NOT NULL,
    password CHARACTER(40) NOT NULL,
    isactive BOOLEAN,
    isbuyer BOOLEAN
);

-- Creating the 'addresses' table
CREATE TABLE addresses (
    id BIGSERIAL PRIMARY KEY,
    address CHARACTER(100) NOT NULL,
    iduser BIGINT NOT NULL,
    FOREIGN KEY (iduser) REFERENCES users(id)
);

-- Creating the 'categories' table
CREATE TABLE categories (
    id BIGINT PRIMARY KEY,
    name CHARACTER(20) NOT NULL,
    description CHARACTER(100)
);

-- Creating the 'products' table
CREATE TABLE products (
    id BIGSERIAL PRIMARY KEY,
    name CHARACTER(40) NOT NULL,
    description CHARACTER(200),
    price DOUBLE PRECISION NOT NULL,
    iduser BIGINT NOT NULL,
    idcategory BIGINT NOT NULL,
    FOREIGN KEY (iduser) REFERENCES users(id),
    FOREIGN KEY (idcategory) REFERENCES categories(id)
);

-- Creating the 'basket' table
CREATE TABLE basket (
    id BIGINT PRIMARY KEY,
    iduser BIGINT NOT NULL,
    idproduct BIGINT NOT NULL,
    FOREIGN KEY (iduser) REFERENCES users(id),
    FOREIGN KEY (idproduct) REFERENCES products(id)
);

-- Creating the 'orders' table
CREATE TABLE orders (
    id BIGINT PRIMARY KEY,
    iduser BIGINT NOT NULL,
    idproduct BIGINT NOT NULL,
    status CHARACTER(1),
    FOREIGN KEY (iduser) REFERENCES users(id),
    FOREIGN KEY (idproduct) REFERENCES products(id)
);
