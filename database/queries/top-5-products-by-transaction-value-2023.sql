-- Judul: Mengidentifikasi Top 5 Produk Berdasarkan Frekuensi dan Total Nilai Transaksi Tahun 2023

-- Deskripsi: Query ini bertujuan untuk menganalisis data transaksi produk dari tabel
--             `analysis_performance` untuk mengidentifikasi 5 produk teratas berdasarkan
--             jumlah transaksi di mana produk tersebut terjual dan total nilai transaksi (nett sales)
--             dari produk tersebut selama tahun 2023.

SELECT
    product_name,
    COUNT(transaction_id) AS jumlah_transaksi_2023, -- Menghitung total jumlah transaksi untuk setiap produk pada tahun 2023.
    ROUND(SUM(nett_sales), 2) AS total_nilai_transaksi_2023 -- Menghitung total nilai transaksi (nett sales) untuk setiap produk pada tahun 2023, dibulatkan hingga 2 desimal.
FROM
    analysis_performance
WHERE
    EXTRACT(YEAR FROM date) = 2023 -- Memfilter data transaksi hanya untuk tahun 2023.
GROUP BY
    product_name -- Mengelompokkan hasil berdasarkan nama produk untuk melakukan perhitungan agregasi.
ORDER BY
    jumlah_transaksi_2023 DESC, -- Mengurutkan hasil berdasarkan jumlah transaksi secara menurun (produk dengan transaksi terbanyak di atas).
    total_nilai_transaksi_2023 DESC -- Sebagai kriteria sekunder, mengurutkan berdasarkan total nilai transaksi secara menurun.
LIMIT 5; -- Membatasi hasil hanya menampilkan 5 produk teratas.