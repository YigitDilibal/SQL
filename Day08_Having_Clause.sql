USE team_153;

/*======================== HAVING CLAUSE =======================
HAVING, AGGREGATE FUNCTION'lar ile birlikte kullanilan
FILTRELEME komutudur.
Aggregate fonksiyonlar ile ilgili bir kosul koymak
icin GROUP BY'dan sonra HAVING cumlecigi kullanilir.
Yeni create ettigimiz (order by veya Aggregate functions)bir sutun uzerinden
filtreleme yapmak istiyorsak WHERE cumlecigini kullanamayiz.
WHERE cumlecigi sadece  database de var olan fieldlar uzerinde
bir filtreleme yapar.
===============================================================*/

CREATE TABLE isciler
(
	id int,
	isim varchar(50),
    sehir varchar(20),
    maas int,
	sirket varchar(20)
);

INSERT INTO isciler VALUES
(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'),
(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'),
(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'),
(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'),
(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'),
(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'),
(123456710, 'Hatıce Sahin', 'Bursa', 4500, 'Honda');

# Sirketlere gore toplam isci sayisini listeleyiniz.

SELECT sirket, COUNT(id) isci_sayisi
FROM isciler
GROUP BY sirket;

# isci sayisi 1'den buyuk olan sirketleri listeleyiniz.

SELECT sirket, COUNT(id) isci_sayisi
FROM isciler
GROUP BY sirket
HAVING isci_sayisi > 1 ;

-- Toplam geliri 8000 liradan fazla olan isimleri gosteren sorgu yaziniz
-- isimleri gruplandirarak soruyu cozumleyiniz.

SELECT isim, SUM(maas) toplam_maas
FROM isciler
GROUP BY isim
HAVING toplam_maas > 8000 ;

-- Eger bir sehirde alinan MAX maas 5000'den dusukse sehir ismini
-- ve MAX maasi veren sorgu yaziniz

SELECT sehir, MAX(maas) sehirdeki_maas
FROM isciler
GROUP BY sehir
HAVING sehirdeki_maas <5000;

-- Eger bir sehirde alinan MAX maas 3500'den buyukse
-- sehir ismi 'i' harfi ile basliyorsa o sehirleri ve
-- ve MAX maasi, maas ters sirali veren sorgu yaziniz


SELECT sehir, MAX(maas) sehirdeki_maas
FROM isciler
GROUP BY sehir
HAVING sehirdeki_maas > 3500
AND sehir LIKE 'i%'
ORDER BY sehirdeki_maas DESC;

SELECT sehir, MAX(maas) sehirdeki_maas
FROM isciler
WHERE sehir LIKE 'i%'
GROUP BY sehir
HAVING sehirdeki_maas > 3500
ORDER BY sehirdeki_maas DESC;















