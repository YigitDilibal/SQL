USE team_153;

/* ====================================== UPDATE ========================================
Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.
-----Syntax-----
UPDATE table_name
SET field1 = 'Emre'
WHERE condition;
UPDATE islemlerinin yapilabilmesi icin Ayarlar -> SQL Editor -> "Safe Updates" check box'indaki
tik isaretini kaldirip kaydetmemiz gerekiyor, sonrasinda MySQL'i kapatip tekrar acmaliyiz
SET SQL_SAFE_UPDATES = 0;
========================================================================================*/


/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun.
id ve isim field'lari PRIMARY KEY olsun.
---------------------------------------------------------------------------------------*/

CREATE TABLE firmalar
(
	id INT AUTO_INCREMENT,
    isim VARCHAR(20),
    iletisim_isim  VARCHAR(20),
    PRIMARY KEY id_isim (id,isim)
);

SELECT * FROM firmalar;

/*--------------------------------------------------------------------------------------
2) Icine 3 kayit ekleyin :
('ACB', 'Ali Can'),
('RDB', 'Veli Gul'),
('KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/

INSERT INTO firmalar (isim, iletisim_isim)
VALUES  ('ACB', 'Ali Can'),
        ('RDB', 'Veli Gul'),
        ('KMN', 'Ayse Gulmez');
        
SELECT * FROM firmalar;


-- Id'si 3 olan firmanin ismini 'KRM' olarak guncelleyiniz

UPDATE firmalar
SET isim = 'KRM'
WHERE id = 3;

-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.

UPDATE firmalar
SET id = 4
WHERE iletisim_isim = 'Veli Gul';

UPDATE firmalar
SET isim = 'FDS'
WHERE iletisim_isim = 'Veli Gul';

UPDATE firmalar
SET id = 4 , isim = 'FDS'
WHERE iletisim_isim = 'Veli Gul';

SELECT * FROM firmalar;

-- Ismi ACB olan firmanin iletisim ismini 'Osman Can' olarak guncelleyiniz.

UPDATE firmalar
SET iletisim_isim = 'Osman Can'
WHERE isim = 'ACB';

-- Iletisim ismi 'Osman Can' olan firmanin iletisim ismini 'Cem Can' olarak guncelleyiniz.

UPDATE firmalar
SET iletisim_isim = 'Cem Can'
WHERE iletisim_isim = 'Osman Can';

-- *******************************************************************
-- id, isim ve irtibat fieldlarinin oldugu bir tedarik tablosu olusturun.
-- id field'ini Primary Key yapin.

CREATE TABLE tedarik
(
	id INT AUTO_INCREMENT,
    isim VARCHAR(20),
    irtibat VARCHAR(15),
    PRIMARY KEY id_pk (id)
    );
    
 -- tedarikci_id, urun_id, urun_ismi, musteri_isim fieldlari olan urun
-- tablosu olusturun
-- Bu tablodaki tedarikci_id fieldinin tedarik tablosunun PK si ile
-- Foreign Key baglantisini kurun

CREATE TABLE urun
(
	tedarikci_id INT,
	urun_id INT UNIQUE,
    urun_ismi VARCHAR(40) NOT NULL,
    musteri_isim VARCHAR(25),
    FOREIGN KEY tedarikciID_fk (tedarikci_id)
    REFERENCES tedarik(id)
);

-- Database once PK nin bulundugu tablo yani parent table (tedarik) create edilir.
-- Database sonra FK nin bulundugu tablo yani child table (urun) create edilir.

INSERT INTO tedarik VALUES(100, 'IBM', 'Ali Can');
INSERT INTO tedarik VALUES(101, 'APPLE', 'Merve Temiz');
INSERT INTO tedarik VALUES(102, 'SAMSUNG', 'Kemal Can');
INSERT INTO tedarik VALUES(103, 'LG', 'Ali Can');
INSERT INTO urun VALUES(100, 1001,'Laptop', 'Suleyman');
INSERT INTO urun VALUES(101, 1002,'iPad', 'Fatma');
INSERT INTO urun VALUES(102, 1003,'TV', 'Ramazan');
INSERT INTO urun VALUES(103, 1004,'Phone', 'Ali Can');

 SELECT * FROM tedarik;
 SELECT * FROM urun;
 
 -- 'LG' firmasinda calisan 'Ali Can'in ismini 'Veli Can' 
-- olarak degistiriniz.
 
 UPDATE tedarik
 SET irtibat = 'Veli Can'
 WHERE irtibat = 'Ali Can'
 AND isim = 'LG';
 
 /* a) Urun tablosundan Ali Can'in aldigi urunun ismini, 
tedarik tablosunda irtibat Merve Temiz olan 
sirketin ismi ile degistirin. */
 
 UPDATE urun
 SET urun_ismi = (SELECT isim
				  FROM tedarik
                  WHERE irtibat = 'Merve Temiz')
 WHERE musteri_isim = 'Ali Can';


