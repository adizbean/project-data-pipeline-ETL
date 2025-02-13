--membuat tabel staging untuk meyimpan seluruh data csv
CREATE TABLE staging
	(id SERIAL PRIMARY KEY,
	produk VARCHAR(200),
	brand VARCHAR (50),
	harga INTEGER,
	gambar VARCHAR(1000)
	);

COPY staging
	(id,
	produk,
	brand,
	harga,
	gambar
	)
FROM 'C:\Users\ASUS\Documents\coda_005\p0-coda005-rmt-m1-adizbean\data_bersih.csv'
DELIMITER ','
CSV HEADER;


--membuat tabel tas 	
CREATE TABLE tas
	(id SERIAL PRIMARY KEY,
	produk VARCHAR(200),
	brand VARCHAR (50),
	harga INTEGER,
	gambar VARCHAR (1000)
	);

--memasukan data barang dari staging ke dalam tabel tas
INSERT INTO tas
		(produk,
		brand,
		harga,
		gambar
		)
SELECT 
	produk,
	brand,
	harga,
	gambar
FROM staging;
