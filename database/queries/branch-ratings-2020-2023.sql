-- Judul: Mengidentifikasi Cabang dengan Rating Tertinggi (2020-2023)

-- Deskripsi: Query ini bertujuan untuk menganalisis data dari tabel `analysis_performance`
--             untuk mengidentifikasi nama cabang dan rata-rata rating cabang mereka
--             selama rentang waktu tahun 2020 hingga 2023. Diasumsikan rating cabang
--             yang lebih tinggi menunjukkan kinerja atau kepuasan yang lebih baik.

SELECT
    branch_name,
    ROUND(AVG(rating_cabang), 2) AS rata_rata_rating_cabang -- Menghitung rata-rata rating cabang untuk setiap nama cabang dan membulatkannya menjadi 2 desimal.
FROM
    analysis_performance
WHERE
    EXTRACT(YEAR FROM date) BETWEEN 2020 AND 2023 -- Memfilter data transaksi hanya untuk rentang waktu tahun 2020 hingga 2023.
GROUP BY
    branch_name -- Mengelompokkan hasil berdasarkan nama cabang untuk menghitung rata-rata rating.
ORDER BY
    rata_rata_rating_cabang DESC; -- Mengurutkan hasil berdasarkan rata-rata rating cabang secara menurun (rating tertinggi di atas).