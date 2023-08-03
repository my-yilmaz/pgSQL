/*============================SUBQUERY==============================

 SUBQUERY:  Sorgu içinde çalışan sorguya denir.

==========================================================================*/


CREATE TABLE malzemeler    
(
ted_vergino int, 
malzeme_id int, 
malzeme_isim VARCHAR(20), 
musteri_isim VARCHAR(25)
);    
    
INSERT INTO malzemeler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO malzemeler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO malzemeler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO malzemeler VALUES(204, 1006,'TV', 'Ali Can');
INSERT INTO malzemeler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');
    



CREATE TABLE toptancilar    
(
vergi_no int,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
    
INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Sen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Cetin Hos');
INSERT INTO toptancilar VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Cos');



select * from malzemeler;


-- SORU1: Malzemeler tablosundaki musteri_isim'i 'Ali Can' olanın malzeme_isim'ini,
--toptancilar  tablosunda irtibat_ismi 'Adem Cos' olanın sirket_ismi ile güncelleyiniz.

update malzemeler set malzeme_isim=('Apple') where musteri_isim='Ali Can';

-- cevabı daha dinamik hale getirelim

update malzemeler set malzeme_isim=(select sirket_ismi from toptancilar where irtibat_ismi='Adem Cos')
where musteri_isim='Ali Can';

-- ('Apple')==> select sirket_ismi from toptancilar where irtibat_ismi='Adem Cos'

select * from malzemeler;


 -- SORU2: Malzemeler tablosundaki malzeme_isim'i 'Laptop' olanların musteri_isim'lerini,
 -- toptancilar  tablosunda sirket_ismi 'Apple' in irtibat_ismi ile güncelleyiniz.


update malzemeler set musteri_isim=('Adem Cos') where malzeme_isim='Laptop';

-- cevabı daha dinamik hale getirelim

update malzemeler set musteri_isim = (select irtibat_ismi from toptancilar where sirket_ismi='Apple')
where malzeme_isim='Laptop';

('Adem Cos')==> select irtibat_ismi from toptancilar where sirket_ismi='Apple';
select * from malzemeler;



/*================================ ORDER BY  ===================================
   ORDER BY komutu bir SORGU deyimi içerisinde belli bir SUTUN’a göre 
   SIRALAMA yapmak için kullanılır.
   
   Syntax
   -------
	ORDER BY sutun_adı              İNT==>KÜÇÜKTEN BÜYÜGE  STRİNG==>A-Z
	ORDER BY sutun_adı DESC         İNT==>BÜYÜKTEN KÜÇÜGE  STRİNG==>Z-A
==============================================================================*/   



CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50), 
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);
    	
INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Kan', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');


select * from meslekler;


-- SORU1: meslekler tablosunu isim'e göre kucukten buyuge sıralayarak listeleyiniz.


select * from meslekler order by isim;



-- SORU2: meslekler tablosunu maas'a göre buyukten kucuge sıralayarak listeleyiniz


select * from meslekler order by maas desc;



-- SORU3: meslekler tablosunda isim'i 'Ali' olanları,
-- maas'a göre büyükten küçüge sıralayarak listeleyiniz



select * from meslekler where isim='Ali' order by maas desc;



select * from meslekler;


-- SORU4: meslekler tablosunda soyisim 'i 'Bulut' olanları,
-- maas'a gore sıralayarak listeleyiniz.



select * from meslekler where soyisim='Bulut' order by maas;


select * from meslekler;

--SORU5: meslekler tablosunu, isim kelime uzunluguna gore kucukten buyuge sıralayarak listeleyiniz

select * from meslekler order by length(isim);

-- eger kelime uzunluguna gore sıralama yapmak istersek length komutunu kullanırız.


--SORU6: meslekler tablosunu, soyisim kelime uzunluguna gore buyukten kucuge sıralayarak listeleyiniz


select * from meslekler order by length(soyisim) desc;


-- LİMİT

-- Sınır koymak icin kullanılır.


create table musteriler
(
id int,
musteri_isim varchar(50),
maas int
);


insert into musteriler values(1,'Ayse',10000);
insert into musteriler values(2,'Adem',15000);
insert into musteriler values(3,'Halit',20000);
insert into musteriler values(4,'Hasan',25000);
insert into musteriler values(5,'Recep',30000);
insert into musteriler values(6,'Harun',35000);
insert into musteriler values(7,'Hatice',40000);
insert into musteriler values(8,'Poyraz',50000);
insert into musteriler values(9,'Ayse',60000);
insert into musteriler values(10,'Adem',70000);



--SORU1: musteriler tablosundaki ilk 5 kisinin bilgilerini listeleyiniz.


select * from musteriler limit 5;



-- SORU2: musteriler tablosunda id degeri 2 den büyük olan,
-- ilk 3 veriyi listeleyiniz




select * from musteriler where id>2 limit 3;





-- SORU3: musteriler tablosunda maas'i 20000'den büyük olan,
-- ilk 3 veriyi listeleyiniz




select * from musteriler where maas>20000 limit 3;





-- SORU4: musteriler tablosunda maası en yüksek 3 kişinin bilgilerini listeleyiniz



select * from musteriler order by maas desc limit 3;




--SORU5: musteriler tablosunda maası en yüksek ilk 2 veriden sonra 5 veriyi listeleyin 


select * from musteriler order by maas desc offset 2 limit 5;

-- NOT: satır atlamak istedigimizde offset komutunu kullanırız.



-- SORU6: musteriler tablosunda en yüksek maaşı alan 3. 4. 5. 6. kişilerin bilgilerini listeleyiniz


select * from musteriler order by maas desc offset 2 limit 4;







































