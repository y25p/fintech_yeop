Create database world;
Use world;

Create table countrytable (
	Code CHAR(3) not null,
	Code2 CHAR(3) not null,
	Name VARCHAR(40) not null,
	Continent VARCHAR(50) not null,
	SurfaceArea INT default null,
	Population INT default null,
	LifeExpectancy FLOAT default null,
	GNP FLOAT default null,
	PRIMARY KEY (Code)
);

INSERT INTO countrytable 
(Code, Code2, Name, Continent, SurfaceArea, Population, LifeExpectancy, GNP)
VALUES
("CHN", "CHN", "중국", "Asia", 9572900, 1277558000, 71.4, 982268),
("DEU", "EU", '독일', 'Europe', 357022, 82164700, 77.4, 2133367),
('GBR', 'GBR', '영국', 'Europe', 242900, 59623400, 77.7, 1378330),
('JPN','JPN', '일본', 'Asia', 377829, 1267144, 80.7, 3787042),
('USA', 'USA', '미국', 'North America', 9363520, 278357000, 77.1, 8510700);

Select* From countrytable;
commit;