-- Urun tablosundaki TV satin alan musterinin ismini,
-- tedarik tablosundaki IBM'in irtibat'i ile degistirin.

UPDATE urun
SET musteri_isim = (SELECT irtibat
					FROM tedarik
					WHERE isim = 'IBM')
WHERE urun_ismi = 'TV';

-- urun id'si 1001 olan urun ismini, id'si 102 olan sirketin ismi ile degistirin.

UPDATE urun
SET urun_ismi = (SELECT isim
				 FROM tedarik
                 WHERE id = 102)
WHERE urun_id = 1001;

/*  Cocuklar tablosu olusturun.
 Icinde id,isim,veli_isim ve grade field'lari olsun.
 Id field'i Primary Key olsun. */
 
CREATE TABLE cocuklar(
id INT,
isim VARCHAR(20),
veli_isim VARCHAR(10),
grade DOUBLE,
CONSTRAINT id_pk PRIMARY KEY (id)
);

INSERT INTO cocuklar VALUES
 (123, 'Ali Can', 'Hasan',75),
 (124, 'Merve Gul', 'Ayse',85),
 (125, 'Kemal Yasa', 'Hasan',85),
 (126, 'Rumeysa Aydin', 'Zeynep',85),
 (127, 'Oguz Karaca', 'Tuncay',85),
 (128, 'Resul Can', 'Tugay',85),
 (129, 'Tugay Kala', 'Osman',45);
 
SELECT * FROM cocuklar;


/* puanlar tablosu olusturun.
ogrenci_id, ders_adi, yazili_notu field'lari olsun,
ogrenci_id field'i Foreign Key olsun  */


CREATE TABLE puanlar
(
ogrenci_id INT,
ders_adi VARCHAR(10),
yazili_notu DOUBLE,
CONSTRAINT puanlar_fk
FOREIGN KEY (ogrenci_id)
REFERENCES cocuklar (id)
);


INSERT INTO puanlar VALUES ('123','kimya',75);
INSERT INTO puanlar VALUES ('124','fizik',65);
INSERT INTO puanlar VALUES ('125','tarih',90);
INSERT INTO puanlar VALUES ('126','kimya',87);
INSERT INTO puanlar VALUES ('127','tarih',69);
INSERT INTO puanlar VALUES ('128','kimya',93);
INSERT INTO puanlar VALUES ('129','fizik',25);

SELECT * FROM puanlar;
SELECT * FROM cocuklar;

-- Tum cocuklarin gradelerini puanlar tablosundaki yazili_notu ile update edin.

UPDATE cocuklar
SET grade = (SELECT yazili_notu
			 FROM puanlar
			 WHERE puanlar.ogrenci_id = cocuklar.id);
             
-- Ismi Kemal Yasa olan ogrencinin grade'ini puanlar tablosundaki
-- ogrenci id'si 128 olan yazili notu ile update edin.
             
UPDATE cocuklar
SET grade = (SELECT yazili_notu
			 FROM puanlar
             WHERE ogrenci_id = 128)
WHERE isim = 'Kemal Yasa';

-- Tum cocuklarin veli isimlerini puanlar tablosundaki ders_adi ile update edin.

UPDATE cocuklar
SET veli_isim = (SELECT ders_adi
				 FROM PUANLAR
                 WHERE PUANLAR.ogrenci_id = cocuklar_id);
	
    
-- Puanlar tablosundaki ders_adi 'fizik' olan ogrenci_id degerini
-- cocuklar tablosundaki grade degeri 25 olan ogrencinin id ile guncelleyiniz.

UPDATE puanlar
SET ogrenci_id = (SELECT id
				  FROM cocuklar
                  WHERE grade = 25)
WHERE ders_adi = 'fizik';

-- Puanlar tablosundaki ders_adi 'kimya' olan ogrenci_id degerini
-- cocuklar tablosundaki id degeri 125 olan ogrencinin grade degeri ile guncelleyiniz.

