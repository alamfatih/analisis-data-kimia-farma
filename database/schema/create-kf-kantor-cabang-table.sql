-- Membuat tabel kantor cabang Kimia Farma
CREATE TABLE kf_kantor_cabang (
    branch_id VARCHAR(10) PRIMARY KEY, -- ID unik untuk setiap kantor cabang
    branch_category VARCHAR(50),      -- Kategori kantor cabang (e.g., Apotek, Klinik)
    branch_name VARCHAR(100) NOT NULL, -- Nama resmi kantor cabang (tidak boleh kosong)
    kota VARCHAR(50),                 -- Nama kota tempat kantor cabang berada
    provinsi VARCHAR(50),             -- Nama provinsi tempat kantor cabang berada
    rating NUMERIC(3, 2)              -- Rating kantor cabang (misalnya, skala 1.00 - 5.00)
);