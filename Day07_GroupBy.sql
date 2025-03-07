USE team_153;

/* ===============================================
		           GROUP BY
   ===============================================*/
   
/*
 GROUP BY SQL ifadesi, veritabanı sorgularında belirli bir veya
 birden fazla sütuna göre satırları gruplandırmak için kullanılır.
 Genellikle aggregate (toplulaştırma) fonksiyonlar
 (COUNT(), SUM(), AVG(), MIN(), MAX() vb.) ile birlikte kullanılır.
 GROUP BY ifadesi, belirtilen sütunlardaki değerlere göre benzersiz
 gruplar oluşturur ve her grup için aggregate fonksiyonların sonuçlarını
 döndürür. Bu, veriler üzerinde özetlemeler ve analizler yapmayı sağlar.
*/

/*
 Notlar
GROUP BY kullanılırken, SELECT ifadesinde belirtilen sütunların ya gruplandırma
ifadesinde (GROUP BY kısmında) belirtilmiş olması ya da bir aggregate fonksiyonunun
parçası olması gerekir.
Birden fazla sütun üzerinde gruplandırma yapılabilir. Bu durumda, sütunlar virgül
ile ayrılarak GROUP BY ifadesine eklenir.
*/

/*
*************** SYNTAX ***************
SELECT sutun_adi, SUM(adet) AS toplam_adet
FROM tablo_adi
GROUP BY sutun_adi  --> (gruplanacak verilerin oldugu);
*/

CREATE TABLE manav (
    id INT ,
    urun_adi VARCHAR(50),
    miktar_kg DECIMAL(5, 2),
    birim_fiyat DECIMAL(5,2),
    toplam_satis DECIMAL(7,2),
    satis_tarihi DATE,
    kategori VARCHAR(50)
);

INSERT INTO manav (id, urun_adi, miktar_kg, birim_fiyat, toplam_satis, satis_tarihi, kategori) VALUES
(1, 'Elma', 10.5, 35.00, 367.50, '2025-03-01', 'Meyve'),
(2, 'Muz', 20.0, 50.00, 1000.00, '2025-03-02', 'Meyve'),
(3, 'Portakal', 19.75, 25.00, 493.75, '2025-03-03', 'Meyve'),
(4, 'Domates', 20.0, 18.00, 360.00, '2025-03-04', 'Sebze'),
(5, 'Biber', 10.0, 60.00, 600.00, '2025-03-05', 'Sebze'),
(6, 'Patlıcan', 13.5, 70.00, 945.00, '2025-03-06', 'Sebze'),
(7, 'Salatalık', 17.0, 40.00, 680.00, '2025-03-07', 'Sebze'),
(8, 'Üzüm', 22.0, 80.00, 1760.00, '2025-03-08', 'Meyve'),
(9, 'Kavun', 30.0, 45.00, 1350.00, '2025-03-09', 'Meyve'),
(10, 'Karpuz', 50.0, 20.00, 1000.00, '2025-03-10', 'Meyve'),
(11, 'Elma', 2.5, 35.00, 87.50, '2025-03-02', 'Meyve'),
(12, 'Muz', 2.0, 50.00, 100.00, '2025-03-02', 'Meyve'),
(13, 'Portakal', 3.0, 25.00, 75.00, '2025-03-02', 'Meyve'),
(14, 'Domates', 4.0, 18.00, 72.00, '2025-03-02', 'Sebze'),
(15, 'Biber', 1.5, 60.00, 90.00, '2025-03-02', 'Sebze'),
(16, 'Patlıcan', 2.0, 70.00, 140.00, '2025-03-02', 'Sebze'),
(17, 'Salatalık', 3.0, 40.00, 120.00, '2025-03-02', 'Sebze'),
(18, 'Üzüm', 2.5, 80.00, 200.00, '2025-03-02', 'Meyve'),
(19, 'Kavun', 3.5, 45.00, 157.50, '2025-03-02', 'Meyve'),
(20, 'Karpuz', 5.0, 20.00, 100.00, '2025-03-02', 'Meyve');

SELECT * FROM manav;

/*  =============================  SORU-1 =============================
    Manav tablosundaki her bir urun icin toplam satis miktari nedir?
    ===================================================================
*/

SELECT urun_adi, SUM(miktar_kg) toplam_miktar
FROM manav
GROUP BY urun_adi;

/*  =============================  SORU-2 =============================
    Manav tablosundaki her bir kategori icin toplam gelir nedir?
    ===================================================================
*/
SELECT kategori, SUM(miktar_kg * birim_fiyat) toplam_gelir
FROM manav
GROUP BY kategori;

/*  =============================  SORU-3 =============================
    Manav tablosundaki en cok satilan urun nedir?  
    ===================================================================
*/

SELECT urun_adi, SUM(miktar_kg) top_kg
FROM manav
GROUP BY urun_adi
ORDER BY top_kg DESC
LIMIT 1;

/*  =============================  SORU-4 =============================
    Manav tablosundaki her bir gun icin toplam satis miktari nedir?   
    ===================================================================
*/

SELECT satis_tarihi, SUM(miktar_kg)
FROM manav
GROUP BY satis_tarihi;

/*  =============================  SORU-5 =============================
    Manav tablosundaki her bir gun icin ortalama birim fiyati nedir?
    ===================================================================
*/

SELECT satis_tarihi, AVG(birim_fiyat)
FROM manav
GROUP BY satis_tarihi;

/*  =============================  SORU-6 =============================
    Manav tablosundaki satilan en pahali urunun bilgileri nelerdir?  
    ===================================================================
*/

SELECT *
FROM manav
ORDER BY birim_fiyat DESC
LIMIT 1;

/*  =============================  SORU-7 =============================
    Manav tablosundaki meyve kategorisindeki urunlerin toplam satis miktari nedir?
    ===================================================================
*/

SELECT SUM(miktar_kg) top_kg
FROM manav
WHERE kategori = 'Meyve';


/*  =============================  SORU-8 =============================
    Manav tablosundaki her urun icin ortalama satis fiyati nedir?
    ===================================================================
*/

SELECT urun_adi, AVG(birim_fiyat)
FROM manav
GROUP BY urun_adi;

/*  =============================  SORU-11 =============================
    Manav tablosundaki her bir kategori için farklı satış tarihlerinde elde
    edilen toplam gelir nedir?
    ===================================================================
*/

SELECT kategori, satis_tarihi, SUM(miktar_kg * birim_fiyat) top_gelir
FROM manav
GROUP BY kategori, satis_tarihi;

/*  =============================  SORU-12 =============================
    Manav tablosundaki toplam satis miktarına göre en çok satılan ürünleri
    (En cok satilandan en az satilana dogru)siralayiniz?
    ===================================================================
*/

SELECT urun_adi, SUM(toplam_satis) t_satis
FROM manav
GROUP BY urun_adi
ORDER BY t_satis DESC;

/*  =============================  SORU-13 =============================
    Manav tablosundaki her kategorideki en yüksek satış fiyatına sahip ürünleri bulup,
    bunları toplam satış fiyatına göre azalan sırayla sıralayip sadece ilk 5 sonucu listeleyiniz?
    ===================================================================
*/

SELECT urun_adi, SUM(toplam_satis) top_satis, AVG(birim_fiyat) fiyat
FROM manav
GROUP BY urun_adi
ORDER BY top_satis DESC
LIMIT 5;

SELECT kategori, MAX(birim_fiyat) satis_fiyati
FROM manav
GROUP BY kategori
ORDER BY satis_fiyati DESC
LIMIT 5;







