create table exercises2
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
harf_sayisi int
);


INSERT INTO exercises2 VALUES (1001, 'hot', 3);  
INSERT INTO exercises2 VALUES (1002, 'hat', 3);  
INSERT INTO exercises2 VALUES (1003, 'hit', 3);  
INSERT INTO exercises2 VALUES (1004, 'hbt', 3);  
INSERT INTO exercises2 VALUES (1008, 'hct', 3);  
INSERT INTO exercises2 VALUES (1005, 'adem', 4);  
INSERT INTO exercises2 VALUES (1006, 'selim', 5);  
INSERT INTO exercises2 VALUES (1007, 'yusuf', 5);
INSERT INTO exercises2 VALUES (1009, 'hAt', 3); 

--SORU: ikinci harfi a veya e olan kelimelerin tum bilgilerini listeleyin.


select * from exercises2 where kelime ~ '^[a-z][ae]'   -- regexp like



select * from exercises2 where kelime like '_a%' or kelime like '_e%'  -- like



/*========================================= JOIN İSLEMLERİ ===================================================
 
  
    Join islemleri: iki tabloyu birlestirmek için kullanılır.

    
    1) LEFT JOIN:  ilk tabloda olan tum verileri listeler.
    2) RIGHT JOIN: ikinci tabloda olan tum verileri listeler.
    3) INNER JOIN: Tablolardaki ortak olan verileri listeler.
    4) FULL JOIN: her iki tablodaki verilerin tamamını listeler 

 	Syntax
    -----------
    SELECT sutun1,sutun2... FROM tablo1_adi    
           
    ....JOIN tablo2_adi 
        
    ON tablo1_adi.ortak_sutun = tablo2_adi.ortak_sutun;

===================================================================================================================*/  



create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);

insert into filmler values (100, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (200, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (300, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (400, 'Aile Arasinda', 'Komedi');
insert into filmler values (500, 'GORA', 'Bilim Kurgu');
insert into filmler values (600, 'Organize Isler', 'Komedi');
insert into filmler values (700, 'Babam ve Oglum', 'Dram');


create table aktorler
(
actor_name varchar(30),
film_id int
);

insert into aktorler values ('Ata Demirer', 100);
insert into aktorler values ('Necati Sasmaz', 200);
insert into aktorler values ('Gupse Ozay', 300);
insert into aktorler values ('Engin Gunaydin', 400);
insert into aktorler values ('Cem Yilmaz', 500);
insert into aktorler values ('Yilmaz Erdogan', 800);
insert into aktorler values ('Haluk Bilginer', 900);


select * from filmler;


-- SORU1: Tüm film_name'leri, tüm category'lerini ve bu filmlerde oynayan actor_name'leri listeleyiniz.


select film_name, category, actor_name from filmler
left join aktorler 
on filmler.film_id=aktorler.film_id;

-- 2.YOL
select film_name, category, actor_name from aktorler
right join filmler 
on filmler.film_id=aktorler.film_id;

select * from filmler;

-- SORU2: Tüm actor_name'leri ve bu actorlerin oynadıgı film_name'lerini listeleyiniz.

select actor_name, film_name from aktorler
left join filmler
on filmler.film_id = aktorler.film_id;

-- 2.YOL
select actor_name, film_name from filmler
right join aktorler
on filmler.film_id = aktorler.film_id;


select * from filmler;


--SORU3: Her iki tabloda film_id'si ortak olan verilerin film_name ve actor_name'lerini listeleyiniz


select film_name, actor_name from filmler
inner join aktorler
on filmler.film_id=aktorler.film_id;

-- 2.YOL 
select film_name, actor_name from aktorler
inner join filmler
on filmler.film_id=aktorler.film_id;
select * from filmler;

--SORU4: Tüm film_name'leri ve tüm actor_name'leri listeleyiniz

select film_name, actor_name from filmler
full join aktorler 
on filmler.film_id = aktorler.film_id;

-- 2.YOL 
select film_name, actor_name from aktorler
full join filmler 
on filmler.film_id = aktorler.film_id;



/*

TRANSACTİON: Verileri silinmeye karsı korur.


Tabloya ekledigimiz verileri silinmeye karsı korumak istiyorsak TRANSACTİON islemi kullanılmalıdır.

Begin: Transaction'ı baslatmak icin kullanılır.

Savepoint : Verileri silinmeye karsı save eder.

Rollback: Silinen verileri geri getirir.

Commit: Transaction'ı sonlandırmak icin kullanılır.

*/

create table evraklar(
id int,
onem_derecesi varchar(40),
konusu varchar(100)
);


Begin;

insert into evraklar values(100,'Cok Onemli','Saglık');
insert into evraklar values(101,'Cok Onemli','Maliye');
insert into evraklar values(102,'Cok Onemli','Nufus');
insert into evraklar values(103,'Cok Onemli','Mezuniyet');

savepoint x;

insert into evraklar values(104,'Onemsiz','Apartman Makbuzu');
insert into evraklar values(105,'Onemsiz','Su Faturası');

select * from evraklar;


delete from evraklar;

select * from evraklar;


rollback to x;


select * from evraklar;


commit;


delete from evraklar;

select * from evraklar;




/*=====================================EXISTS============================================================

 

Subquery'lerde kullanılır. Mevcut ise getir anlamında kullanılır.

EXISTS veya NOT EXISTS ifadeleri alt sorgudan getirilen degerlerin içerisinde bir degerin
olması veya olmaması durumunda işlem yapılmasını saglar

========================================================================================================*/

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');


CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');


select * from mart;


-- SORU1:  MART ve NİSAN aylarında aynı urun_id ile satılan ürünlerin urun_id’lerini
-- ve aynı zamanda bu ürünleri MART ayında alan musteri_isim 'lerini listeleyiniz 


select urun_id, musteri_isim from mart 
where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id);

-- 2.yol
select urun_id, musteri_isim from mart
where urun_id in(10,20);

-- daha dinamik hale getirelim
select urun_id, musteri_isim from mart
where urun_id in(select urun_id from nisan where mart.urun_id = nisan.urun_id);


--SORU2: MART ve NİSAN aylarında aynı urun_id ile satılmayan ürünlerin urun_id’lerini
-- ve aynı zamanda bu ürünleri MART ayında alan musteri_isim 'lerini listeleyiniz 


select urun_id, musteri_isim from mart
where not exists (select urun_id from nisan where mart.urun_id = nisan.urun_id);


-- SORU3: MART ve NİSAN aylarında aynı urun_isim'i ile satılan ürünlerin urun_isim’lerini                  
-- ve aynı zamanda bu ürünleri NİSAN ayında alan musteri_isim'lerini listeleyiniz


select urun_isim, musteri_isim from nisan
where exists (select urun_isim from mart where mart.urun_isim=nisan.urun_isim);


--2.YOL

select urun_isim, musteri_isim from nisan
where urun_isim in ('Honda','Toyota');

-- daha dinamik hale getirelim

select urun_isim, musteri_isim from nisan
where urun_isim in (select urun_isim from mart where mart.urun_isim=nisan.urun_isim);














































































