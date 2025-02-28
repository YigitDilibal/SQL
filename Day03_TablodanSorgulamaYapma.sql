USE team_153;

/*===============================================
        TABLODAN SORGULAMA YAPMAK / SELECT
===============================================*/

/*
Tüm Sütunları Seçme: Eğer tablodaki tüm sütunlardaki verilere ihtiyacınız varsa,
yıldız işareti (*) kullanarak tüm sütunları seçebilirsiniz. Bu, tablodaki her bir
 sütundan veri getirir.
*/

/*
*************** SYNTAX ***************
SELECT * FROM table_name;
*/

/*
Belirli Sütunları Seçme: Eğer sadece tablonun belirli sütunlarındaki
 verilere ihtiyacınız varsa, bu sütunların adlarını SELECT komutundan
 sonra, FROM komutu ile belirtilen tablo adından önce sıralayabilirsiniz
*/

/*
*************** SYNTAX ***************
SELECT sütun1, sütun2 FROM tablo_adı;
*/
CREATE TABLE kisiler (
    id INT ,
    isim VARCHAR(50) ,
    soyisim VARCHAR(50) ,
    yas INT,
    sehir VARCHAR(50)
);

INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Ahmet', 'Yılmaz', 30, 'Ankara');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Mehmet', 'Kara', 25, 'İstanbul');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Ayşe', 'Kaya', 22, 'İzmir');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Fatma', 'Güneş', 28, 'Bursa');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Ali', 'Çelik', 35, 'Antalya');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Elif', 'Demir', 29, 'Ankara');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Can', 'Özdemir', 33, 'İstanbul');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Deniz', 'Arslan', 24, 'İzmir');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Selin', 'Yıldız', 27, 'Bursa');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Emre', 'Koç', 31, 'Antalya');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Zeynep', 'Çınar', 26, 'Konya');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Oğuz', 'Kaplan', 40, 'Samsun');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Burcu', 'Ertuğrul', 22, 'Trabzon');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Kaya', 'Durmaz', 35, 'Diyarbakır');
INSERT INTO kisiler (isim, soyisim, yas, sehir) VALUES ('Seda', 'Aydın', 28, 'Eskişehir');

SELECT * FROM kisiler;

/*  ========================  SORU-1 ========================
 Kisiler tablosundan isim ve soy isim bilgilerini listeleyiniz.
    =========================================================
 */

SELECT isim, soyisim
FROM kisiler;

/*  ========================  SORU-2 ========================
 Kisiler tablosundan isim, yas ve sehir bilgilerini listeleyiniz.
    =========================================================
 */
 
SELECT isim, yas, sehir
FROM kisiler;						-- isim / yas / sehir siralamasi ile sonuc olustu.
SELECT yas, isim, sehir
FROM kisiler;						-- yas / isim / sehir siralamasi ile sonuc olustu.

/*===============================================
           WHERE ile Filtreleme
===============================================*/
/*
 WHERE koşulu, SQL sorgularında belirli kriterlere göre verileri filtrelemek
 için kullanılır. WHERE ile birlikte karşılaştırma ve mantıksal operatörler,
 daha spesifik ve dinamik sorgular oluşturmak için kullanılabilir.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı WHERE sütun = “istenen değer”;
*/

/*  ========================  SORU-3 ========================
 Kisiler tablosundaki sehir= antalya olan kisileri listeleyiniz.
    =========================================================
 */
 
SELECT * FROM kisiler
WHERE sehir = 'Antalya';

/*  ========================  SORU-4 ========================
    Kisiler tablosundaki yasi 22 olan kisileri listeleyiniz.
    =========================================================
 */
 
SELECT * FROM kisiler
WHERE yas = 22;

/*  ========================  SORU-5 ========================
    Kisiler tablosundaki sehri Ankara olanlarin yas, isim ve soyisim
    bilgilerini listeleyiniz.
    =========================================================
 */
 
 SELECT yas, isim, soyisim
 FROM kisiler
 WHERE sehir = 'Ankara';


/*===============================================
          Karsilastirma Operatorleri
===============================================*/

/*===============================================
Karşılaştırma Operatörleri: Karşılaştırma operatörleri,
sütun değerlerini belirli bir değer veya başka bir sütun
değeriyle karşılaştırmak için kullanılır.
===============================================*/

/*
> Eşittir (=): İki değerin eşit olup olmadığını kontrol eder.
*/

/*  ========================  SORU-6 ========================
    Kisiler tablosundaki yasi 35 olan kisilerin isim ve
    soyisimlerini listeleyiniz.
    =========================================================
 */
 
 SELECT isim, soyisim
 FROM kisiler
 WHERE yas = 35;
 
 /*
> Büyüktür (>), Küçüktür (<): Sayısal değerlerin büyüklük/küçüklüğünü karşılaştırır.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı WHERE sütun_adı > 1;
SELECT * FROM tablo_adı WHERE sütun_adı < 1;
*/

