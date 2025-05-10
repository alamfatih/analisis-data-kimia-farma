-- Judul: Mengidentifikasi Top 5 Pelanggan Berdasarkan Frekuensi dan Nilai Transaksi Tahun 2022

-- Deskripsi: Query ini bertujuan untuk menganalisis data transaksi pelanggan dari tabel
--             `analysis_performance` untuk mengidentifikasi 5 pelanggan teratas berdasarkan
--             jumlah transaksi dan total nilai transaksi (nett sales) yang terjadi pada tahun 2022.

SELECT
    customer_name,
    COUNT(transaction_id) AS jumlah_transaksi_2022, -- Menghitung total jumlah transaksi untuk setiap pelanggan pada tahun 2022.
    ROUND(SUM(nett_sales), 2) AS total_nilai_transaksi_2022 -- Menghitung total nilai transaksi (nett sales) untuk setiap pelanggan pada tahun 2022, dibulatkan hingga 2 desimal.
FROM
    analysis_performance
WHERE
    EXTRACT(YEAR FROM date) = 2022 -- Memfilter data transaksi hanya untuk tahun 2022.
GROUP BY
    customer_name -- Mengelompokkan hasil berdasarkan nama pelanggan untuk melakukan perhitungan agregasi.
ORDER BY
    jumlah_transaksi_2022 DESC, -- Mengurutkan hasil berdasarkan jumlah transaksi secara menurun (pelanggan dengan transaksi terbanyak di atas).
    total_nilai_transaksi_2022 DESC -- Sebagai kriteria sekunder, mengurutkan berdasarkan total nilai transaksi secara menurun.
LIMIT 5; -- Membatasi hasil hanya menampilkan 5 pelanggan teratas.