UPDATE puanlar
SET ogrenci_id = (SELECT grade
				  FROM cocuklar
                  WHERE id = 125)
WHERE ders_adi = 'Kimya';

CREATE TABLE mart_satislar
(
 urun_id int,
 musteri_isim varchar(20),
 urun_isim varchar(10),
 urun_fiyat int
);

INSERT INTO mart_satislar VALUES (10, 'Ali', 'Honda',75000);
INSERT INTO mart_satislar VALUES (10, 'Ayse', 'Honda',95200);
INSERT INTO mart_satislar VALUES (20, 'Hasan', 'Toyota',107500);
INSERT INTO mart_satislar VALUES (30, 'Mehmet', 'Ford', 112500);
INSERT INTO mart_satislar VALUES (20, 'Ali', 'Toyota',88000);
INSERT INTO mart_satislar VALUES (10, 'Hasan', 'Honda',150000);
INSERT INTO mart_satislar VALUES (40, 'Ayse', 'Hyundai',140000);
INSERT INTO mart_satislar VALUES (20, 'Hatice', 'Toyota',60000);

SELECT * FROM mart_satislar;

-- Toyota marka araclara %10 indirim yapin

UPDATE mart_satislar
SET urun_fiyat = (urun_fiyat * 0.9)
WHERE urun_isim = 'Toyota';

-- Ismi A ile baslayan butun musterilerin urun_fiyatlarini %15 artirin

UPDATE mart_satislar
SET urun_fiyat = (urun_fiyat /100 *115)
WHERE musteri_isim LIKE 'a%';

/*================================== DELETE ============================================
DELETE FROM table_name
komutu tablodaki tum recordlari siler.
Eger tum kayitlar silindikten sonra tabloyu gormek isterseniz size sadece bos bir tablo
gosterir.
DELETE komutu sadece datalari siler, tabloyu silmez.
=======================================================================================*/

-- DELETE FROM tablo_adi;  Tablonun tum icerigini siler.
-- Bu komut bir DML komutudur. Dolayisiyla devaminda WHERE gibi cumlecikler
-- kullanilabilir.

/*
 DELETE FROM tablo_adi
 WHERE field = veri;
*/

SELECT * FROM mart_satislar;
DELETE FROM mart_satislar;
SELECT * FROM mart_satislar;

--    SAVEPOINT ABC; -- Verileri database'e yedekler..
--    ROLLBACK TO  ABC;  Yedeklenen verilerimizi geri getirir.

-- Bilgileri geri getirirken sikinti yasamamak icin
-- ayarlar sql execution auto commit tiki kaldirin ve
-- mySQL workbench'i kapatip acin.

SELECT * FROM mart_satislar;

SAVEPOINT ABC;  -- 20:38

DELETE FROM mart_satislar;

SELECT * FROM mart_satislar;

ROLLBACK TO  ABC;  -- 20:41

SELECT * FROM mart_satislar;


CREATE TABLE kursiyer
(
id char(3),
isim varchar(50),
veli_isim varchar(50),
yazili_notu int,
CONSTRAINT kursiyer_pk
PRIMARY KEY (id)
);

INSERT INTO kursiyer VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO kursiyer VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO kursiyer VALUES(125, 'Kemal Yasa', 'Ali',85);

SELECT * FROM kursiyer;

-- Veli ismi Ali ve Ayse olan datalari siliniz.

DELETE FROM kursiyer
WHERE veli_isim = 'Ali'
OR veli_isim = 'Ayse';
SELECT * FROM kursiyer;

-- Yazili notu 84'ten buyuk olan kursiyer silin

DELETE FROM kursiyer
WHERE yazili_notu > 84;
SELECT * FROM kursiyer;

-- Yazili notu 85'e eşit olmayan kursiyerleri silin

DELETE FROM kursiyer
WHERE NOT yazili_notu = 85;


