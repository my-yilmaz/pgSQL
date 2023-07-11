/*
  SQL KOMUTLARI GRUPLARA AYRILIR :

  1.(Data Definition Language - DDL) Veri Tanimlama Dili
  CREATE: Tablo oluşturur.
  ALTER: Tabloyu günceller.
  DROP: Tabloyu siler.
  
  
  2.(Data Manipulation Language - DML) Veri Kullanma Dili
  INSERT:Tabloya veri ekler
  UPDATE:Tablodaki verileri günceller
  DELETE:Tablodaki verileri siler
  

  3.(Data Query Language - DQL) Veri Sorgulama Dili
  SELECT: Tablodaki verileri listeler. 
*/


--SORU1.1: talebeler isminde tablo olusturalım

create table talebeler(
ogrenci_tc char(11),         -- Uzunlugu belli olan String veriler icin char() data turu kullanılır
ogrenci_isim varchar(20),    -- Uzunlugu belli olmayan String veriler icin varchar() data turu kullanılır
not_ort real,                -- Ondalıklı sayılar icin real data turu kullanılır
kayit_tarihi date            -- Tarih icin date data turu kullanılır
);



-- SORU1.2: talebeler tablosundaki verileri listeleyelim

select * from talebeler;   -- * tum sutunlardaki verileri listeler






-- SORU1.3 talebeler tablosuna veri ekleyelim

insert into talebeler values('12345678912','Ahmet',72.5,'2020-02-14');
insert into talebeler values('12345678965','Mehmet',80.5,'2021-05-16');
insert into talebeler values('12345678975','Veli',86.5,'2022-02-25');




-- SORU1.4 simdi tekrar talebeler tablosundaki verileri listeleyelim

select * from talebeler;



-- SORU1.5 talebeler tablosunu silelim

drop table talebeler;