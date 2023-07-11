/*=====================================SELECT=======================================================


select * from tablo_adi ==> * Tüm sutunlardaki verileri listeler



DQL Grubundan ==> SELECT komutu ile 'Tablodaki İstedigimiz Sütundaki Verileri Listeleyebiliriz'


Syntax:
-------


select sutun_adi from tablo_adi; ==> Sadece belirtilen sutundaki verileri listeler


========================================================================================================*/

create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);

insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);


--SORU1: ogrenciler tablosundaki tum sutunlardaki verileri listeleyiniz

select * from ogrenciler;



--SORU2: ogrenciler tablosundaki 'isim' sutunundaki verileri listeleyiniz

select isim from ogrenciler;




--SORU3: ogrenciler tablosundaki 'adres' sutunundaki verileri listeleyiniz

select adres from ogrenciler;



--SORU4: ogrenciler tablosundaki 'sinav_notu' sutunundaki verileri listeleyiniz

select sinav_notu from ogrenciler;



--SORU5: ogrenciler tablosundaki 'isim' ve 'sinav_notu' sutunundaki verileri listeleyiniz

select isim,sinav_notu from ogrenciler;




/*

WHERE ==> Şart belirtmemiz gerektiginde kullanılır.

*/




--SORU6: ogrenciler tablosundaki sinav_notu 80'den büyük olan öğrencilerin tüm bilgilerini listele

select * from ogrenciler where sinav_notu>80;



--SORU7: ogrenciler tablosundaki adres'i 'Ankara' olan ögrencilerin tüm bilgilerini listele


select * from ogrenciler where adres='Ankara';




--SORU8: ogrenciler tablosundaki sinav_notu 85 ve adres'i 'Ankara' olan öğrenci isim'ini listele

select isim from ogrenciler where sinav_notu=85 and adres='Ankara';




--SORU9: ogrenciler tablosundaki sinav_notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele

  select * from ogrenciler where sinav_notu=65 or sinav_notu=85;




-- İn ==> Birden fazla ifade ile tanımlayabilecegimiz durumları in komutuyla yazabiliriz

/*
 2.YOL

 select * from ogrenciler where sinav_notu in(65,85);

 -- in komutu parantezin icerisinde yazılanları getiriyor.
*/






--SORU10: .ogrenciler tablosundaki sinav_notu 65 veya 85 olmayan ogrencilerin tüm bilgilerini listele

select * from ogrenciler where sinav_notu not in(65,85);

-- not in komutu parantezin icinde olmayanları getirir.





--SORU11: ogrenciler tablosunda sinav_notu 65 ve 85 arasında olan ogrencilerin tüm bilgilerini listele


  select * from ogrenciler where sinav_notu>=65 and sinav_notu<=85;


-- between ==> Belirttigimiz iki veri arasındaki bilgileri getirir.

/*
 2.YOL

 select * from ogrenciler where sinav_notu between 65 and 85;
*/




--SORU12:.ogrenciler tablosunda sinav_notu 75 ve 90 arasında olmayan ögrencilerin isim'ini ve sinav_notu listele



 select isim,sinav_notu from ogrenciler where sinav_notu not between 75 and 90;



/*

 2.YOL

 select isim,sinav_notu from ogrenciler where sinav_notu<75 or sinav_notu>90;

*/






-- ismi Harun Reşit olan ogrencinin tum bilgilerini listeleyiniz 

select * from ogrenciler where isim='Harun Reşit';