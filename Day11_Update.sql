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












