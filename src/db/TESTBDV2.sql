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
    password			varchar(30) NOT NULL,
    phone_number   	TEXT NOT NULL,
    email varchar(30) NOT NULL,
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
insert into account (user,password,phone_number, email) values ('JC','1234','06 12 34 56 78', 'jc.jean@gmail.com'),('Jean-Eude','1234','06 00 00 00 00','je.jeude@gmail.com'),
('Eugène','1234','06 11 11 11 11', 'eugene.gene@gmail.com'),('Jean Michel IV', '2146','06 69 96 69 96', 'jeanmi.chel@gmail.com'),('Albert', 'alibaba','06 69 96 69 96', 'ali.baba@gmail.com'),
('Tanya', 'Evil','06 66 66 66 66', 'ta.nya@gmail.com');

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
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2024-10-11 10:30:00',0,'salut',2,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2024-11-21 10:30:00',0,'',2,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2024-11-13 12:00:00',0,'',3,null);
insert into request values (DEFAULT, 'Locmaria-Plouzané', 'Aéroport', '2024-10-15 10:30:00',10,'',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Locmaria-Plouzané', '2024-10-29 12:00:00',10,'',3,null);
insert into request values (DEFAULT, 'Brest', 'Aéroport', '2024-11-01 15:30:00',35,'Je me présente, je m appelle Henry',2,null);
insert into request values (DEFAULT, 'Aéroport', 'IMT Atlantique Brest', '2024-11-01 08:00:00',50,'',3,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Aéroport Brest', '2024-10-09 12:30:00',10,'alors, on attend pas Patrique !?',4,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2024-08-08 14:30:00',60,'60m² avec vu sur le parc',1,null);

insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2024-08-07 16:30:00',90,'j ai avec moi beaucoup de matériel',2,null);
insert into request values (DEFAULT, 'Brest', 'Carrefour', '2024-08-06 18:30:00',35,'',3,null);
insert into request values (DEFAULT, 'Aéroport', 'IMT Atlantique Brest', '2024-08-05 20:30:00',50,'damn',4,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Decathlon Brest', '2024-12-01 10:30:00',0,'',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2024-12-01 12:00:00',0,'',3,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2024-12-01 10:30:00',10,'',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Aéroport Brest', '2024-12-01 12:00:00',10,'',3,null);
insert into request values (DEFAULT, 'Brest', 'Carrefour', '2024-12-01 10:30:00',35,'',2,null);
insert into request values (DEFAULT, 'Aéroport', 'IMT Atlantique Brest', '2024-12-01 12:00:00',50,'',3,null);
insert into request values (DEFAULT, 'Decathlon Brest','Carrefour Plouzané','2024-12-18 10:30:00',0,'',1,null);

insert into request values (DEFAULT, 'Locmaria-Plouzané', 'IMT Atlantique Brest', '2025-01-01 11:30:00',0,'',1,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2025-01-11 10:30:00',0,'salut',2,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2025-01-21 10:30:00',0,'',2,null);
insert into request values (DEFAULT, 'Lidl Plouzané', 'Brest', '2025-01-13 12:00:00',0,'',3,null);
insert into request values (DEFAULT, 'Locmaria-Plouzané', 'Aéroport', '2025-01-15 10:30:00',10,'',2,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Locmaria-Plouzané', '2025-01-29 12:00:00',10,'',3,null);
insert into request values (DEFAULT, 'Brest', 'Aéroport', '2025-01-01 15:30:00',35,'Je me présente, je m appelle Henry',2,null);
insert into request values (DEFAULT, 'Aéroport', 'IMT Atlantique Brest', '2025-01-01 08:00:00',50,'',3,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Aéroport Brest', '2025-01-09 12:30:00',10,'alors, on attend pas Patrique !?',4,null);
insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2025-01-08 14:30:00',60,'60m² avec vu sur le parc',1,null);

insert into request values (DEFAULT, 'IMT Atlantique Brest', 'Brest', '2025-02-01 16:00:01',60,'100m² avec vu sur la plage',1,null);

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
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-08-21 12:30:00',8,2,'Vodka',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-07-11 12:00:00',3,2,'pas de bras, pas de chocolat',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-10-21 12:30:00',8,1,'en avant',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-11-11 12:00:00',3,1,'',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-09-22 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-09-11 12:00:00',3,4,'',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-09-18 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-09-15 12:00:00',3,1,'J ai un gros coffre',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-09-01 12:30:00',8,3,'peu de place',6);

insert into offer values (DEFAULT,'Aéroport Brest','IMT Atlantique Brest','2024-09-11 12:00:00',3,3,'Ya',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-08-21 12:30:00',8,2,'Vodka',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-07-11 12:00:00',3,2,'pas de bras, pas de chocolat',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-10-21 12:30:00',8,1,'en avant',6);
insert into offer values (DEFAULT,'Decathlon Brest','IMT Atlantique Brest','2024-11-11 12:00:00',3,1,'',5);
insert into offer values (DEFAULT,'Gare Brest','Aéroport Brest','2024-09-22 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-09-11 12:00:00',3,4,'',5);
insert into offer values (DEFAULT,'Aéroport Brest','IMT Atlantique Brest','2024-09-18 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-09-15 12:00:00',3,1,'J ai un gros coffre',5);
insert into offer values (DEFAULT,'Gare Brest','Lidl Plouzané','2024-09-01 12:30:00',8,3,'peu de place',6);

insert into offer values (DEFAULT,'Brest','Decalthlon Brest','2024-09-12 12:00:00',3,3,'Ya',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-21 12:30:00',8,2,'Vodka',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-12-11 12:00:00',3,2,'pas de bras, pas de chocolat',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-21 12:30:00',8,1,'en avant',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-12-01 12:00:00',3,1,'',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-22 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-12-30 12:00:00',3,4,'',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-29 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-12-14 12:00:00',3,1,'J ai un gros coffre',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-02 12:30:00',8,3,'peu de place',6);

insert into offer values (DEFAULT,'Aéroport Brest','IMT Atlantique Brest','2024-12-06 12:00:00',3,3,'Ya',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-19 12:30:00',8,2,'Vodka',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-12-08 12:00:00',3,2,'pas de bras, pas de chocolat',5);
insert into offer values (DEFAULT,'Gare Brest','IMT Atlantique Brest','2024-12-09 12:30:00',8,1,'en avant',6);
insert into offer values (DEFAULT,'Decathlon Brest','IMT Atlantique Brest','2024-12-13 12:00:00',3,1,'',5);
insert into offer values (DEFAULT,'Gare Brest','Aéroport Brest','2024-12-22 19:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-07-11 12:00:00',3,4,'',5);
insert into offer values (DEFAULT,'Aéroport Brest','IMT Atlantique Brest','2024-07-18 12:30:00',8,2,'',6);
insert into offer values (DEFAULT,'Brest','IMT Atlantique Brest','2024-06-15 12:00:00',3,1,'J ai un gros coffre',5);
insert into offer values (DEFAULT,'Gare Brest','Lidl Plouzané','2024-06-01 12:30:00',8,3,'peu de place',6);

insert into offer values (DEFAULT,'Plouzané-Locmaria','Brest','2025-01-11 12:00:00',3,4,'ola',5);

#JC postule aux offres :
insert into apply_offer values (1,1,4,'2024-05-05 16:23:54');
insert into notification values (default, 4, "JC a candidaté à une de vos offres", false, NOW());

insert into apply_offer values (1,2,4,'2024-05-06 16:23:54');
insert into notification values (default, 4, "JC a candidaté à une de vos offres", false, NOW());