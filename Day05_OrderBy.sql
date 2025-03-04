USE team_153;

/* ===============================================
		       ORDER BY
   ===============================================*/
   
-- ORDER BY, LIMIT VE OFFSET gibi filtreleme ifadeleri
-- database uzerinde degil bize donen sonuc uzerinde
-- filtreleme yapar. Database de bir degisiklik yapmaz.
/*

   ORDER BY ifadesi, SQL sorgularında sonuçları belirli bir
   veya birden fazla sütuna göre sıralamak için kullanılır.
   Bu ifade, sıralama işleminin yükselen (ascending) veya
   azalan (descending) düzeninde yapılmasını sağlar.
   ASC anahtar kelimesi yükselen sıralamayı (dogal),
   DESC anahtar kelimesi ise azalan sıralamayı(ters) belirtir.
*/

/*
*************** SYNTAX ***************
SELECT sütun_adları
FROM tablo_adı
ORDER BY sıralanacak_sütun ASC|DESC;
*/

CREATE TABLE kitaplik (
    id INT PRIMARY KEY,
    kitap_adi VARCHAR(100),
    yazar VARCHAR(50),
    yayin_yili INT
);

INSERT INTO kitaplik (id, kitap_adi, yazar, yayin_yili) VALUES
(1, 'Sefiller', 'Victor Hugo', 1862),
(2, '1984', 'George Orwell', 1949),
(3, 'Suç ve Ceza', 'Fyodor Dostoyevski', 1866),
(4, 'Kürk Mantolu Madonna', 'Sabahattin Ali', 1943),
(5, 'Yabancı', 'Albert Camus', 1942),
(6, 'Ulysses', 'James Joyce', 1922),
(7, 'Yüzüklerin Efendisi', 'J.R.R. Tolkien', 1954),
(8, 'Harry Potter ve Felsefe Taşı', 'J.K. Rowling', 1998),
(9, 'Da Vinci Şifresi', 'Dan Brown', 2003),
(10, 'Zamanın Kısa Tarihi', 'Stephen Hawking', 1998),
(11, 'Karamazov Kardeşler', 'Fyodor Dostoyevski', 1880),
(12, 'Budala', 'Fyodor Dostoyevski', 1869),
(13, 'Savaş ve Barış', 'Lev Tolstoy', 1866),
(14, 'Anna Karenina', 'Lev Tolstoy', 1877),
(15, 'Hobbit', 'J.R.R. Tolkien', 1942);

SELECT * FROM kitaplik;

*  ============================= SORU-4 =============================
    Kitaplik tablosundaki kitapları yayın yılına göre eski olanlardan
    yeni olanlara doğru sıralayiniz.
    ===================================================================
*/

SELECT kitap_adi, yayin_yili
FROM kitaplik
ORDER BY yayin_yili ASC;

/*  ============================= SORU-5 =============================
    Kitaplik tablosundaki kitapların yayın yılına göre yeni olanlardan
    eski olanlara doğru sıralayiniz.
    ===================================================================
*/

SELECT kitap_adi, yayin_yili
FROM kitaplik
ORDER BY yayin_yili DESC;

/*  ============================= SORU-6 =============================
    Kitaplik tablosundaki "Fyodor Dostoyevski"nin kitaplarını yayın
    yılına göre eskiden gunumuze sırayiniz.
    ===================================================================
*/

SELECT kitap_adi, yayin_yili
FROM kitaplik
WHERE yazar = 'Fyodor Dostoyevski'
ORDER BY yayin_yili ASC;

/*  ============================= SORU-7 =============================
    Kitaplik tablosundaki yazarlarin isimlerini ters siralayiniz
    ===================================================================
*/

SELECT DISTINCT yazar
FROM kitaplik
ORDER BY yazar DESC;

/*  ============================= SORU-8 =============================
    Kitaplik tablosundaki "Lev Tolstoy" un kitaplarını isimlerine
    göre dogal sıralayiniz.
    ===================================================================
*/

SELECT kitap_adi
FROM kitaplik
WHERE yazar  ='Lev Tolstoy'
ORDER BY kitap_adi;


/*  ============================= SORU-9 =============================
    Kitaplik tablosundaki yazar isimlerini ve kitaplarini
    dogal sırayiniz.
    ===================================================================
*/

SELECT yazar , kitap_adi
FROM kitaplik
ORDER BY yazar ASC, kitap_adi ASC;

/*  ============================= SORU-10 =============================
    Kitaplik tablosundaki yayin yili ve yazar isimlerini ve kitaplarini
    dogal sırayiniz.
    ===================================================================
*/

SELECT yayin_yili, kitap_adi, yazar
FROM kitaplik
ORDER BY yayin_yili, yazar, kitap_adi;


















