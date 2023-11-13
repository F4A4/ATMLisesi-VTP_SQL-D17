
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Fatma Altay>
-- Create date: <Create Date,,2013-04-01>
-- Description:	<Doktor tablosundaki bilgileri yedeklemek ve üzerinde iþlemler yapmak için kullanýlýr>
-- =============================================
CREATE TRIGGER trgDoktorYedegiAl
   ON  dbo.Doktorlar
   FOR INSERT
   
AS 
BEGIN
       -- Ýþlemdede kullanacak tüm degðiþkenleri tanýmladýk
       DECLARE @ID int
	   DECLARE @Ad nvarchar(50)
	   DECLARE @Soyad nvarchar(50)
	   DECLARE @DrKodu char(6)
	   DECLARE @KurumID int
	   --Bu deðiþkenlere ekleme iþlemi gerçekleþtirirken 
	   --eklemenin gerçekleþtiði kaydýn deðerleri aktarýlýyor 
	   SELECT
	    @ID=ID
	   ,@Ad=Ad
	   ,@Soyad=Soyad
	   ,@DrKodu=DrKodu
	   ,@KurumID=KurumID 
	   from inserted
	   --Deðiþkenlere aktarýlan deðerler yeni tabloya ekleniyor
	   insert into tblDoktorlarYedek
	   values (@Ad,@Soyad,@DrKodu,@KurumID)
	   	
END

--DELETE Doktorlar WHERE ID=12


GO
