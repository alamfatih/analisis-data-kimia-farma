-- Judul: Mengidentifikasi Top 5 Pelanggan Berdasarkan Frekuensi dan Nilai Transaksi

-- Deskripsi: Query ini bertujuan untuk menganalisis data transaksi pelanggan dari tabel
--             `analysis_performance` untuk mengidentifikasi 5 pelanggan teratas berdasarkan
--             jumlah transaksi yang mereka lakukan dan total nilai transaksi (nett sales) mereka.
--             Analisis mencakup seluruh data yang tersedia dalam tabel.

SELECT
    customer_name,
    COUNT(transaction_id) AS jumlah_transaksi, -- Menghitung total jumlah transaksi untuk setiap pelanggan.
    ROUND(SUM(nett_sales), 2) AS total_nilai_transaksi -- Menghitung total nilai transaksi (nett sales) untuk setiap pelanggan, dibulatkan hingga 2 desimal.
FROM
    analysis_performance
GROUP BY
    customer_name -- Mengelompokkan hasil berdasarkan nama pelanggan untuk melakukan perhitungan agregasi.
ORDER BY
    jumlah_transaksi DESC, -- Mengurutkan hasil berdasarkan jumlah transaksi secara menurun (pelanggan dengan transaksi terbanyak di atas).
    total_nilai_transaksi DESC -- Sebagai kriteria sekunder, mengurutkan berdasarkan total nilai transaksi secara menurun.
LIMIT 5; -- Membatasi hasil hanya menampilkan 5 pelanggan teratas.