-- bu bir yorum satırıdır.

/*

Bu bir yorum bloğudur.

*/

/*===============================================
		TABLO OLUSTURMA (CRUD - Create)
===============================================*/
/*
"CREATE TABLE" bir veritabanında yeni bir tablo oluşturmak için kullanılan
bir SQL (Structured Query Language) ifadesidir. Bu komut, tablonun yapısını
tanımlar; yani tabloda bulunacak sütunların isimlerini, veri tiplerini ve diğer
özelliklerini (örneğin, Primary Key, Unique, Not Null  vb.) belirtir.
"CREATE TABLE" komutunu kullanırken, her bir sütun için uygun veri tipini ve
boyutunu belirlemek ve gerektiğinde sütunlara kısıtlamalar eklemek önemlidir.
Bu işlem, veri bütünlüğünü korumak ve veritabanı işlemlerinin doğru şekilde
çalışmasını sağlamak için kritik öneme sahiptir.
*/

/*
*************** SYNTAX ***************
CREATE TABLE tablo_adi
(
    sütun1 veri_tipi1 ,
    sütun2 veri_tipi2 ,
    ...
    sütunN veri_tipiN ,
);
*/

/*  ========================  SORU-1 ========================
 Icerisinde kitap id, kitap adi, yazar adi, yayin yili ve kategori columnlari
 olan bir kitaplar tablosu create ediniz.
    =========================================================
 */
 
 USE team_153;
 
CREATE TABLE kitaplar      -- olusturulacak olan tablonun ismi
 (
 kitap_id INT,             -- sutun headerleri ve sutun veri tipleri
 kitap_adi VARCHAR(30),
 yazar_adi VARCHAR(30),
 yayin_yili YEAR,
 katagori VARCHAR(20)
 );
 
 /*
 Yazili olmayan kurallar:
 1- SQL calisirken SQL komutlari buyuk harfler ile yazilir.
 2- Her adim veya her komut bir alt satira yazilir.
 3- Headers ve tablo isimlendirmeleri yapilirken snake_case kullanilir.
 */
 
 /*  ========================  SORU-2 ========================
 Icerisinde personel id, adi, soyadi, dogum tarihi, pozisyon, maas columnlari
 olan bir personel tablosu create ediniz.
    =========================================================
 */
 
 CREATE TABLE personel
 (
 personel_id INT,
 adi VARCHAR(20),
 soyadi VARCHAR(20),
 dogum_tarihi DATE,
 pozisyon VARCHAR(20),
 maas DOUBLE(10,2)
 );
 
 /*  ========================  SORU-3 ========================
 Icerisinde ogrenci id, adi, soyadi, bolum, kayit yili, ortalama not
 columnlari olan bir ogrenciler tablo create ediniz.
    =========================================================
 */
 
 CREATE TABLE ogrenciler
 (
 ogrenci_id INT,
 adi VARCHAR(20),
 soyadi VARCHAR(20),
 bolum VARCHAR(30),
 kayit_yili YEAR,
 ortalama_not DOUBLE(4,2)
 );
 
 
 /*===============================================
		TABLO GORUNTULEME - SELECT
===============================================*/
/*
SELECT komutu, SQL'de veritabanından veri sorgulamak ve almak için
 kullanılan temel bir komuttur. Bu komut, belirtilen kriterlere uygun
 verileri seçmek ve görüntülemek için kullanılır
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi;
*/

/*  ========================  SORU-1 ========================
 Kitaplar tablosunu goruntuleyiniz.
    =========================================================
 */
 
 SELECT * FROM kitaplar;
 
 /*  ========================  SORU-2 ========================
 Personel tablosunu goruntuleyiniz.
    =========================================================
 */
 
 SELECT * FROM personel;
 
 SELECT adi, soyadi
 FROM personel;
 
 
 
 
 




