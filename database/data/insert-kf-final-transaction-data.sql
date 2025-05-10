-- Mengisi data ke dalam tabel kf_final_transaction
INSERT INTO kf_final_transaction (transaction_id, date, branch_id, customer_name, product_id, price, discount_percentage, rating) VALUES
('TRX5844188', '2023-09-07', '88605', 'Elizabeth Thomas', 'KF260', 118700, 0.05, 3), -- Transaksi 1
('TRX6182886', '2022-11-07', '27840', 'Andrew Martinez', 'KF492', 751900, 0.07, 4.8), -- Transaksi 2
('TRX7691180', '2023-05-30', '62913', 'Charles Reynolds', 'KF540', 744200, 0.03, 3.3), -- Transaksi 3
('TRX3205743', '2022-11-28', '31604', 'Casey Cochran', 'KF389', 761700, 0.06, 3.5), -- Transaksi 4
('TRX3644533', '2023-05-28', '20322', 'Rebecca Moore', 'KF854', 681000, 0.13, 4.1), -- Transaksi 5
('TRX1090520', '2022-05-16', '34490', 'Jacob Robinson', 'KF201', 78400, 0.06, 4.8), -- Transaksi 6
('TRX2800835', '2023-10-11', '47342', 'Susan Morris', 'KF576', 353300, 0.07, 4.6), -- Transaksi 7
('TRX2179171', '2020-09-01', '41296', 'Amanda Leon', 'KF134', 832800, 0.01, 4.5), -- Transaksi 8
('TRX4221759', '2023-04-18', '76684', 'Todd Ferrell', 'KF248', 215100, 0.01, 4.9), -- Transaksi 9
('TRX9341056', '2022-11-07', '55995', 'Samuel Edwards', 'KF289', 695100, 0.1, 3.6);  -- Transaksi 10

-- Catatan: Format tanggal adalah YYYY-MM-DD sesuai dengan standar PostgreSQL.