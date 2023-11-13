
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Fatma Altay>
-- Create date: <Create Date,,2013-04-01>
-- Description:	<Doktor tablosundaki bilgileri yedeklemek ve �zerinde i�lemler yapmak i�in kullan�l�r>
-- =============================================
CREATE TRIGGER trgDoktorYedegiAl
   ON  dbo.Doktorlar
   FOR INSERT
   
AS 
BEGIN
       -- ��lemdede kullanacak t�m deg�i�kenleri tan�mlad�k
       DECLARE @ID int
	   DECLARE @Ad nvarchar(50)
	   DECLARE @Soyad nvarchar(50)
	   DECLARE @DrKodu char(6)
	   DECLARE @KurumID int
	   --Bu de�i�kenlere ekleme i�lemi ger�ekle�tirirken 
	   --eklemenin ger�ekle�ti�i kayd�n de�erleri aktar�l�yor 
	   SELECT
	    @ID=ID
	   ,@Ad=Ad
	   ,@Soyad=Soyad
	   ,@DrKodu=DrKodu
	   ,@KurumID=KurumID 
	   from inserted
	   --De�i�kenlere aktar�lan de�erler yeni tabloya ekleniyor
	   insert into tblDoktorlarYedek
	   values (@Ad,@Soyad,@DrKodu,@KurumID)
	   	
END

--DELETE Doktorlar WHERE ID=12


GO
