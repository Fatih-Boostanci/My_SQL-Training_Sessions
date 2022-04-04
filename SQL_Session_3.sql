
/*===================================================
LIKE
====================================================*/
/* tracks tablosunda Composer sutunu Bach ile biten kayıtların Name bilgilerini 
listeyen sorguyu yazınız*/

SELECT name, Composer
 
 FROM tracks
 
 WHERE Composer like "%Bach";
 
 
/* invoices tablosunda, 2010 ve 2019 arası bir tarihte (InvoiceDate) Sadece şubat
aylarında gerçekleşmiş olan faturaların	tüm bilgilerini listeleyen sorguyu yazınız*/
	

SELECT *
 
FROM invoices
 
WHERE InvoiceDate like "201_-02-%";



/* albums tablosunda Title (başlık) sutununda Greatest içeren kayıtların tüm bilgilerini 
listeyen sorguyu yazınız*/


SELECT *
 
FROM albums
 
WHERE Title like "%Greatest%";


/* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
LastName ve City bilgilerini	listeleyen sorguyu yazınız*/

SELECT FirstName, LastName, City
 
FROM customers
 
WHERE InvoiceDate like "___";


/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
LastName ve City bilgilerini listeleyen sorguyu yazınız*/

SELECT FirstName, LastName, City
 
FROM customers
 
WHERE LastName  like "Sch%" OR   LastName like "Go%";


/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
-- COUNT
------------------------------------------------------------------------------
/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */
 
SELECT count(*) /* null lar dahil hepsini sayar */
 
FROM invoices;
 
/* Another Way */
  
SELECT count(BillingState)  /* null ları saymaz */
 
FROM invoices;


/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/

SELECT COUNT (DISTINCT Composer) as number_of_composers

FROM tracks;

/* null ları saymak için */

SELECT count(*)  as num_null
 
FROM invoices;

WHERE BillingState is NULL;


-- MIN,MAX
-------------------------------------------------------------------------------------------------	
/* tracks tablosundaki şarkı süresi en kısa olan şarkının adını ve süresi listeleyen
sorguyu yaziniz */


	
SELECT name  MIN(Milliseconds)  as min_song
 
FROM tracks;

/*students tablosundaki en düşük ve en yüksek notu listeleyen sorguyu yazınız */

SELECT name  min(Grade) as min_grade, max(Grade)  as maz_grade
 
FROM students;


-- SUM,AVG
-------------------------------------------------------------------------------------------------	
/* invoices  tablosundaki faturaların toplam değerini listeyiniz */

SELECT sum(total)  as total_amount
 
FROM invoices;

/* with ROUND */

SELECT round(sum(total))  as total_amount
 
FROM invoices;



/* invoices  tablosundaki faturaların ortalama değerini listeyiniz */


SELECT avg(total)  as avg_invoices
 
FROM invoices;

/* with ROUND */

SELECT round(avg(total), 3)  as avg_invoices
 
FROM invoices;

/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
şarkıların adlarını listeleyiniz */

SELECT name, Milliseconds
 
FROM tracks;

WHERE Milliseconds > 393599;


/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/

/* with SUB-QUERY */


SELECT name, Milliseconds
 
FROM tracks;

WHERE Milliseconds > (SELECT avg(Milliseconds)  FROM tracks);

/*===================================================
 GROUP BY
====================================================*/

/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */

SELECT Composer, count(name)

FROM tracks

WHERE Composer  IS NOTNULL

GROUP BY Composer;


/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/

SELECT BillingCountry, round(avg(total), 2) as avg_amount

FROM invoices

GROUP BY BillingCountry;



SELECT BillingCountry, round(avg(total), 2) as avg_amount

FROM invoices

WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31"

GROUP BY BillingCountry;