/*  ========================  SORU-7 ========================
    Kisiler tablosundaki yasi 30 `dan buyuk olan kisilerin
    bilgilerini listeleyiniz.
    =========================================================
 */
 
SELECT * FROM kisiler
WHERE yas > 30;

/*  ========================  SORU-8 ========================
    Kisiler tablosundaki ismi 'emre' den buyuk olan kisilerin
    isimlerini listeleyiniz.
    =========================================================
 */
 
 /*===============================================
CHAR veya VARCHAR türündeki ifadeler için de büyüktür (>) ve küçüktür (<)
 operatörleri kullanılabilir. Bu operatörler, karakter dizileri (stringler)
 arasında alfabetik veya leksikografik karşılaştırma yapar.
 Bu tür karşılaştırmalar, karakter dizilerinin alfabetik sırasına göre büyük
 veya küçük olup olmadıklarını belirlemek için kullanılır.
 (ASCII tablosundaki yerlerine gore karakterleri siralar)
===============================================*/

SELECT isim
FROM kisiler
WHERE isim > 'Emre';

/*  ========================  SORU-9 ========================
    Kisiler tablosundaki sehri 'D' den buyuk olan sehirlerde
    yasayan kisilerin isim ve soyisim  bilgilerini listeleyiniz.
    =========================================================
 */
 
 SELECT isim, soyisim
 FROM kisiler
 WHERE sehir > 'D';
 
 /*===============================================
Büyük eşittir (>=), > Küçük eşittir (<=): Sayısal değerlerin
büyüklüğünü/küçüklüğünü eşitlikle birlikte karşılaştırır.
===============================================*/

/*===============================================
Büyüktür (>) ve küçüktür (<) operatörleri kullanıldığında, karşılaştırmada
 belirtilen değer genellikle dahil edilmez; yani sorgulanan değer "hariç" tutulur.
 Bu, sayısal değerler, tarihler ve karakter dizileri gibi farklı veri türleri için
 geçerlidir. Eğer belirtilen değeri de dahil etmek istiyorsanız, büyük eşittir (>=)
 veya küçük eşittir (<=) operatörlerini kullanmanız gerekir.
===============================================*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı WHERE sütun_adı >= 1;
SELECT * FROM tablo_adı WHERE sütun_adı <= 1;
*/

/*  ========================  SORU-10 ========================
    Kisiler tablosundaki sehri 'Z' den kucuk veya esit olan sehirlerde
    yasayan kisileri isim ve soyisim  bilgilerini listeleyiniz.
    =========================================================
 */
 
 SELECT isim, soyisim
 FROM kisiler
 WHERE sehir <= 'Z';
 
 -- Option:
/*  ========================  SORU-10 ========================
    Kisiler tablosundaki sehri 'Konya' dan kucuk veya esit olan sehirlerde
    yasayan kisileri isim ve soyisim  bilgilerini listeleyiniz.
    =========================================================
 */
 
SELECT isim, soyisim, sehir
FROM kisiler
WHERE sehir <= 'Konya';

/*  ========================  SORU-11 ========================
    Kisiler tablosundaki ismi 'Fatma' dan kucuk veya esit olan kisilerin
    yas bilgilerini listeleyiniz.
    =========================================================
 */
 
 SELECT yas
 FROM kisiler
 WHERE isim <= 'Fatma';
 
 /*  ========================  SORU-12 ========================
    Kisiler tablosundaki yasi 35 den kucuk veya esit olan kisilerin
    bilgilerini listeleyiniz.
    =========================================================
 */
 
 SELECT *
 FROM kisiler
 WHERE yas <= 35;
 
 /*===============================================
Değildir (<> veya !=): İki değerin birbirine eşit olmadığını kontrol eder.
===============================================*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı WHERE sütun_adı <> 1;
SELECT * FROM tablo_adı WHERE sütun_adı != 1;
*/

/*  ========================  SORU-13 ========================
    Kisiler tablosundaki sehri Trabzon olmayan kisilerin
    bilgilerini listeleyiniz.
    =========================================================
 */
 
SELECT * FROM kisiler
WHERE sehir != 'Trabzon';

/*  ========================  SORU-14 ========================
    Kisiler tablosundaki soyismi Gunes olmayan kisilerin
    bilgilerini listeleyiniz.
    =========================================================
 */
 
 SELECT * FROM kisiler
 WHERE soyisim != 'Gunes';
 
 /*  ========================  SORU-15 ========================
    Kisiler tablosundaki ismi  Kaya olmayan kisilerin
    bilgilerini listeleyiniz.
    =========================================================
 */
 
 SELECT * FROM kisiler
 WHERE isim != 'Kaya';
 
 /*===============================================
        WHERE / Mantiksal Operatorler
===============================================*/

/*
"AND", "OR" ve "NOT", SQL sorgu dili içinde kullanılan mantıksal operatörlerdir.
 Bu operatörler, sorgularda belirli koşulların nasıl birleştirileceğini ve
 değerlendirileceğini kontrol eder. Bu operatörlerin kullanımı, veritabanı
 sorgularınızın esnekliğini ve gücünü arttirir.
*/

