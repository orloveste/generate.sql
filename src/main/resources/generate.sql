create schema scoala;

create table scoala.clasa
(
    idClasa int(5) unsigned auto_increment primary key,
    numeClasa varchar(10) not null
);

create table scoala.elevi
(
    idElev int(5) unsigned auto_increment primary key,
    numeElev varchar(25) not null,
    idClasa int(5) unsigned,
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

alter table scoala.elevi add column varsta int(2);

alter table scoala.elevi change column varsta varstraElev int(2);

alter table scoala.elevi drop column  varstraElev;

select numeElev, clasa.numeClasa  from scoala.clasa
    join scoala.elevi on clasa.idClasa = elevi.idClasa where numeClasa = '10b' and numeElev like '%l';
#view de gasit
create view eleviDin10BCuLiteraLafinal as
select numeElev, clasa.numeClasa  from scoala.clasa
    join scoala.elevi on clasa.idClasa = elevi.idClasa where numeClasa = '10b' and numeElev like '%l';

start transaction ;#cu si fara
insert into scoala.note(valoareNota, idElev) VALUES (5,1);
insert into scoala.note(valoareNota, idElev) VALUES (6,1);
insert into scoala.note(valoareNota, idElev) VALUES (7,1);
insert into scoala.note(valoareNota, idElev) VALUES (8,1);
insert into scoala.note(valoareNota, idElev) VALUES (9,1);
insert into scoala.note(valoareNota, idElev) VALUES (10,1);
commit;#cu si fara

#exercitii tabel join multiplu
#cate note sunt in clasa 10A
select count(*) from scoala.note
                         join scoala.elevi e on note.idElev = e.idElev
                         join scoala.clasa c on e.idClasa = c.idClasa where c.numeClasa='10a';
/*#tema
select * from
            (select * from note join elevi e on note.idElev = e.idElev)
            join clasa c on scoala.elevi.idClasa = c.idClasa;*/
#arata cate note sunt peste 5
select count(*) from scoala.note
where note.valoareNota>5;
#arata cate note sunt mai mici ca 2
select count(numeClasa) from scoala.note
                                 join scoala.elevi e on note.idElev = e.idElev
                                 join scoala.clasa c on e.idClasa = c.idClasa
where note.valoareNota<2;
#cate note exista mai mari ca 5 si mai mici ca 10 din clasa 10A pt elevi care au numele care incep
#cu litera F
select * from scoala.note
                  join scoala.elevi e on note.idElev = e.idElev
                  join scoala.clasa c on e.idClasa = c.idClasa
where c.numeClasa ='10a'and note.valoareNota>5 and note.valoareNota<10 and e.numeElev like 'F%';
select count(*) from scoala.note
                         join scoala.elevi e on note.idElev = e.idElev
                         join scoala.clasa c on e.idClasa = c.idClasa
where c.numeClasa ='10a'and note.valoareNota>5 and note.valoareNota<10 and e.numeElev like 'F%';
#media notelor
select avg(valoareNota) from scoala.note
                                 join scoala.elevi e on note.idElev = e.idElev
                                 join scoala.clasa c on e.idClasa = c.idClasa
where c.numeClasa ='10a';
create table scoala.profesori
(
    idProfesor int(5) unsigned auto_increment primary key,
    numeProfesor varchar(20) not null

    #foreign key (idProfesor) references scoala.note
);
create table scoala.materii
(
    idMaterie int(5) unsigned auto_increment primary key,
    numeMaterie varchar(20) not null
);
create table scoala.ProfesoriMaterie
(
    idPredare int(5) unsigned auto_increment primary key,
    idProfesor int(5) unsigned,
    idMaterie int(5) unsigned,
    foreign key (idProfesor) references scoala.profesori(idProfesor),
    foreign key (idMaterie) references scoala.materii(idMaterie)
);
insert into scoala.profesori(numeProfesor)values ('Petrica Spataru');
insert into scoala.profesori(numeProfesor)values ('Mitu Vasile');
insert into scoala.profesori(numeProfesor)values ('Japca Florin');
insert into scoala.profesori(numeProfesor)values ('Porcu Victor');
insert into scoala.profesori(numeProfesor)values ('Zaica Trufa');

insert into scoala.materii(numeMaterie) values ('Metafizica');
insert into scoala.materii(numeMaterie) values ('Dat cu sapa');
insert into scoala.materii(numeMaterie) values ('Prins la furca');
insert into scoala.materii(numeMaterie) values ('Vanat pisici');
insert into scoala.materii(numeMaterie) values ('Aruncat cu zaru');

insert into scoala.ProfesoriMaterie(idProfesor, idMaterie) VALUES
(1,2),(1,5),(2,5),(4,1),(2,3),(3,2),(4,2),(5,5),(2,4),(3,1),(5,2),(3,4);

alter table scoala.note add column idPredare int(5) unsigned;
alter table scoala.note add foreign key (idPredare) references
    scoala.profesorimaterie(idPredare);

update scoala.note set note.idPredare ='1' where idNota=1;
update scoala.note set note.idPredare ='1' where idNota=2;
update scoala.note set note.idPredare ='3' where idNota=3;
update scoala.note set note.idPredare ='1' where idNota=4;
update scoala.note set note.idPredare ='6' where idNota=5;
update scoala.note set note.idPredare ='7' where idNota=6;
update scoala.note set note.idPredare ='3' where idNota=7;
update scoala.note set note.idPredare ='5' where idNota=8;
update scoala.note set note.idPredare ='12' where idNota=9;
update scoala.note set note.idPredare ='5' where idNota=10;
update scoala.note set note.idPredare ='4' where idNota=11;
update scoala.note set note.idPredare ='5' where idNota=12;
update scoala.note set note.idPredare ='6' where idNota=13;
update scoala.note set note.idPredare ='2' where idNota=14;
update scoala.note set note.idPredare ='11' where idNota=15;
update scoala.note set note.idPredare ='12' where idNota=16;
update scoala.note set note.idPredare ='1' where idNota=17;
update scoala.note set note.idPredare ='5' where idNota=18;
update scoala.note set note.idPredare ='3' where idNota=19;
update scoala.note set note.idPredare ='2' where idNota=20;
update scoala.note set note.idPredare ='6' where idNota=21;
update scoala.note set note.idPredare ='7' where idNota=22;
update scoala.note set note.idPredare ='8' where idNota=23;
update scoala.note set note.idPredare ='9' where idNota=24;
update scoala.note set note.idPredare ='10' where idNota=25;
update scoala.note set note.idPredare ='11' where idNota=26;
#afisati numele profesorilor si numele materiei
select numeProfesor,numeMaterie from scoala.profesori join scoala.profesorimaterie PM on profesori.idProfesor = PM.idProfesor
                                               join scoala.materii m on PM.idMaterie = m.idMaterie;
#note si materie
select numeElev, numeMaterie, valoareNota, numeProfesor
    from scoala.elevi
    join scoala.note n on elevi.idElev = n.idElev
    join scoala.profesorimaterie PM on n.idPredare = PM.idPredare
    join scoala.materii m on PM.idMaterie = m.idMaterie
    join scoala.profesori p on PM.idProfesor = p.idProfesor;

#care este cea mai mare nota la materii?
select max(valoareNota)
    from scoala.materii
        join scoala.profesorimaterie p on materii.idMaterie = p.idMaterie
        join scoala.note n on p.idPredare = n.idPredare where materii.numeMaterie='dat cu sapa';

#care este cea mai mare nota a unei singure persoane
select * from scoala.materii join scoala.profesorimaterie p on materii.idMaterie = p.idMaterie
                      join scoala.note n on p.idPredare = n.idPredare
                      join scoala.elevi e on n.idElev = e.idElev
where numeElev='Joric Bunel';
select max(valoareNota) from scoala.materii
    join scoala.profesorimaterie p on materii.idMaterie = p.idMaterie
    join scoala.note n on p.idPredare = n.idPredare
    join scoala.elevi e on n.idElev = e.idElev
        where numeElev='Joric Bunel';
#tema part 1 MySQL 13-17.01.2019
# Vreau ca pana sambata, cand ne vedem, sa va uitati pe baza de date pe care o avem acum. Dupa asta,
# vreau sa vedeti 5 informatii pe care le putem obtine (ex. cate note sunt la o clasa). Dupa asta, vreua sa
# scrieti query-ul necesar pentru asta. Deci, tema are 2 componente :
# Ask questions.
# Answer questions.
# Revin maine cu urmatoarea parte din tema

# 1.cate note sunt la un elev?
select count(numeElev) from scoala.note
                                join scoala.elevi e on note.idElev = e.idElev
where numeElev = 'Fratili Mic';
# 2.cate note sunt la o clasa?
select count(note.idNota) from scoala.note
                                   join scoala.elevi e on note.idElev = e.idElev
                                   join scoala.clasa c on e.idClasa = c.idClasa
where numeClasa = '10A';
# 3. cate note sunt date de un profesor?
select count(note.idNota) from scoala.note
                                   join scoala.profesorimaterie p on note.idPredare = p.idPredare
                                   join scoala.profesori p2 on p.idProfesor = p2.idProfesor
                                   join scoala.materii m on p.idMaterie = m.idMaterie
where numeProfesor = 'Japca Florin';
# 4. cate note sunt la o materie?
select count(note.idNota) from scoala.note
                                   join scoala.profesorimaterie p on note.idPredare = p.idPredare
                                   join scoala.materii m on p.idMaterie = m.idMaterie
where numeMaterie = 'Prins la furca';
# 5. cati elevi sunt la o clasa?
select count(idElev) from scoala.elevi
                              join scoala.clasa c on elevi.idClasa = c.idClasa
where numeClasa = '10b'