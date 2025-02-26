USE team_153;

/*===============================================
		  TABLOYU DEGISTIRME - ALTER TABLE
===============================================*/
/*ALTER TABLE ifadesi, SQL'de mevcut bir veritabanı tablosunun
yapısını değiştirmek için kullanılır. Bu komut sayesinde, tabloya
 yeni sütunlar ekleyebilir, mevcut sütunları değiştirebilir veya silebilir,
 sütunların veri türlerini güncelleyebilir, sütunlara kısıtlamalar (constraints)
 ekleyebilir veya mevcut kısıtlamaları kaldırabilirsiniz.
 */
/*===============================================
		   ALTER TABLE - Sutun Ekleme
===============================================*/
/*
*************** SYNTAX ***************
ALTER TABLE tablo_adi
ADD sütun_adi + dataType;
*/

/*  ========================  SORU-1 ========================
 Kitaplar tablosuna sayfa sayisi column'i ekleyiniz.
    =========================================================
 */
 
ALTER TABLE kitaplar
ADD sayfa_sayisi INT;

SELECT * FROM kitaplar;

ALTER TABLE kitaplar
 ADD fiyat DOUBLE(6,2);
 
SELECT * FROM kitaplar;

/*  ========================  SORU-3 ========================
       Personel tablosuna sehir column'i ekleyiniz
    =========================================================
 */
 
ALTER TABLE personel
ADD sehir VARCHAR(20);

SELECT * FROM personel;


/*===============================================
ALTER TABLE - Sütunun Veri Türünü Değiştirme
===============================================*/

/*
*************** SYNTAX ***************
ALTER TABLE tablo_adi
MODIFY COLUMN  sütun_adi + yeniDataType;
*/

/*  ========================  SORU-4 ========================
 Ogrenciler tablosundaki adi column'inin data type'ini degistiriniz .
    =========================================================
 */
 
 ALTER TABLE ogrenciler
 MODIFY COLUMN adi CHAR(20);
 
 
/*  ========================  SORU-5 ========================
 Ogrenciler tablosundaki kayit yili column'inin data type'ini degistiriniz .
    =========================================================
 */
 
ALTER TABLE ogrenciler
MODIFY COLUMN kayit_yili VARCHAR(4);

/*===============================================
		ALTER TABLE - Sütun Adını Değiştirme
===============================================*/

/*
*************** SYNTAX ***************
ALTER TABLE tablo_adi
RENAME COLUMN  eskiSütunAdi TO yeniSütunAdi;
*/

/*  ========================  SORU-6 ========================
 Personel tablosundaki pozisyon column'in adini sorumluluk olarak degistiriniz.
    =========================================================
 */
 
 ALTER TABLE personel
 RENAME COLUMN pozisyon TO sorumluluk;
 
 /*  ========================  SORU-7 ========================
 Ogrenciler tablosundaki adi column'in adini isim olarak degistiriniz.
    =========================================================
 */
 
  ALTER TABLE ogrenciler
 RENAME COLUMN adi TO isim;
 
 /*  ========================  SORU-7 ========================
 Ogrenciler tablosundaki soyadi column'in adini soyisim olarak degistiriniz.
    =========================================================
 */
 
 ALTER TABLE ogrenciler
 RENAME COLUMN soyadi TO soyisim;
 
 /*===============================================
		ALTER TABLE - Sütun Silme
===============================================*/
/*

*************** SYNTAX ***************
ALTER TABLE tablo_adi
DROP COLUMN  sütun_adi;
*/

