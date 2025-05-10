-- Judul: Mengidentifikasi Nama Cabang Berdasarkan Frekuensi Transaksi dan Total Nilai Profit (2020-2023)

-- Deskripsi: Query ini bertujuan untuk menganalisis data transaksi dari tabel
--             `analysis_performance` untuk mengidentifikasi nama cabang berdasarkan
--             jumlah transaksi yang terjadi di setiap cabang dan total nilai profit (nett profit)
--             yang dihasilkan oleh setiap cabang selama rentang waktu tahun 2020 hingga 2023.

SELECT
    branch_name,
    COUNT(transaction_id) AS jumlah_transaksi, -- Menghitung total jumlah transaksi untuk setiap nama cabang.
    ROUND(SUM(nett_profit), 2) AS total_nilai_profit -- Menghitung total nilai profit (nett profit) untuk setiap nama cabang, dibulatkan hingga 2 desimal.
FROM
    analysis_performance
WHERE
    EXTRACT(YEAR FROM date) BETWEEN 2020 AND 2023 -- Memfilter data transaksi hanya untuk rentang waktu tahun 2020 hingga 2023.
GROUP BY
    branch_name -- Mengelompokkan hasil berdasarkan nama cabang untuk melakukan perhitungan agregasi.
ORDER BY
    jumlah_transaksi DESC, -- Mengurutkan hasil berdasarkan jumlah transaksi secara menurun (cabang dengan transaksi terbanyak di atas).
    total_nilai_profit DESC -- Sebagai kriteria sekunder, mengurutkan berdasarkan total nilai profit secara menurun.
-- Tidak menggunakan LIMIT karena perintah meminta untuk mencari nama cabang (semua cabang yang memiliki transaksi).