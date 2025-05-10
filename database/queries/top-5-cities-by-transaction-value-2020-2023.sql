-- Judul: Mengidentifikasi Top 5 Kota Berdasarkan Frekuensi dan Total Nilai Transaksi (2020-2023)

-- Deskripsi: Query ini bertujuan untuk menganalisis data transaksi dari tabel
--             `analysis_performance` untuk mengidentifikasi 5 kota teratas berdasarkan
--             jumlah transaksi yang terjadi di kota tersebut dan total nilai transaksi (nett sales)
--             yang dihasilkan di kota tersebut selama rentang waktu tahun 2020 hingga 2023.

SELECT
    kota,
    COUNT(transaction_id) AS jumlah_transaksi, -- Menghitung total jumlah transaksi untuk setiap kota.
    ROUND(SUM(nett_sales), 2) AS total_nilai_transaksi -- Menghitung total nilai transaksi (nett sales) untuk setiap kota, dibulatkan hingga 2 desimal.
FROM
    analysis_performance
WHERE
    EXTRACT(YEAR FROM date) BETWEEN 2020 AND 2023 -- Memfilter data transaksi hanya untuk rentang waktu tahun 2020 hingga 2023.
GROUP BY
    kota -- Mengelompokkan hasil berdasarkan nama kota untuk melakukan perhitungan agregasi.
ORDER BY
    jumlah_transaksi DESC, -- Mengurutkan hasil berdasarkan jumlah transaksi secara menurun (kota dengan transaksi terbanyak di atas).
    total_nilai_transaksi DESC -- Sebagai kriteria sekunder, mengurutkan berdasarkan total nilai transaksi secara menurun.
LIMIT 5; -- Membatasi hasil hanya menampilkan 5 kota teratas.