/*  ========================  SORU-8 ========================
 Ogrenciler tablosundaki ogrenci id column'ini siliniz.
    =========================================================
 */
 
 ALTER TABLE ogrenciler
 DROP COLUMN ogrenci_id;
 
 /*  ========================  SORU-9 ========================
 Kitaplar tablosundaki sayfa sayisi column'ini siliniz.
    =========================================================
 */
 
 ALTER TABLE kitaplar
 DROP COLUMN sayfa_sayisi;
 
 SELECT * FROM kitaplar;
 
 /*  ========================  SORU-10 ========================
 Personel tablosundaki sehir column'ini siliniz.
    =========================================================
 */
 
 ALTER TABLE personel
 DROP COLUMN sehir;
 
  SELECT * FROM personel;
  
  /*===============================================
		  TABLOYU SILME - DROP TABLE
===============================================*/
/*DROP TABLE ifadesi, SQL'de veritabanı nesnelerini (tablo, görünüm, dizin, vb.)
 kalıcı olarak silmek için kullanılır. DROP komutu, belirtilen nesneyi ve o nesneyle
 ilişkili tüm verileri veritabanından kaldırır. Bu işlem geri alınamaz, yani DROP komutu
 kullanıldığında, nesne ve içeriği kalıcı olarak silinir ve geri getirilemez.
 */
/*
 NOT!
DROP ifadesi ile sadece tabloları değil veritabanını da silebileceğiniz için
 bu komutu kullanırken çok dikkatli olmalısınız….
 */
 /*
*************** SYNTAX ***************
DROP TABLE tablo_adi;
*/

/*  ========================  SORU-1 ========================
      Kitaplar tablosunu siliniz.
    =========================================================
 */
 
 SELECT * FROM kitaplar;
 DROP TABLE kitaplar;
 SELECT * FROM kitaplar;
 
/*  ========================  SORU-2 ========================
      Personel tablosunu siliniz.
    =========================================================
 */
 
 DROP TABLE personel;
 
 CREATE SCHEMA deneme;
 DROP SCHEMA deneme;
 
 /*===============================================
	 TABLO İÇERİĞİNİ SİLME - TRUNCATE TABLE
===============================================*/

 /*TRUNCATE TABLE komutu, SQL'de bir tablodaki tüm satırları hızlı ve etkili
 bir şekilde silmek için kullanılır. Bu komut, tabloyu silmez veya tablonun
 yapısını değiştirmez, sadece tablo içindeki tüm verileri temizler. TRUNCATE TABLE
 komutunun kullanımı genellikle DELETE komutuna göre çok daha hızlıdır çünkü TRUNCATE,
 tablodaki verileri toplu olarak siler ve her bir satır için ayrı ayrı log kaydı tutmaz.
 */
 
 /*
NOT!
TRUNCATE TABLE komutunun etkileri kalıcıdır ve geri alınamaz, bu nedenle bu komutu
 kullanmadan önce verilerin yedeklenmesi önemlidir. Ayrıca, tüm verilerin silineceğini
 ve bu işlemin geri alınamayacağını unutmamak önemlidir.
 */
 
 /*
*************** SYNTAX ***************
TRUNCATE TABLE tablo_adi;
*/

/*  ========================  SORU-1 ========================
      Ogrenciler tablosunu truncate kullanarak siliniz.
    =========================================================
 */
 
SELECT * FROM ogrenciler;
TRUNCATE TABLE ogrenciler;
SELECT * FROM ogrenciler;

/*  ========================  SORU-2 ========================
      Kitaplar tablosunu create edin sonra truncate kullanarak siliniz.
    =========================================================
 */
 
 CREATE TABLE kitaplar      -- olusturulacak olan tablonun ismi
 (
 kitap_id INT,             -- sutun headerleri ve sutun veri tipleri
 kitap_adi VARCHAR(30),
 yazar_adi VARCHAR(30),
 yayin_yili YEAR,
 katagori VARCHAR(20)
 );
 
 INSERT INTO kitaplar
 VALUES(2, 'Suc ve Ceza', 'Fyodor Dostoyevski', 1901, 'Roman'),
	   (3, 'Yabanci', 'Albert Camus', 1942, 'Roman'),
       (4, '1984', 'George Orwel', 1949, 'Distopya'),
       (5, 'Fareler ve Insanlar', 'John Steinbeck', 1937, 'Roman'),
       (6, 'Kucuk Prens', 'Antoine de Saint-Exupéry', 1943, 'Cocuk Kitabi');
       
       TRUNCATE TABLE kitaplar;	
       
       
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 