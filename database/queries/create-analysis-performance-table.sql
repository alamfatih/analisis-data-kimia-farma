-- Judul: Membuat Tabel Analisis Kinerja (analysis_performance)

-- Deskripsi: Skrip ini membuat tabel baru bernama `analysis_performance` yang menggabungkan
--             data dari tabel `kf_final_transaction`, `kf_kantor_cabang`, dan `kf_product`
--             untuk memudahkan analisis kinerja penjualan dan profitabilitas.
--             Tabel ini juga menghitung kolom-kolom turunan seperti persentase gross laba,
--             nett sales, dan nett profit berdasarkan harga produk dan persentase diskon.

CREATE TABLE analysis_performance AS
SELECT
    ft.transaction_id,               -- ID unik dari transaksi (diambil dari tabel kf_final_transaction)
    ft."date",                        -- Tanggal transaksi (diambil dari tabel kf_final_transaction)
    ft.branch_id,                     -- ID cabang tempat transaksi terjadi (diambil dari tabel kf_final_transaction)
    kc.branch_name,                   -- Nama cabang (diambil dari tabel kf_kantor_cabang)
    kc.kota,                          -- Kota tempat cabang berada (diambil dari tabel kf_kantor_cabang)
    kc.provinsi,                      -- Provinsi tempat cabang berada (diambil dari tabel kf_kantor_cabang)
    kc.rating AS rating_cabang,       -- Rating cabang (diambil dari tabel kf_kantor_cabang) dan diubah namanya
    ft.customer_name,                 -- Nama pelanggan (diambil dari tabel kf_final_transaction)
    ft.product_id,                    -- ID produk yang dibeli (diambil dari tabel kf_final_transaction)
    p.product_name,                   -- Nama produk (diambil dari tabel kf_product)
    p.price AS actual_price,          -- Harga asli produk (diambil dari tabel kf_product) dan diubah namanya
    ft.discount_percentage,           -- Persentase diskon pada transaksi (diambil dari tabel kf_final_transaction)
    CASE                             -- Menghitung persentase gross laba berdasarkan harga produk
        WHEN p.price <= 50000 THEN p.price * 0.1
        WHEN p.price <= 100000 THEN p.price * 0.15
        WHEN p.price <= 300000 THEN p.price * 0.20
        WHEN p.price <= 500000 THEN p.price * 0.25
        ELSE p.price * 0.30
    END AS persentase_gross_laba,    -- Hasil perhitungan persentase gross laba
    (p.price * (1 - ft.discount_percentage / 100)) AS nett_sales, -- Menghitung nilai penjualan bersih setelah diskon
    (p.price * (1 - ft.discount_percentage / 100)) * (CASE -- Menghitung nilai profit bersih berdasarkan nett sales dan margin laba
        WHEN p.price <= 50000 THEN 0.10
        WHEN p.price <= 100000 THEN 0.15
        WHEN p.price <= 300000 THEN 0.20
        WHEN p.price <= 500000 THEN 0.25
        ELSE 0.30
    END) AS nett_profit,              -- Hasil perhitungan nilai profit bersih
    ft.rating AS rating_transaksi     -- Rating untuk transaksi (diambil dari tabel kf_final_transaction) dan diubah namanya
FROM
    kf_final_transaction ft           -- Alias untuk tabel kf_final_transaction
INNER JOIN                         -- Menggabungkan baris dari ft dengan baris yang cocok dari kc berdasarkan branch_id
    kf_kantor_cabang kc ON ft.branch_id = kc.branch_id
INNER JOIN                         -- Menggabungkan baris dari hasil join sebelumnya dengan baris yang cocok dari p berdasarkan product_id
    kf_product p ON ft.product_id = p.product_id;