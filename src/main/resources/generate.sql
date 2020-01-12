create schema scoala;

create table scoala.clasa
(
    idClasa   int(5) unsigned auto_increment primary key,
    numeClasa varchar(10) not null
);

create table scoala.elevi
(
    idElev   int(5) unsigned auto_increment primary key,
    numeElev varchar(25) not null,
    idClasa  int(5) unsigned,
    foreign key (idClasa) references scoala.clasa(idClasa)
);

insert into scoala.clasa(numeClasa) values ('10A');
insert into scoala.clasa(numeClasa) values ('10B');
insert into scoala.clasa(numeClasa) values ('10C');

insert into scoala.elevi(numeElev, idClasa) VALUES ('Fratili Mic', 1);
insert into scoala.elevi(numeElev, idClasa) VALUES ('Romu Vasile', 2);
insert into scoala.elevi(numeElev, idClasa) VALUES ('Gamu Ramon', 2);
insert into scoala.elevi(numeElev, idClasa) VALUES ('Zorel Bibilica', 3);
insert into scoala.elevi(numeElev, idClasa) VALUES ('Aramis Catana', 3);
insert into scoala.elevi(numeElev, idClasa) VALUES ('Joric Bunel', 2);
insert into scoala.elevi(numeElev, idClasa) VALUES ('Tocu Milu', 3);
insert into scoala.elevi(numeElev, idClasa) VALUES ('Romulus Cane', 2);
insert into scoala.elevi(numeElev, idClasa) VALUES ('Zorel Cana', 1);
insert into scoala.elevi(numeElev, idClasa) VALUES ('Zara Buni', 3);

CREATE TABLE scoala.note
(
    idNota      INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    valoareNota INT(2) UNSIGNED,
    idElev      INT(5) UNSIGNED ,
    FOREIGN KEY (idElev) REFERENCES scoala.elevi (idElev)
);

INSERT INTO scoala.note(valoareNota, idElev)
VALUES (9, 1), (5, 1), (4, 2), (10, 2), (8, 3), (1, 3), (4, 4), (8, 4), (10, 5), (2, 5), (7, 6), (3, 6), (8, 7),
       (1, 7), (10, 8),(10, 8), (2, 9), (10, 9), (5, 10), (5, 10);

update scoala.elevi set numeElev = 'Baronu Vasile' where idElev =2;

alter table scoala.elevi add column varsta int(2);

alter table scoala.elevi change column varsta varstraElev int(2);

alter table scoala.elevi drop column  varstraElev;

select numeElev, clasa.numeClasa  from scoala.clasa join scoala.elevi
                                                  on clasa.idClasa = elevi.idClasa where numeClasa = '10b' and numeElev like '%l';
#view de gasit
create view eleviDin10BCuLiteraLafinal as
select numeElev, clasa.numeClasa  from scoala.clasa join scoala.elevi
                                                  on clasa.idClasa = elevi.idClasa where numeClasa = '10b' and numeElev like '%l';

start transaction ;#cu si fara
insert into scoala.note(valoareNota, idElev) VALUES (5,1);
insert into scoala.note(valoareNota, idElev) VALUES (6,1);
insert into scoala.note(valoareNota, idElev) VALUES (7,1);
insert into scoala.note(valoareNota, idElev) VALUES (8,1);
insert into scoala.note(valoareNota, idElev) VALUES (9,1);
insert into scoala.note(valoareNota, idElev) VALUES (10,1);
commit;#cu si fara
