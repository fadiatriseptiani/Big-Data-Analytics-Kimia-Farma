-- cek-cek dulu

SELECT *
FROM `kimia_farma.kf_final_transaction`;

-- duplicate data check table kf_final_transaction

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY transaction_id, `date`, branch_id, customer_name,
product_id, price ) AS row_num
FROM `kimia_farma.kf_final_transaction`
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- null data check tabel kf_final_transaction
SELECT * FROM `kimia_farma.kf_final_transaction` WHERE transaction_id IS NULL
OR `date` IS NULL
OR branch_id IS NULL
OR customer_name IS NULL
OR product_id IS NULL
OR price IS NULL
OR discount_percentage IS NULL
OR rating IS NULL;

-- cek duplikat tabel kf_inventory

WITH duplicate_cte2 AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY inventory_ID, product_name, branch_id, opname_stock,
product_id ) AS row_num
FROM `kimia_farma.kf_inventory`
)
SELECT *
FROM duplicate_cte2
WHERE row_num > 1;

-- cek null data tabel kf_inventory

SELECT * FROM `kimia_farma.kf_inventory` WHERE inventory_ID IS NULL
OR product_name IS NULL
OR branch_id IS NULL
OR opname_stock IS NULL
OR product_id IS NULL
;

-- cek duplikat tabel kf_kantor_cabang

WITH duplicate_cte3 AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY branch_id, branch_category, branch_name, kota,
provinsi) AS row_num
FROM `kimia_farma.kf_kantor_cabang`
)
SELECT *
FROM duplicate_cte3
WHERE row_num > 1;

-- cek null data tabel kf_kantor_cabang

SELECT * FROM `kimia_farma.kf_kantor_cabang` WHERE branch_category IS NULL
OR branch_name IS NULL
OR branch_id IS NULL
OR kota IS NULL
OR provinsi IS NULL
OR rating IS NULL
;

-- cek duplikat tabel kf_product

WITH duplicate_cte4 AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY product_id, product_category, product_name, price) AS row_num
FROM `kimia_farma.kf_product`
)
SELECT *
FROM duplicate_cte4
WHERE row_num > 1;

-- cek null data tabel kf_product

SELECT * FROM `kimia_farma.kf_product` WHERE product_category IS NULL
OR product_name IS NULL
OR product_id IS NULL
OR price IS NULL
;

SELECT COUNT (DISTINCT product_name) FROM `kimia_farma.kf_product`
;