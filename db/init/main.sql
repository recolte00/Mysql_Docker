USE sample;
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
	id INT NOT NULL AUTO_INCREMENT,
        message VARCHAR(140) NOT NULL,
        likes INT UNSIGNED DEFAULT 0 CHECK (likes >= 0 AND likes <= 100000),
        mood DECIMAL(4,2) UNSIGNED,
        lang CHAR(2),
        categories SET('Gadget', 'Game', 'Business'), -- 2^0, 2^1, 2^2, ...
        is_draft BOOL,
        created DATETIME DEFAULT NOW(),
	updated DATETIME DEFAULT NOW() ON UPDATE NOW(),
	PRIMARY KEY (id)
);

INSERT INTO posts (message, likes, mood, lang, categories, is_draft, created) VALUES
        ('Thanks', 12, 7.825, 'EN', 3, TRUE, '2020-10-11 15:32:05'),
        ('Arigato', 4, 4.132, 'JP', 5, FALSE, '2020-10-12' ),
        ('Merci', 5, 0.192, 'FC', 2, 0, NOW());

INSERT INTO posts (message) VALUES ('Gracias');
	
DESC posts;
SHOW TABLES;

SELECT * FROM posts;

/*
SELECT likes * 500 / 3 AS bonus,
       FLOOR(likes * 500 /3) AS floor,
       CEIL(likes * 500 / 3) AS ceil,
       ROUND(likes * 500 / 3, 2) AS round
FROM posts;
UPDATE posts
SET likes = likes + 5,
    message = UPPER(message)
WHERE likes >= 10;

DELETE FROM posts; -- maintaining INCREMENT
TRUNCATE TABLE posts; -- not maintaining INCREMENT
SLEEP(5); -- WAIT 5 SECONDS
*/

SELECT message, SUBSTRING(message, 3) FROM posts;
SELECT message, SUBSTRING(message, 3, 2) FROM posts;
SELECT message, SUBSTRING(message, -2) FROM posts;

SELECT created, YEAR(created) FROM posts;
SELECT created, MONTH(created) FROM posts;
SELECT created, DAY(created) FROM posts;

SELECT created, DATE_FORMAT(created, '%M %D %Y, %W') AS date FROM posts;
SELECT created, DATE_ADD(created, INTERVAL 7 DAY) AS next FROM posts;
SELECT created, NOW(), DATEDIFF(created, NOW()) AS diff FROM posts;

/*
ALTER TABLE posts ADD author VARCHAR(255) AFTER id;
ALTER TABLE posts ADD author VARCHAR(255) FIRST id;
ALTER TABLE posts DROP message;
ALTER TABLE posts RENAME messages;
*/
