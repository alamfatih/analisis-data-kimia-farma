-- Judul: Mengidentifikasi Top 5 Provinsi Berdasarkan Frekuensi dan Total Nilai Transaksi (2020-2023)

-- Deskripsi: Query ini bertujuan untuk menganalisis data transaksi dari tabel
--             `analysis_performance` untuk mengidentifikasi 5 provinsi teratas berdasarkan
--             jumlah transaksi yang terjadi di provinsi tersebut dan total nilai transaksi (nett sales)
--             yang dihasilkan di provinsi tersebut selama rentang waktu tahun 2020 hingga 2023.

SELECT
    provinsi,
    COUNT(transaction_id) AS jumlah_transaksi, -- Menghitung total jumlah transaksi untuk setiap provinsi.
    ROUND(SUM(nett_sales), 2) AS total_nilai_transaksi -- Menghitung total nilai transaksi (nett sales) untuk setiap provinsi, dibulatkan hingga 2 desimal.
FROM
    analysis_performance
WHERE
    EXTRACT(YEAR FROM date) BETWEEN 2020 AND 2023 -- Memfilter data transaksi hanya untuk rentang waktu tahun 2020 hingga 2023.
GROUP BY
    provinsi -- Mengelompokkan hasil berdasarkan nama provinsi untuk melakukan perhitungan agregasi.
ORDER BY
    jumlah_transaksi DESC, -- Mengurutkan hasil berdasarkan jumlah transaksi secara menurun (provinsi dengan transaksi terbanyak di atas).
    total_nilai_transaksi DESC -- Sebagai kriteria sekunder, mengurutkan berdasarkan total nilai transaksi secara menurun.
LIMIT 5; -- Membatasi hasil hanya menampilkan 5 provinsi teratas.