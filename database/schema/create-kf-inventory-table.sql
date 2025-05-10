-- Membuat tabel inventaris Kimia Farma
CREATE TABLE kf_inventory (
    inventory_id SERIAL PRIMARY KEY, -- ID unik untuk setiap inventaris
    branch_id VARCHAR(10) NOT NULL,  -- Kode cabang
    product_id VARCHAR(20) NOT NULL,  -- Kode produk
    product_name VARCHAR(100) NOT NULL, -- Nama produk
    opname_stock INTEGER NOT NULL     -- Stok opname
);