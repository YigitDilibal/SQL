USE team_153;

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


-- 1 yol
DELETE FROM kursiyer
WHERE yazili_notu != 85;

-- 2. yol
DELETE FROM kursiyer
WHERE yazili_notu <> 85;

-- 3. yol
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



		SELECT * FROM talebeler;
		SELECT * FROM dereceler;


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








