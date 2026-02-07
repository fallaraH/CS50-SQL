CREATE TABLE `users` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32),
    `last_name` VARCHAR(32),
    `username` VARCHAR(16) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `foundation_year` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `industry` SET('Technology', 'Education', 'Finance', 'Business') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `users_connections` (
    `user1_id` INT UNSIGNED AUTO_INCREMENT,
    `user2_id` INT UNSIGNED AUTO_INCREMENT,
    FOREIGN KEY(`user1_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user2_id`) REFERENCES `users`(`id`),
    PRIMARY KEY (`user1_id`, `user2_id`)
);

CREATE TABLE `users_schools` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED AUTO_INCREMENT,
    `school_id` INT UNSIGNED AUTO_INCREMENT,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `degree_type` ENUM('BA', 'MA', 'PhD') NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`),
    PRIMARY KEY(`id`)
);

CREATE TABLE `users_companies` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `user_id` INT UNSIGNED AUTO_INCREMENT,
    `company_id` INT UNSIGNED AUTO_INCREMENT,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`),
    PRIMARY KEY(`id`)
);
