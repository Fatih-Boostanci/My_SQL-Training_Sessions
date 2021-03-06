/*===================================================
 JOINS
====================================================*/
    
-- Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
-- olusturmak icin kullanilabilir.
--     
-- JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
-- Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
-- icin JOIN islemleri kullanilabilir.

-- Standart SQL'de en çok kullanılan Join islemleri:
-- 1) FULL JOIN:  Tablodaki tum sonuclari gosterir
-- 2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
-- 3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
-- 4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--	NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
/*===================================================*/ 

/*Attach Database---> yeni bir database aynı anda kullanma için*/ 



/* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
bilgilerini  listeleyen bir sorgu yaziniz.*/
 

SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi

FROM markalar as m

INNER JOIN siparisler as s 

ON m.marka_id = s.marka_id;


/*LEFT JOIN Method*/ 

SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi

FROM markalar as m

LEFT JOIN siparisler as s 

ON m.marka_id = s.marka_id;

/* Markalar ve Siparisler tablolarındaki tüm araç markalarının siparis bilgilerini
(marka_id,marka_adi,siparis_adedi,siparis_tarihi) listeleyen bir sorgu yaziniz.*/


SELECT m.marka_id, m.marka_adi, s.siparis_adedi, s.siparis_tarihi

FROM markalar as m

LEFT JOIN siparisler as s 

ON m.marka_id = s.marka_id;


/* Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının
türünü (genre) listeleyiniz.*/

SELECT t.name, g.name

FROM tracks t

JOIN genres g

ON t.GenreId = g.GenreId;


/* invoice tablosundaki faturaların her birinin 
müşteri adını (FirstName),soyadını (lastName), 
fatura tarihini (InvoiceDate) ve fatura meblağını (total) listeleyen sorguyu yazınız */

SELECT c.FirstName, c.LastName, i.InvoiceDate, i.total

FROM invoices i

JOIN customers c

ON i.CustomerId = c.CustomerId;

/* with GROUP BY */

SELECT c.FirstName, c.LastName, sum(i.total) as total_amount

FROM invoices i

JOIN customers c

ON i.CustomerId = c.CustomerId

GROUP BY c.FirstName;


 /* invoice tablosundaki faturaların her birinin müşteri adını 
(FirstName),soyadını(lastName) ve fatura meblağlarının 
toplamının(total) 40 dolardan fazla olanlarını artan sırada
listeleyen sorguyu yazınız */

SELECT c.FirstName, c.LastName, sum(i.total) 

FROM invoices i

JOIN customers c

ON i.CustomerId = c.CustomerId

GROUP BY c.FirstName

HAVING sum(i.total) > 40

ORDER  BY sum(i.total) DESC;


/* w/ HAVING (aggregiate function lı bölüm  where içinde kul zaman "HAVING"
kul. Yeri GROUP BY'dan sonradır.  */

SELECT c.FirstName, c.LastName, sum(i.total) as total_amount

FROM invoices i

JOIN customers c

ON i.CustomerId = c.CustomerId

GROUP BY c.FirstName

HAVING total_amount > 40

ORDER  BY total_amount DESC;

/* As a alternative GROUP BY  i.CustomerId */

SELECT c.FirstName, c.LastName, sum(i.total) as total_amount

FROM invoices i

JOIN customers c

ON i.CustomerId = c.CustomerId

GROUP BY i.CustomerId

HAVING total_amount > 40

ORDER  BY total_amount DESC;
