use [tablo ili�kilendirme]
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

 create table doktorlar(
 poliklinikID int,
 doktorID int identity(4001,1) primary key,
 doktorAdiSoyadi varchar(255));

 insert into doktorlar values
('1','Arda Ekin'),
('1','Elif Y�lmaz'),
('2','Sevin� Ak'),
('2','Kay�han Akarcal�'),
('3','Cihan Akp�nar'),
('3','Emir Kor'),
('4','Mehmet Akay'),
('4','Osman �elik'),
('5','Mert Y�lmaz'),
('5','Eda ��li'),
('6','Irmak Ka�l�'),
('6','P�nar Ya�mur'),
('7','Emre �al��kan'),
('7','�zge �zkanl�'),
('8','�ule Temel'),
('8','Batuhan Ak'),
('9','Ceren Y�ld�z'),
('9','�a�la Ero�lu'),
('10','Berkan Bolato�lu'),
('10','Burak Bursal�'),
('11','Deniz Kara'),
('11','Deniz �zt�rk'),
('12','Devrim Y�lhan'),
('12','�mer Ak�n'),
('13','Fatih Dervi�'),
('13','Cansu Canan'),
('14','Derin Devrim'),
('14','Yusuf G�n'),
('15','Korkut Elia��k'),
('15','�hsan Ay')