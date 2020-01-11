create schema scoala;

CREATE TABLE scoala.clasa(
    idClasa int(5) unsigned auto_increment primary key ,
    numeClasa varchar(10) not null
);
CREATE TABLE scoala.elevi(
    idElev int(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    numeElev varchar(25) not null,
    idClasa int(5) unsigned,
    foreign key (idClasa) references scoala.clasa(idClasa)
);
Create table scoala.note(
    idNote int(5) unique auto_increment primary key ,
    valoareNota int(2)not null ,
    idElev int(5) unsigned
);
insert into scoala.note(valoareNota, idElev) VALUES (3,2);
insert into scoala.note(valoareNota, idElev) VALUES (5,11);
insert into scoala.note(valoareNota, idElev) VALUES (10,1);
insert into scoala.note(valoareNota, idElev) VALUES (7,9);
insert into scoala.note(valoareNota, idElev) VALUES (8,7);
insert into scoala.note(valoareNota, idElev) VALUES (6,1);
insert into scoala.note(valoareNota, idElev) VALUES (9,1);
insert into scoala.note(valoareNota, idElev) VALUES (3,3);
insert into scoala.note(valoareNota, idElev) VALUES (7,10);
insert into scoala.note(valoareNota, idElev) VALUES (6,11);
insert into scoala.note(valoareNota, idElev) VALUES (9,8);
insert into scoala.note(valoareNota, idElev) VALUES (10,1);
insert into scoala.note(valoareNota, idElev) VALUES (6,2);
insert into scoala.note(valoareNota, idElev) VALUES (7,8);
insert into scoala.note(valoareNota, idElev) VALUES (8,7);
insert into scoala.note(valoareNota, idElev) VALUES (7,6);
insert into scoala.note(valoareNota, idElev) VALUES (9,4);
insert into scoala.note(valoareNota, idElev) VALUES (10,4);
insert into scoala.note(valoareNota, idElev) VALUES (7,10);
insert into scoala.note(valoareNota, idElev) VALUES (8,11);
insert into scoala.note(valoareNota, idElev) VALUES (9,5);

insert into scoala.clasa(numeClasa) values ('10A');
insert into scoala.clasa(numeClasa) values ('10B');
insert into scoala.clasa(numeClasa) values ('10C');

insert into scoala.elevi(numeElev, idClasa) VALUES ('gigel', 1);
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

select*from scoala.clasa;
select numeClasa from scoala.clasa;
select idClasa, numeClasa from scoala.clasa;
select idClasa, numeClasa from scoala.clasa where numeClasa like '10%';
select idClasa, numeClasa from scoala.clasa where numeClasa like '%b';
select idClasa, numeClasa from scoala.clasa where idClasa=2;
select idClasa, numeClasa from scoala.clasa where numeClasa= '10a';
select idClasa, numeClasa from scoala.clasa where idClasa > 1 and idClasa<4;
select * from scoala.clasa join scoala.elevi on clasa.idClasa = elevi.idClasa;
select * from scoala.clasa join scoala.elevi on clasa.idClasa = elevi.idClasa
where numeClasa = '10b'
  and numeElev like 'ro%';

select idElev, numeElev from scoala.clasa join scoala.elevi on clasa.idClasa = elevi.idClasa where numeClasa = '10b';
#2
select numeElev, idElev from scoala.clasa join scoala.elevi on clasa.idClasa = elevi.idClasa where numeClasa = '10b' and idElev>6;
#3
select numeElev, idElev from scoala.clasa join scoala.elevi on clasa.idClasa = elevi.idClasa where numeClasa='10c' and numeElev like '%a';
#4
select idElev from scoala.clasa join scoala.elevi on clasa.idClasa = elevi.idClasa
where numeElev like 'a%' and numeElev like '%a';
#acelas lucru
select  idElev from scoala.elevi
where numeElev like 'a%' and numeElev like '%a';
#5
select count(*) from scoala.elevi join scoala.clasa
on clasa.idClasa=elevi.idClasa where numeClasa='10b';

select count(*) from scoala.elevi join scoala.clasa
on clasa.idClasa=elevi.idClasa where numeClasa='10b'
and clasa.idClasa >100;

select idClasa from scoala.clasa;

select sum(idClasa) from scoala.clasa;
select min(idClasa) from scoala.clasa;
select max(idClasa) from scoala.clasa;
select avg(idClasa) from scoala.clasa;
select count(idClasa) from scoala.clasa;
select count(idElev) from scoala.elevi;

select *from scoala.elevi;
select *from scoala.elevi order by numeElev;
select *from scoala.elevi order by numeElev, idClasa;#nu se sorteaza dupa doua coloane simultan
select *from scoala.elevi order by idClasa desc;
select *from scoala.elevi limit 4 offset 2;
