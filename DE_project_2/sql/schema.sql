
CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    category VARCHAR(100),
    price DECIMAL(10,2),
    discountPercentage DECIMAL(5,2),
    rating DECIMAL(3,2),
    stock INT,
    brand VARCHAR(100),
    sku VARCHAR(100),
    weight INT,
    warrantyInformation VARCHAR(255),
    shippingInformation VARCHAR(255),
    availabilityStatus VARCHAR(100),
    returnPolicy VARCHAR(100),
    minimumOrderQuantity INT,
    thumbnail TEXT
);




CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    maidenName VARCHAR(100),
    age INT,
    gender VARCHAR(20),
    email VARCHAR(255),
    phone VARCHAR(50),
    username VARCHAR(100),
    password VARCHAR(255),
    birthDate VARCHAR(20),
    image TEXT,
    bloodGroup VARCHAR(10),
    height DECIMAL(6,2),
    weight DECIMAL(6,2),
    eyeColor VARCHAR(50),
    ip VARCHAR(50),
    macAddress VARCHAR(50),
    university VARCHAR(255),
    ein VARCHAR(50),
    ssn VARCHAR(50),
    userAgent TEXT,
    role VARCHAR(50)
);



CREATE TABLE IF NOT EXISTS product_reviews (
    rating INT,
    comment TEXT,
    date VARCHAR(30),
    reviewerName VARCHAR(150),
    reviewerEmail VARCHAR(255),
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);


CREATE TABLE IF NOT EXISTS product_dimensions (
    width DECIMAL(10,2),
    height DECIMAL(10,2),
    depth DECIMAL(10,2),
    product_id INT PRIMARY KEY,
    FOREIGN KEY (product_id) REFERENCES products(id)
);


CREATE TABLE IF NOT EXISTS product_meta (
    createdAt VARCHAR(30),
    updatedAt VARCHAR(30),
    barcode BIGINT,
    qrCode TEXT,
    product_id INT PRIMARY KEY,
    FOREIGN KEY (product_id) REFERENCES products(id)
);


CREATE TABLE IF NOT EXISTS product_images (
    product_id INT,
    image TEXT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);


CREATE TABLE IF NOT EXISTS product_tags (
    product_id INT,
    tag VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES products(id)
);



CREATE TABLE IF NOT EXISTS user_hair (
    color VARCHAR(50),
    type VARCHAR(50),
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS user_address (
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    stateCode VARCHAR(20),
    postalCode VARCHAR(20),
    country VARCHAR(100),
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS user_coordinates (
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS user_bank (
    cardExpire VARCHAR(20),
    cardNumber VARCHAR(50),
    cardType VARCHAR(50),
    currency VARCHAR(20),
    iban VARCHAR(50),
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS user_company (
    department VARCHAR(100),
    name VARCHAR(255),
    title VARCHAR(100),
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS user_company_address (
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    stateCode VARCHAR(20),
    postalCode VARCHAR(20),
    country VARCHAR(100),
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS user_company_coordinates (
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS user_crypto (
    coin VARCHAR(50),
    wallet VARCHAR(255),
    network VARCHAR(100),
    user_id INT PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(id)
);




CREATE TABLE IF NOT EXISTS carts (
    id INT PRIMARY KEY,
    total DECIMAL(10,2),
    discountedTotal DECIMAL(10,2),
    userId INT,
    totalProducts INT,
    totalQuantity INT,
    FOREIGN KEY (userId) REFERENCES users(id)
);


CREATE TABLE IF NOT EXISTS cart_products (
    cart_id INT,
    product_id INT,
    title VARCHAR(255),
    price DECIMAL(10,2),
    quantity INT,
    total DECIMAL(10,2),
    discountPercentage DECIMAL(5,2),
    discountedTotal DECIMAL(10,2),
    thumbnail TEXT,
    FOREIGN KEY (cart_id) REFERENCES carts(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);