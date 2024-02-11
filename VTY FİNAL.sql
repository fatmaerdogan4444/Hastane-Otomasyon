create database hastane4
use hastane4

create table alýnanRandevular(
randevuID int identity(10,1)primary key,
TC varchar(255),
poliklinikAdi varchar(255),
DoktorAdi varchar(255),
Tarih varchar(255),
Saat varchar(255))
----------------------------------------------------------
create table poliklinikler(
poliklinikID int identity(1,1) primary key not null,
poliklinikAdi varchar(255)default null);

insert into poliklinikler(poliklinikAdi) values 
 ('Çocuk Saðlýðý Ve Hastalýklarý'),
 ('Deri Ve Zührevi Hastalýklarý (Cildiye)'),
 ('Enfeksiyon Hastalýklarý'),
 ('Onkoloji'),
 ('Fizik Tedavi Ve Rehabilitasyon'),
 ('Genel Cerrahi'),
 ('Ýç Hastalýklarý (Dahiliye)'),
 ('Kadýn Hastalýklarý ve Doðum'),
 ('Kalp ve Damar Cerrahisi'),
 ('Kardiyoloji'),
 ('Kulak Burun Boðaz Hastalýklarý'),
 ('Nöroloji'),
 ('Ortopedi Ve Travmatoloji'),
 ('Ruh Saðlýðý Ve Hastalýklarý (Psikiyatri)'),
 ('Üroloji')
 -----------------------------------------------------
create table doktorlar(
doktorID int identity(4001,1) primary key not null,
Sifre varchar(255) default null,
doktorAdiSoyadi varchar(255) default null,
poliklinikAdi varchar (255)default null)

insert into doktorlar values
('1235','Arda Ekin','Çocuk Saðlýðý ve Hastalýklarý'),
('1236','Elif Yýlmaz','Çocuk Saðlýðý ve Hastalýklarý'),
('1237','Sevinç Ak','Deri ve Zührevi Hastalýklarý (Cildiye)'),
('1238','Kayýhan Akarcalý','Deri ve Zührevi Hastalýklarý (Cildiye)'),
('1239','Cihan Akpýnar','Enfeksiyon Hastalýklarý'),
('1240','Emir Kor','Enfeksiyon Hastalýklarý'),
('1241','Mehmet Akay','Onkoloji'),
('1242','Osman Çelik','Onkoloji'),
('1243','Mert Yýlmaz','Fizik Tedavi ve Rehabilitasyon'),
('1244','Eda Ýçli','Fizik Tedavi ve Rehabilitasyon'),
('1245','Irmak Kaþlý','Genel Cerrahi'),
('1246','Pýnar Yaðmur','Genel Cerrahi'),
('1247','Emre Çalýþkan','Ýç Hastalýklarý (Dahiliye)'),
('1248','Özge Özkanlý','Ýç Hastalýklarý (Dahiliye)'),
('1249','Þule Temel','Kadýn Hastalýklarý ve Doðum'),
('1250','Batuhan Ak','Kadýn Hastalýklarý ve Doðum'),
('1251','Ceren Yýldýz','Kalp ve Damar Cerrahisi'),
('1252','Çaðla Eroðlu','Kalp ve Damar Cerrahisi'),
('1253','Berkan Bolatoðlu','Kardiyoloji'),
('1254','Burak Bursalý','Kardiyoloji'),
('1255','Deniz Kara','Kulak Burun Boðaz Hastalýklarý'),
('1256','Deniz Öztürk','Kulak Burun Boðaz Hastalýklarý'),
('1257','Devrim Yýlhan','Nöroloji'),
('1258','Ömer Akýn','Nöroloji'),
('1259','Fatih Derviþ','Ortopedi ve Travmatoloji'),
('1260','Cansu Canan','Ortopedi ve Travmatoloji'),
('1261','Derin Devrim','Ruh Saðlýðý ve Hastalýklarý (Psikiyatri)'),
('1262','Yusuf Gün','Ruh Saðlýðý ve Hastalýklarý (Psikiyatri)'),
('1263','Korkut Eliaçýk','Üroloji'),
('1264','Ýhsan Ay','Üroloji')
----------------------------------------
create table hastalar(
TC varchar(255) primary key not null,
adi varchar(255) default null,
soyadi varchar(255) default null,
DogumTarihi varchar(255) default null,
DogumYeri varchar(255) default null,
anneAdi varchar(255) default null,
babaAdi varchar(255) default null,
CepTel varchar(255) default null,
Cinsiyeti varchar(255) default null,
Parola varchar(255) default null
)
insert into hastalar values 
(12345678902,'Akýn','Akça','23.10.1998','Ýstanbul','Ayþe','Erman','05347861020','Erkek','1234'),
(12345678904,'Elif','Yýlmaz','05.11.1988','Ankara','Feriha','Faruk','05347861021','Kadýn','1235'),
(12345678906,'Aslý','Eliuzun','21.05.1979','Ýzmir','Ayþe','Ali','05347861022','Kadýn','1236'),
(12345678908,'Birsen','Birdir','10.10.1978','Bursa','Azra','Burak','05347861023','Kadýn','1237'),
(12345678910,'Utku','Alper','03.12.1998','Adýyaman','Ceylan','Deniz','05347861024','Erkek','1238'),
(12345678912,'Melih','Altun','11.01.1958','Adana','Esra','Furkan','05347861025','Erkek','1239'),
(12345678914,'Mustafa','Koçak','21.10.1990','Eskiþehir','Gamze','Halis','05347861026','Erkek','1240'),
(12345678916,'Ceyda','Tok','03.05.1969','Ýstanbul','Iþýk','Ýsmail','05347861027','Kadýn','1241')

--------------------------------------------------
create table Randevular(
RandevuID int primary key identity(1,1),
TC varchar(255),
poliklinikID int,
doktorID int,
tarih varchar(255),
saat varchar(255)
constraint TC foreign key(TC) references hastalar(TC),
constraint doktorID foreign key(doktorID) references doktorlar(doktorID),
constraint poliklinikID foreign key(poliklinikID) references poliklinikler(poliklinikID)
)
------------------------------------
create table Personeller(
personelID int primary key identity(4000,4),
parola varchar(255)
);

insert into Personeller (parola) values ('1234')

------------FUNCTION-------------------
create function DoktorRandevulari(@doktorID VARCHAR(255))
returns table
as
return
	select r.*
	from alýnanRandevular as r
	join doktorlar as d on r.DoktorAdi = d.doktorAdiSoyadi
	where d.doktorID = @doktorID;


-------------------------------
SELECT
    d.doktorID,
    d.doktorAdiSoyadi,
    d.poliklinikAdi,
    p.poliklinikID
FROM
    doktorlar d
INNER JOIN
    poliklinikler p ON d.poliklinikAdi = p.poliklinikAdi;

select * from poliklinikler