-- Membuat tabel produk Kimia Farma
CREATE TABLE kf_product (
    product_id VARCHAR(20) PRIMARY KEY, -- ID unik untuk setiap produk
    product_name VARCHAR(100) NOT NULL, -- Nama produk (tidak boleh kosong)
    product_category VARCHAR(50),      -- Kategori produk (e.g., Obat Bebas, Obat Resep)
    price NUMERIC(10, 2)               -- Harga jual produk (dengan 2 desimal)
);