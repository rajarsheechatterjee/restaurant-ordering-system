DROP DATABASE foodapp;

CREATE DATABASE foodapp;

USE foodapp;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE food_items(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image_url TEXT NOT NULL,
    body MEDIUMTEXT NOT NULL
);

CREATE TABLE order_details(
    id INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    mobile_no INT NOT NULL,
    user_id INT NOT NULL,
    food_id INT NOT NULL,
    placed_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(food_id) REFERENCES food_items(id)
);

 INSERT INTO users(username,password)
 VALUES(
     "shadow",
     "$2y$10$.DGDxDCIbcpjUqcXeC5qPe8vfNQimvDp64W8FiBjvwfyGQEHjgpVa"
 );

INSERT INTO food_items(name, image_url, body)
VALUES
(
    "Chicken Biryani",
    "https://c.ndtvimg.com/2018-10/ohqcobr_handi-biryani_625x300_08_October_18.jpg",
    "Biryani is a mixed rice dish with its origins among the Muslims of the Indian subcontinent. It can be compared to mixing a curry, later combining it with semi-cooked rice separately. This dish is especially popular throughout the Indian subcontinent, as well as among its diaspora."
),
(
    "Rogan Josh",
    "https://img.taste.com.au/TFQ_zAsZ/taste/2017/06/lamb-rogan-josh-127388-1.jpg",
    "Rogan josh, also written roghan josh or roghan ghosht, is an aromatic curried meat dish of Persian or Kashmiri origin. It is made with red meat, traditionally lamb or goat. It is colored and flavored primarily by alkanet flower or root and Kashmiri chilies. It is one of the signature recipes of Kashmiri cuisine"
),
(
    "Paneer Tikka",
    "https://www.archanaskitchen.com/images/archanaskitchen/1-Author/Neha_Mathur/Achari_Paneer_Tikka_Recipe_Party_Food_400.jpg",
    "Paneer tikka is an Indian dish made from chunks of paneer marinated in spices and grilled in a tandoor. It is a vegetarian alternative to chicken tikka and other meat dishes. It is a popular dish that is widely available in India and countries with an Indian diaspora"
);