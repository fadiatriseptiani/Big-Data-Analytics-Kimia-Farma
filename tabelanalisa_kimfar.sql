CREATE OR REPLACE TABLE kimia_farma.table_analisa AS
WITH tabel_analisa2 AS (
SELECT
  kft.transaction_id,
  kft.date,
  kft.branch_id,
  kkc.branch_name,
  kkc.kota,
  kkc.provinsi,
  kkc.rating AS rating_cabang,
  kft.customer_name,
  kft.product_id,
  kp.product_name,
  kp.price AS actual_price,
  kft.discount_percentage,

  -- Hitung persentase laba berdasarkan rentang harga
    (
      CASE
    WHEN kp.price <= 50000 THEN 0.10
    WHEN kp.price > 50000 AND kp.price <= 100000 THEN 0.15
    WHEN kp.price > 100000 AND kp.price <= 300000 THEN 0.20
    WHEN kp.price > 300000 AND kp.price <= 500000 THEN 0.25
    WHEN kp.price > 500000 THEN 0.30
  END) AS persentase_gross_laba,

  -- Hitung harga setelah diskon
  (kp.price * (1 - kft.discount_percentage / 100)) AS nett_sales,

  -- Hitung keuntungan bersih (nett_sales * persentase_laba)
  (kp.price * (1 - kft.discount_percentage / 100)) *
    CASE
    WHEN kp.price <= 50000 THEN 0.10
    WHEN kp.price > 50000 AND kp.price <= 100000 THEN 0.15
    WHEN kp.price > 100000 AND kp.price <= 300000 THEN 0.20
    WHEN kp.price > 300000 AND kp.price <= 500000 THEN 0.25
    WHEN kp.price > 500000 THEN 0.30
  END AS nett_profit,

  kft.rating AS rating_transaksi

FROM `kimia_farma.kf_final_transaction` AS kft
LEFT JOIN `kimia_farma.kf_product` AS kp
  ON kft.product_id = kp.product_id
LEFT JOIN `kimia_farma.kf_kantor_cabang` AS kkc
  ON kft.branch_id = kkc.branch_id
LEFT JOIN `kimia_farma.kf_inventory` AS ki
  ON kft.product_id = ki.product_id AND kft.branch_id = ki.branch_id
)

SELECT *
FROM tabel_analisa2;