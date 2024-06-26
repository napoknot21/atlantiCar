USE atlanticar;
DROP TABLE IF EXISTS offer_client;
DROP TABLE IF EXISTS apply_offer;
DROP TABLE IF EXISTS apply_request;
DROP TABLE IF EXISTS offer;
DROP TABLE IF EXISTS request;
DROP TABLE IF EXISTS notification;
DROP TABLE IF EXISTS account;

CREATE TABLE account
(   
    id     			INT auto_increment,
    user 			varchar(30),
    password			varchar(64) NOT NULL,
    phone_number   	TEXT NOT NULL,
    email varchar(100) NOT NULL,
    primary key (id)
);

CREATE TABLE offer
(   
    id              INT primary key auto_increment,
    departure	  	TEXT,
    arrival		    TEXT,
    date            datetime,
    price          	float,
    nb_seat	        integer,
    comment		    varchar(200),
    author          INT,
    FOREIGN KEY (author) REFERENCES account(id)
);

CREATE TABLE request
(   
    id              INT primary key auto_increment,
    departure     	TEXT,
    arrival		    TEXT,
    date            datetime,
    price           float,
    comment     	varchar(200),
    author          INT,
    conductor		INT,
    FOREIGN KEY (author) REFERENCES account(id)
);

create table apply_offer
(	
    candidate 		INT,
    id_offer 		INT,
    author 			INT,
    date			datetime,
    FOREIGN KEY (candidate) REFERENCES account(id),
    FOREIGN KEY (id_offer) REFERENCES offer(id),
    FOREIGN KEY (author) REFERENCES account(id),
    primary key (candidate, id_offer, author)
);

create table apply_request
(	
    candidate 		INT,
    id_request 		INT,
    author 			INT,
    date			datetime,
    FOREIGN KEY (candidate) REFERENCES account(id),
    FOREIGN KEY (id_request) REFERENCES request(id),
    FOREIGN KEY (author) REFERENCES account(id),
    primary key (candidate,id_request,author)
);

create table offer_client
(
	client			INT,
    id_offer 		INT,
    Foreign Key (client) REFERENCES account(id),
    Foreign Key (id_offer) REFERENCES offer(id),
    Primary Key (client, id_offer)
);

create table notification
(
	id serial,
	id_account int,
    message TEXT, 
    seen bool,
    date DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (id_account) references account(id)
);

#ajout de 6 profiles
INSERT INTO account VALUES (DEFAULT, 'JC', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '06 12 34 56 78', 'jc@imt-atlantique.net');
INSERT INTO account VALUES (DEFAULT, 'Jean-Eude', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '06 00 00 00 00', 'je@imt-atlantique.net');
INSERT INTO account VALUES (DEFAULT, 'Eugène', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '06 11 11 11 11', 'eugene@imt-atlantique.net');
INSERT INTO account VALUES (DEFAULT, 'Jean Michel IV', '2570ce03b300309d1f8d673ad5d5359d30b7a5d9a9c4aaa4b54c19cd2c683a78', '06 69 96 69 96', 'jeanmi@imt-atlantique.net');
INSERT INTO account VALUES (DEFAULT, 'Albert', '047364b9be67f665eca384b8061d688b8642a8b47b3de35c22a012ed6fe69242', '06 69 96 69 96', 'alibaba@imt-atlantique.net');
INSERT INTO account VALUES (DEFAULT, 'Tanya', '50bf80da81cf93a98faad116f4afea66abc5f12dcf933908a3a982ca02a1ebdc', '06 66 66 66 66', 'tanya@imt-atlantique.net');

#41 requêtes
insert into request values (DEFAULT, 'IMT Atlantique Brest','Carrefour Plouzané','2024-08-01 10:30:00',0,'',1,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Carrefour Plouzané', '2024-09-01 11:30:00',0,'',1,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Carrefour Plouzané', '2024-10-01 10:30:00',0,'salut',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Decathlon Brest', '2024-11-01 10:30:00',0,'',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2024-11-01 12:00:00',0,'',3,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2024-11-01 10:30:00',10,'',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Aéroport Brest', '2024-11-01 12:00:00',10,'',3,null);
insert into request values (DEFAULT, 'Brest', 'Carrefour', '2024-11-01 10:30:00',35,'',2,null);
insert into request values (DEFAULT, 'Aéroport', 'IMT Atlantique Brest', '2024-11-01 12:00:00',50,'',3,null);
insert into request values (DEFAULT, 'Decathlon Brest','Carrefour Plouzané','2024-09-18 10:30:00',0,'',1,null);

