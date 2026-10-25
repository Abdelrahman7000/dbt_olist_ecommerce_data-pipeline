<h2>Overview</h2>
This project transforms raw operational data from the Brazilian E-Commerce Public Dataset by Olist into a robust, dimensional star schema designed for high-performance business intelligence and reporting.
The pipeline follows staging ➔ intermediate ➔ marts design.


👉
<i>
<a href=https://abdelrahman7000.github.io/dbt_olist_ecommerce_data-pipeline> View Interactive dbt Documentation </a> 
</b>
</i>

<h2>Key Technical Features</h2>
<ul>
  <li>Incremental Modeling (fact_orders, fact_order_items): Optimized for scalability using incremental materializations to get only new data from the source systems using merge incremental strategy.</li>

  <li>Slowly Changing Dimensions (SCD Type 2): Utilizes dbt snapshots on raw seller and customer data to track historical changes over time with dbt_valid_from and       dbt_valid_to audit columns.</li>
<li>Surrogate Key Generation: Leverages dbt_utils.generate_surrogate_key across dimension and fact tables to ensure unique primary key constraints.</li>
<li>Data Quality & Testing: Enforces constraints (unique, not_null) across mart models to guarantee data integrity.</li>
</ul>

<h2>🔀 DAG</h2>
<img src=https://github.com/user-attachments/assets/ed6e84e1-ac2b-46ea-8556-ea9a0da341a9>

<h2>Data Model</h2>
<img src="https://github.com/user-attachments/assets/1a2b9112-37fe-4c45-9008-0db846cb35ac">

<h3>Tables</h3>
<ul>
  <li>customer_dim: Capturing the evolving state of Olist's customer base.</li>
  <li>location_dim: An outrigger dimension that connects to the customer and seller dimensions.</li>
  <li>payment_dim: Contains different payment types.</li>
  <li>product_dim: Product category specification.</li>
  <li>reviews_dim: Contains review details. </li>
  <li>seller_dim: seller location and detail.</li>
  <li>order_fct: Captures order related attributes and connects to the customer, product, seller, payment and review dimensions. with aggregated metrics for orders and reviews.</li>
  <li>order_items_fct: Contains individual order items along the products and sellers. </li>
</ul>

<h2>✅ Data Quality</h2>
<b>Generic Tests</b>: 

`positive_value` , `valid_date_sequence` , `not_null`, and `unique`.

<b>Singular Tests</b>: Custome sql tests to catch business logic errors:

`delivered_orders_has_date` : To catch delivered orders that have no delivery dates.
`seller_delivery_rate_validity` : Ensures that the seller's delayed delivery rate is between 0% and 100%, identifying invalid percentage values.


<h2>📊 Data Insights</h2>
<img src="https://github.com/user-attachments/assets/015d15cf-6a93-4ecb-b2c4-f980792f8add" >
<img src="https://github.com/user-attachments/assets/208134b0-b126-4030-b9ff-f01c47ef406a" >
<img src="https://github.com/user-attachments/assets/d1e7adc7-64eb-4a14-9899-228b9f41bb3c" >
<img src="https://github.com/user-attachments/assets/362109b6-35f4-4f4d-8a1c-a05627d699bd" >
<img src="https://github.com/user-attachments/assets/dde3983d-bb9b-4ef9-9785-0258489923f9" >
 
<h2>🚀 Getting Started & Setup</h2>

</ul>
<h3>Installation & Execution</h3>
<ul>
<li>Clone this repo:</li>

```Bash
git clone https://github.com/Abdelrahman7000/dbt_olist_ecommerce_data-pipeline.git 
```

<li>start the containers:</li>

```Bash
docker compose up -d
```
<li>Load raw CSV data into your PostgreSQL raw schema. The data is from <a href=https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce>Kaggle.</a> I have used COPY command to load the data into postgres at <b>ecommerce_db.raw </b> schema.</li>


<li>install dbt packages:</li>

```Bash
 docker compose exec dbt dbt deps
```

<li>Run dbt models and snapshots:</li>

```Bash
 docker compose exec dbt dbt snapshot
 docker compose exec dbt dbt run
 docker compose exec dbt dbt test
```
<li>Generate and view documentation:</li>

```Bash
docker compose exec dbt dbt docs generate
docker compose exec dbt dbt docs serve
```

<li>Alternatively, execute models and tests together with:</li>

```Bash
docker compose exec dbt dbt build
```
</ul>