/* ============================= DELETE - TRUNCATE - DROP ================================
  => TRUNCATE TABLE komutu tablodaki tum datalari kalici olarak siler
  => Truncate ve Delete komutlarinin ikisi de bir tabloda bulunan recordlari
	 silmek icin kullanilir.
  => Iki komut da sadece belirtilen tablodaki kayitlari siler.
  => En belirgin farki ise Delete komutu ile belirli bir araligi silebilirken,
  => Truncate komutu tablodaki tum verileri siler.
  
  SAVEPOINT baslangic;  -- Database' e verilerimizi yedekler
  ROLLBACK TO baslangic; -- Yedeklenen verileri geri getirir.
	TRUNCATE TABLE ogrenciler;   -- Truncate icin dogru kullanimdir.
    TRUNCATE TABLE ogrenciler    -- TRuncate icin yanlis kullanim.
    WHERE id=125;
    
  -- Delete komutu ile silinen veriler ROLLBACK TO Komutu ile kolaylikla geri
    alinabilir.
    
  -- Truncate ile silinen veriler geri alinmasi daha zordur. Ancak
     Transaction yontemi ile geri alinmasi mumkun olabilir.
     
 -- DROP TABLE komutu da bir DDL komutudur. Ancak DROP veriler ile birlikte tabloyu da
    siler.
    
  -- Tablodaki kayitlari silmek ile tabloyu silmek farkli islemlerdir.
  -- Silme komutlari da iki basamaklidir, biz genelde geri getirilebilecek sekilde sileriz.
  -- Ancak bazen guvenlik gibi sebeplerle geri getirilmeyecek sekilde silinmesi istenebilir.
  */
CREATE TABLE talebeler
	(
		id CHAR(3) PRIMARY KEY,
		isim VARCHAR(50),
		veli_isim VARCHAR(50),
		yazili_notu INT
	);
INSERT INTO talebeler VALUES
		(123,'Ali Can', 'Hasan', 75),
		(124,'Merve Gul', 'Ayse', 85),
		(125,'Kemal Yasa', 'Hasan', 85),
		(126,'Nesıbe Yılmaz', 'Ayse', 95),
		(127,'Mustafa Bak', 'Can', 99);
CREATE TABLE dereceler
		(
			talebe_id CHAR(3),
			ders_adi VARCHAR(30),
			yazili_notu INT,
			CONSTRAINT talebe_id_fk FOREIGN KEY (talebe_id)
			REFERENCES talebeler(id)
		);
INSERT INTO dereceler VALUES
		(123, 'Kimya', 75),
		(124, 'Fizik', 65),
		(125, 'Tarih', 90),
		(126, 'Matematik', 90),
		(127, 'Matematik', 23);
        
        

-- Talebeler tablosundan id'si 125 ten buyuk olan datalari siliniz.
-- Parent Child iliskisi icerisindeki tablolardan veri silinirken once child
-- sonra parent tablodaki veri silinmelidir.

DELETE FROM dereceler
WHERE talebe_id > 125;  -- FK tablosundan talebe_id'si 125'ten buyuk verileri sildik.
DELETE FROM talebeler
WHERE id > 125;      -- -- PK tablosundan id'si 125'ten buyuk verileri sildik.

-- ------------------- ON DELETE CASCADE -------------
/*     Her defasinda once child tablodaki verileri silmek yerine
		ON DELETE CASCADE silme ozelligini aktif hale getirebiliriz.
		Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutunu yazmak yeterli.
   */
   
CREATE TABLE talebeler
	(
		id CHAR(3) PRIMARY KEY,
		isim VARCHAR(50),
		veli_isim VARCHAR(50),
		yazili_notu INT
	);
    
INSERT INTO talebeler VALUES
		(123,'Ali Can', 'Hasan', 75),
		(124,'Merve Gul', 'Ayse', 85),
		(125,'Kemal Yasa', 'Hasan', 85),
		(126,'Nesıbe Yılmaz', 'Ayse', 95),
		(127,'Mustafa Bak', 'Can', 99);
        
CREATE TABLE dereceler
		(
			talebe_id CHAR(3),
			ders_adi VARCHAR(30),
			yazili_notu INT,
			CONSTRAINT talebe_id_fk FOREIGN KEY (talebe_id)
			REFERENCES talebeler(id) ON DELETE CASCADE
		);
        
INSERT INTO dereceler VALUES
		(123, 'Kimya', 75),
		(124, 'Fizik', 65),
		(125, 'Tarih', 90),
		(126, 'Matematik', 90),
		(127, 'Matematik', 23);
        
SELECT * FROM talebeler;
SELECT * FROM dereceler;

-- Talebeler tablosundan id'si 125 ten buyuk olan datalari siliniz.
DELETE FROM talebeler
WHERE id > 125;
SELECT * FROM talebeler;
SELECT * FROM dereceler;



             
             