insert into request values (DEFAULT, 'Locmaria-Plouzané', 'IMT Atlantique Brest', '2024-11-01 11:30:00',0,'',1,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2024-10-11 10:30:00',0,"J'ai besoin de faire des courses",2,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2024-11-21 10:30:00',0,'',2,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2024-11-13 12:00:00',0,'',3,null);
insert into request values (DEFAULT, 'Locmaria-Plouzané', 'Aéroport', '2024-10-15 10:30:00',10,'',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Locmaria-Plouzané', '2024-10-29 12:00:00',10,'',3,null);
insert into request values (DEFAULT, 'Brest', 'Aéroport', '2024-11-01 15:30:00',35,"Je dois prendre l'avion",2,null);
insert into request values (DEFAULT, 'Aéroport', 'IMT Atlantique Brest', '2024-11-01 08:00:00',50,'',3,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Aéroport Brest', '2024-10-09 12:30:00',10,"J'ai 2 valises !",4,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2024-08-08 14:30:00',60,"",1,null);

insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2024-08-07 16:30:00',90,"J'ai 3 sacs avec moi",2,null);
insert into request values (DEFAULT, 'Brest', 'Carrefour', '2024-08-06 18:30:00',35,'',3,null);
insert into request values (DEFAULT, 'Aéroport', 'IMT Atlantique Brest', '2024-08-05 20:30:00',50,'damn',4,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Decathlon Brest', '2024-12-01 10:30:00',0,'',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2024-12-01 12:00:00',0,'',3,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2024-12-01 10:30:00',10,'',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Aéroport Brest', '2024-12-01 12:00:00',10,'',3,null);
insert into request values (DEFAULT, 'Brest', 'Carrefour', '2024-12-01 10:30:00',35,'',2,null);
insert into request values (DEFAULT, 'Aéroport', 'IMT Atlantique Brest', '2024-12-01 12:00:00',50,'',3,null);
insert into request values (DEFAULT, 'Decathlon Brest','Carrefour Plouzané','2024-12-18 10:30:00',0,'',1,null);

insert into request values (DEFAULT, 'Locmaria-Plouzané', 'IMT Atlantique Brest', '2025-01-01 11:30:00',0,"J'ai 3 sacs avec moi",1,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2025-01-11 10:30:00',0,'',2,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2025-01-21 10:30:00',0,'',2,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2025-01-13 12:00:00',0,'',3,null);
insert into request values (DEFAULT, 'Locmaria-Plouzané', 'Aéroport', '2025-01-15 10:30:00',10,'',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Locmaria-Plouzané', '2025-01-29 12:00:00',10,'',3,null);
insert into request values (DEFAULT, 'Brest', 'Aéroport', '2025-01-01 15:30:00',35,"J'ai 2 valises et 1 sac avec moi",2,null);
insert into request values (DEFAULT, 'Aéroport', 'IMT Atlantique Brest', '2025-01-01 08:00:00',50,'',3,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Aéroport Brest', '2025-01-09 12:30:00',10,"J'ai 1 valise",4,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2025-01-08 14:30:00',60,"Je vais manger en ville avec ma copine",1,null);

insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2025-02-01 16:00:01',60,"Je dois aller à la préfecture",1,null);

#application aux requêtes avec ajout de la notification

insert into apply_request values (2,1,1,'2024-05-05 16:23:54');
insert into notification values (default, 1, "Jean-Eude a candidaté à une de vos requêtes", false, NOW());
insert into apply_request values (3,2,1,'2024-05-05 18:43:14');
insert into notification values (default, 1, "Eugène a candidaté à une de vos requêtes", false, NOW());

#les annonces de JC
SELECT * FROM request as r JOIN account as c ON c.id = r.author WHERE c.user = 'JC'; 

#Les annonces (requête) acceptés par des gens
SELECT c1.user as candidate,r.departure,r.arrival,r.date,c2.user as author From apply_request as cr 
JOIN account as c1 ON c1.id = cr.candidate JOIN account as c2 ON c2.id = cr.author JOIN request as r on r.id = cr.id_request;


#ajoutons des offres auquel on est inscrit (il y en a 21)
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-09-11 12:00:00',3,3,'Ya',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-08-21 12:30:00',8,2,'Pas de grosses valises, merci.',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-07-11 12:00:00',3,2,'Pas de bruit svp',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-10-21 12:30:00',8,1,'Je conduis vite',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-11-11 12:00:00',3,1,'',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-09-22 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-09-11 12:00:00',3,4,'',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-09-18 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-09-15 12:00:00',3,1,'J ai un gros coffre',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-09-01 12:30:00',8,3,'Peu de place',6);

insert into offer values (DEFAULT,'Aéroport Brest','IMT Atlantique Brest','2024-09-11 12:00:00',3,3,'',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-08-21 12:30:00',8,2,'Pas de place dans le coffre',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-07-11 12:00:00',3,2,"Je m'arrête à Thales",5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-10-21 12:30:00',8,1,"Je m'arrête au Multiplex Liberte",6);
insert into offer values (DEFAULT,'Decathlon Brest','IMT Atlantique Brest','2024-11-11 12:00:00',3,1,'',5);
insert into offer values (DEFAULT,'Gare Brest','Aéroport Brest','2024-09-22 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-09-11 12:00:00',3,4,'',5);
insert into offer values (DEFAULT,'Aéroport Brest','IMT Atlantique Brest','2024-09-18 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-09-15 12:00:00',3,1,'J ai un petit coffre',5);
insert into offer values (DEFAULT,'Gare Brest','Lidl Plouzané','2024-09-01 12:30:00',8,3,'beaucoup de place',6);

insert into offer values (DEFAULT,'Brest','Decalthlon Brest','2024-09-12 12:00:00',3,3,'',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-21 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-12-11 12:00:00',3,2,"Je m'arrête à Guilers",5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-21 12:30:00',8,1,"Je m'arrête aux capucins",6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-12-01 12:00:00',3,1,'',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-22 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-12-30 12:00:00',3,4,'',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-29 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-12-14 12:00:00',3,1,"Je m'arrête au Karting",5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-02 12:30:00',8,3,"Je m'arrête à Naval",6);

insert into offer values (DEFAULT,'Aéroport Brest','IMT Atlantique Brest','2024-12-06 12:00:00',3,3,"Je m'arrête au BK",5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-19 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-12-08 12:00:00',3,2,"Je m'arrête à Dialogues",5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-09 12:30:00',8,1,"Je m'arrête à la base navale",6);
insert into offer values (DEFAULT,'Decathlon Brest','IMT Atlantique Brest','2024-12-13 12:00:00',3,1,'',5);
insert into offer values (DEFAULT,'Gare Brest','Aéroport Brest','2024-12-22 19:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-07-11 12:00:00',3,4,'',5);
insert into offer values (DEFAULT,'Aéroport Brest','IMT Atlantique Brest','2024-07-18 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-06-15 12:00:00',3,1,'J ai que 2 portières',5);
insert into offer values (DEFAULT,'Gare Brest','Lidl Plouzané','2024-06-01 12:30:00',8,3,"J'ai une Twingo",6);

insert into offer values (DEFAULT,'Plouzané-Locmaria','Brest','2025-01-11 12:00:00',3,4,"",5);

#JC postule aux offres :
insert into apply_offer values (1,1,5,'2024-05-05 16:23:54');
insert into notification values (default, 4, "JC a candidaté à une de vos offres", false, NOW());

insert into apply_offer values (1,2,6,'2024-05-06 16:23:54');
insert into notification values (default, 4, "JC a candidaté à une de vos offres", false, NOW());