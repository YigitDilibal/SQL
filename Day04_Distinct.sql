USE team_153;

/* ===============================================
		       SELECT - DISTINCT
   ===============================================*/
   
 /*
 DISTINCT anahtar kelimesi SQL'de, bir sorgu sonucu setinden
 yalnızca benzersiz (tekrar etmeyen) değerleri seçmek için
 kullanılır. Tekrarlanan verilerin filtrelenmesi ve veri
 setinden tekil kayıtların alınması gerektiğinde bu ifade
 devreye girer.
DISTINCT genellikle SELECT ifadesiyle birlikte kullanılır
ve SELECT sorgusunun hemen ardından gelir.
*/

 /*
*************** SYNTAX ***************
SELECT DISTINCT sütun_adı
FROM tablo_adı;
*/

CREATE TABLE siparisler (
    id INT ,
    musteri_adi VARCHAR(50),
    urun_adi VARCHAR(50),
    siparis_tarihi DATE
);

INSERT INTO siparisler (musteri_adi, urun_adi, siparis_tarihi)
VALUES  ('Ahmet Yılmaz', 'Laptop', '2023-01-10'),
		('Ayşe Kaya', 'Akıllı Telefon', '2023-01-12'),
		('Mehmet Öz', 'Laptop', '2023-02-05'),
		('Ahmet Yılmaz', 'Akıllı Telefon', '2023-02-10'),
		('Ayşe Kaya', 'Tablet', '2023-02-20'),
		('Ahmet Yılmaz', 'Laptop', '2023-02-25');
        
SELECT * FROM siparisler;

/*  =============================  SORU-1 =============================
    Siparisler tablosundaki müşteri adlarından benzersiz olanları listeleyin.
    ===================================================================
 */
 
SELECT DISTINCT musteri_adi
FROM siparisler;

/*  =============================  SORU-2 =============================
    Siparisler tablosuna gore hangi urunler siparis edilmis.
    (Urunler UNIQUE (benzersiz) olmali)
    ===================================================================
*/

SELECT DISTINCT urun_adi
FROM siparisler;

/*  ============================= SORU-3 =============================
    Siparisler tablosundaki verilere gore subat ayi icerisinde satilan
    urunleri benzersiz olarak listeleyiniz
    ===================================================================
*/

SELECT DISTINCT urun_adi
FROM siparisler
WHERE siparis_tarihi
LIKE '_____02___';



