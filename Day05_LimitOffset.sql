USE team_153;

/*===============================================
		      LIMIT - OFFSET
===============================================*/
/*
LIMIT ifadesi, bir sorgu sonucundan döndürülecek
maksimum satır sayısını belirlemenizi sağlar.
Eğer bir sorgu sonucu çok sayıda satır döndürüyorsa
 ve siz sadece bir kısmını görmek istiyorsanız,
 LIMIT kullanabilirsiniz.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi
LIMIT 10;
*/

/*
 OFFSET ifadesi, sorgu sonucu setinde bir başlangıç
 noktası belirler.
 Bu, özellikle sayfalama işlemlerinde faydalıdır.
 OFFSET genellikle LIMIT ile birlikte kullanılır.
*/

/*
*************** SYNTAX ***************
SELECT * FROM tablo_adi
LIMIT 10 OFFSET 20;
-- ilk 20 satiri atla sonraki 10 satiri getir.
-- yani 21,22,23,24,25,26,27,28,29,30. satirlari getirir.
*/

/*  =============================  SORU-12 =============================
       Kitaplik tablosundan ilk 5 Kitabı listeleyiniz.
    ===================================================================
 */
 
SELECT * FROM kitaplik
LIMIT 5;
 
/*  =============================  SORU-13 =============================
    Kitaplik tablosundaki en yeni 3 Kitabı listeleyiniz.
    ===================================================================
 */
 
 SELECT yayin_yili, kitap_adi
FROM kitaplik
ORDER BY yayin_yili DESC
LIMIT 3;

/*  =============================  SORU-14 =============================
      Kitaplik tablosundan rastgele 3 kitap secip listeleyiniz.
    ===================================================================
*/

SELECT * FROM kitaplik
ORDER BY RAND()
LIMIT 3;

-- RAND() fonksiyonu, özellikle bir tablodan rastgele kayıtlar seçmek için
--   kullanılır.
-- ORDER BY RAND() ifadesi, tablonun satırlarını rastgele bir sıraya sokar.
-- Bu yöntem, özellikle küçük ve orta ölçekli tablolar için uygundur.
-- Ancak, büyük veri setleri için performans sorunlarına yol açabilir.
