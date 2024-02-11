create database hastane4
use hastane4

create table al�nanRandevular(
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
 ('�ocuk Sa�l��� Ve Hastal�klar�'),
 ('Deri Ve Z�hrevi Hastal�klar� (Cildiye)'),
 ('Enfeksiyon Hastal�klar�'),
 ('Onkoloji'),
 ('Fizik Tedavi Ve Rehabilitasyon'),
 ('Genel Cerrahi'),
 ('�� Hastal�klar� (Dahiliye)'),
 ('Kad�n Hastal�klar� ve Do�um'),
 ('Kalp ve Damar Cerrahisi'),
 ('Kardiyoloji'),
 ('Kulak Burun Bo�az Hastal�klar�'),
 ('N�roloji'),
 ('Ortopedi Ve Travmatoloji'),
 ('Ruh Sa�l��� Ve Hastal�klar� (Psikiyatri)'),
 ('�roloji')
 -----------------------------------------------------
create table doktorlar(
doktorID int identity(4001,1) primary key not null,
Sifre varchar(255) default null,
doktorAdiSoyadi varchar(255) default null,
poliklinikAdi varchar (255)default null)

insert into doktorlar values
('1235','Arda Ekin','�ocuk Sa�l��� ve Hastal�klar�'),
('1236','Elif Y�lmaz','�ocuk Sa�l��� ve Hastal�klar�'),
('1237','Sevin� Ak','Deri ve Z�hrevi Hastal�klar� (Cildiye)'),
('1238','Kay�han Akarcal�','Deri ve Z�hrevi Hastal�klar� (Cildiye)'),
('1239','Cihan Akp�nar','Enfeksiyon Hastal�klar�'),
('1240','Emir Kor','Enfeksiyon Hastal�klar�'),
('1241','Mehmet Akay','Onkoloji'),
('1242','Osman �elik','Onkoloji'),
('1243','Mert Y�lmaz','Fizik Tedavi ve Rehabilitasyon'),
('1244','Eda ��li','Fizik Tedavi ve Rehabilitasyon'),
('1245','Irmak Ka�l�','Genel Cerrahi'),
('1246','P�nar Ya�mur','Genel Cerrahi'),
('1247','Emre �al��kan','�� Hastal�klar� (Dahiliye)'),
('1248','�zge �zkanl�','�� Hastal�klar� (Dahiliye)'),
('1249','�ule Temel','Kad�n Hastal�klar� ve Do�um'),
('1250','Batuhan Ak','Kad�n Hastal�klar� ve Do�um'),
('1251','Ceren Y�ld�z','Kalp ve Damar Cerrahisi'),
('1252','�a�la Ero�lu','Kalp ve Damar Cerrahisi'),
('1253','Berkan Bolato�lu','Kardiyoloji'),
('1254','Burak Bursal�','Kardiyoloji'),
('1255','Deniz Kara','Kulak Burun Bo�az Hastal�klar�'),
('1256','Deniz �zt�rk','Kulak Burun Bo�az Hastal�klar�'),
('1257','Devrim Y�lhan','N�roloji'),
('1258','�mer Ak�n','N�roloji'),
('1259','Fatih Dervi�','Ortopedi ve Travmatoloji'),
('1260','Cansu Canan','Ortopedi ve Travmatoloji'),
('1261','Derin Devrim','Ruh Sa�l��� ve Hastal�klar� (Psikiyatri)'),
('1262','Yusuf G�n','Ruh Sa�l��� ve Hastal�klar� (Psikiyatri)'),
('1263','Korkut Elia��k','�roloji'),
('1264','�hsan Ay','�roloji')
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
(12345678902,'Ak�n','Ak�a','23.10.1998','�stanbul','Ay�e','Erman','05347861020','Erkek','1234'),
(12345678904,'Elif','Y�lmaz','05.11.1988','Ankara','Feriha','Faruk','05347861021','Kad�n','1235'),
(12345678906,'Asl�','Eliuzun','21.05.1979','�zmir','Ay�e','Ali','05347861022','Kad�n','1236'),
(12345678908,'Birsen','Birdir','10.10.1978','Bursa','Azra','Burak','05347861023','Kad�n','1237'),
(12345678910,'Utku','Alper','03.12.1998','Ad�yaman','Ceylan','Deniz','05347861024','Erkek','1238'),
(12345678912,'Melih','Altun','11.01.1958','Adana','Esra','Furkan','05347861025','Erkek','1239'),
(12345678914,'Mustafa','Ko�ak','21.10.1990','Eski�ehir','Gamze','Halis','05347861026','Erkek','1240'),
(12345678916,'Ceyda','Tok','03.05.1969','�stanbul','I��k','�smail','05347861027','Kad�n','1241')

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
	from al�nanRandevular as r
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