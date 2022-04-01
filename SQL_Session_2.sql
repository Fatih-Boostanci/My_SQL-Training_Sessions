 select DISTINCT Composer from tracks;
 
 SELECT * FROM tracks;
 
 SELECT DISTINCT AlbumId, MediaTypeId FROM tracks;
 
 SELECT  AlbumId, MediaTypeId FROM tracks;
 
 SELECT name 
 FROM tracks 
 WHERE Composer="Jimi Hendrix";
 
 SELECT name, Milliseconds 
 FROM tracks 
 WHERE Composer="Jimi Hendrix";
 
 /* invoices tablosunda Total değeri 10$ dan büyük olan faturaların tüm bilgilerini 
sorgulayiniz */
 
 SELECT * 
 
 FROM invoices

 WHERE total > 10 ;
 
  

 
 /*===================================================
LIMIT
====================================================*/
/*invoices tablosunda Total değeri 10$'dan büyük olan 
ilk 4 kayıt'ın InvoiceId,InvoiceDate ve total 
bilgilerini sorgulayiniz */
 
 SELECT InvoiceId, InvoiceDate, total
 
 FROM invoices
 
 WHERE total > 10 
 
 LIMIT 4;
 
 /*invoices tablosunda Total değeri 10$'dan büyük olan kayıtlardan işlem tarihi 
(InvoiceDate) en yeni olan 10 kaydın tüm bilgilerini listeyiniz */ 
  
 SELECT *
 
 FROM invoices
 
 WHERE total > 10 
 
 ORDER BY InvoiceDate DESC 
 
 LIMIT 10;
 
 /*invoices tablosundan CustomerId, InvoiceDate,BillingCity
, total değerlerini sorgulayınız. 
(BillingCity - Aşağıdan Yukarı, total - Yukarıdan Aşağıya sıralayarak */
 
 SELECT CustomerId, InvoiceDate, BillingCity, total
 
 FROM invoices
 
 
 ORDER BY BillingCity , total DESC;
 
/*===================================================
LOGICAL OPERATORS (AND,OR,NOT)
====================================================*/

/* invoices tablosunda ülkesi (BillingCountry) USA olmayan kayıtları total değerine
göre  AZALAN sırada listeyiniz */ 
 
SELECT * 
 
FROM invoices
 
WHERE NOT BillingCountry ="USA"
 
ORDER BY total DESC;

/* Another Solution */ 

SELECT * 
 
FROM invoices
 
WHERE BillingCountry <>"USA"
 
ORDER BY total DESC;

/* Another Solution */ 

SELECT * 
 
FROM invoices
 
WHERE BillingCountry !="USA"
 
ORDER BY total DESC;


/* invoices tablosunda, ülkesi (BillingCountry) USA veya Germany olan kayıtları, 
InvoiceId sırasına göre artan sırada listeyiniz */ 

SELECT *

FROM invoices

WHERE BillingCountry “USA” OR  “Germany”

ORDER BY InvoiceId ASC

/* Another Solution */ 

SELECT *

FROM invoices

WHERE BillingCountry IN (“USA”, “Germany”)

ORDER BY InvoiceId ASC

/* invoices tablosunda fatura tarihi (InvoiceDate) 01-01-2012 ile 02-01-2013 
tarihleri arasındaki faturaların tüm bilgilerini listeleyiniz */ 

SELECT *

FROM invoices

WHERE InvoiceDate  >= "2012-01-01" AND InvoiceDate <="2013-01-02";

/* Another Solution */ 

SELECT *

FROM invoices

WHERE InvoiceDate  BETWEEN "2012-01-01" AND   "2013-01-02";

/* invoices tablosunda fatura tarihi (InvoiceDate) 2009 ila 2011 tarihleri arasındaki
en yeni faturayı listeleyen sorguyu yazınız */

SELECT *

FROM invoices

WHERE InvoiceDate  BETWEEN "2009-01-01" AND   "2010-12-31";

ORDER BY InvoiceDate DESC

LIMIT 1;

/*===================================================
IN
====================================================*/
/* customers tablosunda Belgium, Norway veya  Canada ,USA  ülkelerinden sipariş veren
müşterilerin FirstName, LastName, country bilgilerini listeyiniz	*/

SELECT FirstName, LastName, country

FROM customers

WHERE country  IN ("Belgium", "Norway",  "Canada" , "USA");

