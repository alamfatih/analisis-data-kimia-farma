-- Membuat struktur tabel transaksi final Kimia Farma
CREATE TABLE kf_final_transaction (
    transaction_id VARCHAR(50) PRIMARY KEY, -- ID unik untuk setiap transaksi
    date DATE NOT NULL,                    -- Tanggal terjadinya transaksi
    branch_id VARCHAR(10),                 -- Kode identifikasi cabang
    customer_name VARCHAR(100),             -- Nama pelanggan yang bertransaksi
    product_id VARCHAR(20),                -- Kode identifikasi produk
    price NUMERIC(10, 2),                  -- Harga produk (dengan 2 desimal)
    discount_percentage NUMERIC(5, 2),      -- Persentase diskon (jika ada, dengan 2 desimal)
    rating INTEGER                        -- Rating transaksi (misalnya, dari 1 hingga 5)
);