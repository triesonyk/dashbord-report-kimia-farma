-- Create table penjualan, specify column's name and its' data type, add constraint (Primary Key)

CREATE TABLE
	penjualan(
		id_distributor VARCHAR,
		id_cabang VARCHAR,
		id_invoice VARCHAR,
		tanggal DATE,
		id_customer VARCHAR,
		id_barang VARCHAR,
		jumlah_barang INT,
		unit VARCHAR,
		harga NUMERIC,
		mata_uang VARCHAR,
		brand_id VARCHAR,
		lini VARCHAR,
		PRIMARY KEY(id_invoice)
	);

-- import data from local drive

COPY 
	penjualan(
		id_distributor,
		id_cabang,
		id_invoice,
		tanggal,
		id_customer,
		id_barang,
		jumlah_barang,
		unit,
		harga,
		mata_uang,
		brand_id,
		lini
	)
FROM 'D:\10._DATA_SCIENCE\Rakamin\JGP\VIX\Task5\penjualan.csv'
DELIMITER ','
CSV HEADER;

-- Create table pelanggan, specify column's name and its' data type, add constraint (Primary Key)

CREATE TABLE
	pelanggan(
		id_customer VARCHAR,
		level_ VARCHAR,
		nama VARCHAR,
		id_cabang_sales VARCHAR,
		cabang_sales VARCHAR,
		id_group VARCHAR,
		group_ VARCHAR,
		PRIMARY KEY(id_customer)
	);
	
-- import data from local drive
	
COPY
	pelanggan(
		id_customer,
		level_,
		nama,
		id_cabang_sales,
		cabang_sales,
		id_group,
		group_
	)
FROM 'D:\10._DATA_SCIENCE\Rakamin\JGP\VIX\Task5\pelanggan.csv'
DELIMITER ','
CSV HEADER;

-- Create table barang, specify column's name and its' data type, add constraint (Primary Key)

CREATE TABLE
	barang(
		kode_barang VARCHAR,
		sektor VARCHAR,
		nama_barang VARCHAR,
		tipe VARCHAR,
		nama_tipe VARCHAR,
		kode_lini INT,
		lini VARCHAR,
		kemasan VARCHAR,
		PRIMARY KEY(kode_barang)
	);
	
-- import data from local drive
	
COPY
	barang(
		kode_barang,
		sektor,
		nama_barang,
		tipe,
		nama_tipe,
		kode_lini,
		lini,
		kemasan
	)
FROM 'D:\10._DATA_SCIENCE\Rakamin\JGP\VIX\Task5\barang.csv'
DELIMITER ','
CSV HEADER;

-- Add Foreign Key Constraint

ALTER TABLE penjualan
ADD FOREIGN KEY (id_barang) REFERENCES barang(kode_barang),
ADD FOREIGN KEY (id_customer) REFERENCES pelanggan(id_customer);
