use [tablo iliþkilendirme]
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

 create table doktorlar(
 poliklinikID int,
 doktorID int identity(4001,1) primary key,
 doktorAdiSoyadi varchar(255));

 insert into doktorlar values
('1','Arda Ekin'),
('1','Elif Yýlmaz'),
('2','Sevinç Ak'),
('2','Kayýhan Akarcalý'),
('3','Cihan Akpýnar'),
('3','Emir Kor'),
('4','Mehmet Akay'),
('4','Osman Çelik'),
('5','Mert Yýlmaz'),
('5','Eda Ýçli'),
('6','Irmak Kaþlý'),
('6','Pýnar Yaðmur'),
('7','Emre Çalýþkan'),
('7','Özge Özkanlý'),
('8','Þule Temel'),
('8','Batuhan Ak'),
('9','Ceren Yýldýz'),
('9','Çaðla Eroðlu'),
('10','Berkan Bolatoðlu'),
('10','Burak Bursalý'),
('11','Deniz Kara'),
('11','Deniz Öztürk'),
('12','Devrim Yýlhan'),
('12','Ömer Akýn'),
('13','Fatih Derviþ'),
('13','Cansu Canan'),
('14','Derin Devrim'),
('14','Yusuf Gün'),
('15','Korkut Eliaçýk'),
('15','Ýhsan Ay')