/*===============================================
        Mantiksal Operatorler / AND
===============================================*/
/*

/*
1- "AND" operatörü, birden fazla koşulun aynı anda karşılanması gerektiğinde kullanılır.
2- Tüm "AND" operatörüyle bağlanmış koşulların TRUE olması durumunda sonuç TRUE döner.
3- Eğer koşullardan herhangi biri FALSE ise, sonuç da FALSE olur.
Örnek: SELECT * FROM tablo_adi WHERE sütun1 = 'değer1' AND sütun2 = 'değer2' sorgusu,
hem sütun1'in 'değer1' değerine eşit olduğu hem de sütun2'nin 'değer2' değerine eşit olduğu kayıtları
secer.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı
WHERE 1sütun_adı = 1
AND 2sütun_adı = 2 ;
*/

/*  ========================  SORU-1 ========================
 Kisiler tablosundan 29 yaşından büyük olan ve Ankara'da yaşayan kişileri listeleyiniz.
    =========================================================
 */
 
SELECT * FROM kisiler
WHERE yas > 29
AND sehir = 'Ankara';

/*  ========================  SORU-2 ========================
 Kisiler tablosundan Adı 'Fatma' olan ve Bursa'da yaşayan kişileri listeleyiniz.
    =========================================================
 */
 
 SELECT * FROM kisiler
 WHERE isim = 'Fatma'
 AND sehir = 'Bursa';
 
 /*  ========================  SORU-3 ========================
 Kisiler tablosundan ismi 'Ayse' ve soyismi 'Kaya' olan kişileri listeleyiniz.
    =========================================================
 */
 
 SELECT *
 FROM kisiler
 WHERE isim = 'Ayse'
 AND soyisim = 'Kaya';
 
 /* ===============================================
                   BETWEEN
===============================================*/

/*
BETWEEN anahtar kelimesi, SQL'de bir aralıktaki değerleri seçmek için kullanılır.
 Bu anahtar kelime genellikle sayısal değerler, tarihler ve metinlerle kullanılır
 ve belirtilen iki değer arasındaki tüm değerleri kapsar.
 BETWEEN ile belirlenen aralık her iki uç değeri de içerir, yani "başlangıç" ve "bitiş"
 değerleri sorgu sonuçlarına dahildir.
*/

/*
*************** SYNTAX ***************
SELECT sütun_adı
FROM tablo_adı
WHERE sütun_adı BETWEEN değer1 AND değer2;
*/

/*  ========================  SORU-4 ========================
 Kisiler tablosundan yaşı 25 ile 35 arasında olan kişileri listeleyiniz.
    =========================================================
 */
 
 SELECT * FROM kisiler
 WHERE yas
 BETWEEN 25
 AND 35;   				-- > veya < olarak degil >= veya <= olarak calisir.
 
/*  ========================  SORU-5 ========================
 Kisiler tablosundan yaşı 25 ile 35 arasında olan ve Ankara'da yaşayan kişileri listeleyiniz.
    =========================================================
 */
 
 SELECT * FROM kisiler
 WHERE yas BETWEEN 25 AND 35
 AND sehir = 'Ankara';
 
 /*  ======================== Extra ========================
   Kisiler tablosundan ismi Adem ile Aylin arasında olan ve
   Ankara'da yaşayan kişileri listeleyiniz.
    =========================================================
 */
 
  SELECT * FROM kisiler
  WHERE isim BETWEEN 'Adem' AND 'Aylin'
  AND sehir = 'Ankara';
  
  /*===============================================
        Mantiksal Operatorler / OR
===============================================*/
/*

1- "OR" operatörü, birden fazla koşuldan en az birinin karşılanması
gerektiğinde kullanılır.
2- Koşullardan herhangi biri TRUE ise, sonuç TRUE döner.
3- Tüm koşullar FALSE ise, sonuç FALSE olur.
Örnek: SELECT * FROM tablo_adi WHERE sütun1 = 'değer1' OR
sütun2 = 'değer2' sorgusu, sütun1'in
'değer1' değerine eşit olduğu veya sütun2'nin 'değer2'
değerine eşit olduğu kayıtları seçer.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adı
WHERE 1sütun_adı = 1
OR 2sütun_adı = 2 ;
*/

/*  ========================  SORU-6 ========================
 Kisiler tablosundan yaşı 22 veya 35 olan kişileri listeleyiniz.
    =========================================================
 */
 
 SELECT * FROM kisiler
 WHERE yas = 22
 OR yas = 35;
 
/*  ========================  SORU-7 ========================
 Kisiler tablosundan İstanbul, Ankara veya İzmir'de yaşayan kişileri listeleyiniz.
    =========================================================
 */
 
SELECT * FROM kisiler
WHERE sehir = 'Istanbul'
OR sehir = 'Ankara'
OR sehir = 'Izmir';
 
 


