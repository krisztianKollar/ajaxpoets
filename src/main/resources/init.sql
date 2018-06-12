/*
    Database initialization script that runs on every web-application redeployment.
*/
DROP TABLE IF EXISTS works;
DROP TABLE IF EXISTS poets;

CREATE TABLE poets (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
	CONSTRAINT name_not_empty CHECK (name <> ''),
	CONSTRAINT password_not_empty CHECK (password <> '')
);

CREATE TABLE works (
    id SERIAL PRIMARY KEY,
    poet_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    written TEXT,
    FOREIGN KEY (poet_id) REFERENCES poets(id)
);

INSERT INTO poets (name, password) VALUES
	('Pilinszky János', 'p'), --1
	('Fodor Ákos', 'f'), --2
	('József Attila', 'j'); --3


INSERT INTO works(poet_id, title, content, written) VALUES
  (1, 'Négysoros', E'Alvó szegek a jéghideg homokban. \n Plakátmagányban ázó éjjelek. \n Égve hagytad a folyosón a villanyt. \n Ma ontják véremet.','1956.'),
  (1,'Harmadnapon', E'És fölzúgnak a hamuszín egek, \n hajnalfele a ravensbrücki fák. \n És megérzik a fényt a gyökerek. \n És szél támad. És fölzeng a világ. \n Mert megölhették hitvány zsoldosok, \n és megszünhetett dobogni szive – \n Harmadnapra legyőzte a halált. \n Et resurrexit tertia die.','1975'),
  (1,'Életfogytiglan', E'Az ágy közös. \n A párna nem.','1975'),
  (2,'Szinopszis', E'Szerepünk kétes. \n Egy biztos: hárman vagyunk. \n Hal, háló, halász.', null),
  (2,'Erkölcsi kérdés', E'- a rés méretén \n múlna, hogy amit látsz: azt \n nézed, vagy lesed?', null),
  (2,'Evolúció', E'Ugyanazt írom: \n mindig más mindig másért \n olvassa másnak.', '1989'),
  (3, 'Két hexameter', E'Mért legyek én tisztességes? Kiterítenek úgyis! \n Mért ne legyek tisztességes! Kiterítenek úgyis.', '1936');