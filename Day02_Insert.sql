USE team_153;

/*===============================================
		  TABLOYA VERI GIRISI - INSERT
===============================================*/

/*-------------------- NOT -------------------------
   Degerleri girerken dikkat edilmesi gerekenler;
1- Tabloyu olustururken hangi data type belirlediysek o
   datatype cinsinden veri girisi yapmaliyiz
2- String ifadeleri 'tek tirnak' icinde yaziyoruz.
3- DATE data type'da String gibi 'tek tirnak' icinde yazilir.
4- MySQL'in default tarih formati YYYY-MM-DD seklindedir.
--------------------------------------------------*/
/*-------------------- EXTRA NOT -------------------------
 1- Bir field'a kaydedilecek verileri UNIQUE yapmak icin
   table olustururken field isminin yanina UNIQUE yaziyoruz.
 2- Bir field kaydedilecek verilerde NULL olmasin istiyorsak
   table olustururken field isminin yanina NOT NULL yaziyoruz.
--------------------------------------------------*/
/*
*************** SYNTAX ***************
INSERT INTO table_name
	VALUES (
	std_id CHAR(4),
	std_name VARCHAR(25),
	std_age INT				 
	);
*/
/*  ========================  SORU-1 ========================
 Kitaplar tablosuna null deger olmadan bir veri girisi saglayiniz.
    =========================================================
 */
 
 INSERT INTO kitaplar (kitap_id, kitap_adi, yazar_adi, yayin_yili, katagori)
					  VALUES(1, 'Sefiller', 'Victor Hugo', 1901, 'Roman');

SELECT * FROM kitaplar;

/*  ========================  SORU-2 ========================
 Kitaplar tablosuna null deger olmadan coklu veri girisi saglayiniz.
    =========================================================
 */
 
 INSERT INTO kitaplar
 VALUES(2, 'Suc ve Ceza', 'Fyodor Dostoyevski', 1901, 'Roman'),
	   (3, 'Yabanci', 'Albert Camus', 1942, 'Roman'),
       (4, '1984', 'George Orwel', 1949, 'Distopya'),
       (5, 'Fareler ve Insanlar', 'John Steinbeck', 1937, 'Roman'),
       (6, 'Kucuk Prens', 'Antoine de Saint-Exupéry', 1943, 'Cocuk Kitabi');
       
       
/*  ========================  SORU-3 ========================
 Personel tablosuna null deger olmadan coklu veri girisi saglayiniz.
    =========================================================
 */
 
 INSERT INTO personel
 VALUES(1, 'Yigit', 'Dilibal', '1999-05-10', 'Developer', 15000.50),
	   (2, 'Ahmet', 'Can', '1990-08-20', 'Cayci', 2500.75),
       (3, 'Veli', 'Han', '1984-01-15', 'IT', 7500.12);
       
SELECT * FROM personel;
       
/*  ========================  SORU-4 ========================
 ogrenciler tablosuna null deger olmadan kendi verinizin girisini saglayiniz.
    =========================================================
 */
 
INSERT INTO ogrenciler
VALUES(1236, 'Yigit', 'Dilibal', 'sayisal', 2014, 50.00);

INSERT INTO ogrenciler
			VALUES(0063,'Yusuf','Onal','Lojistik', 2013, 92.94),
				  (244, 'Sumeyra', 'Develi', 'sayısal', 2013, 74.50),
                  (0007, 'Recep', 'Alici', 'Informatik', 2013, 45.00);

SELECT * FROM ogrenciler;

INSERT INTO ogrenciler (ogrenci_id,adi,soyadi,kayit_yili)
VALUES(7504, 'John', 'Doe', 2014);


 
 
 
 



