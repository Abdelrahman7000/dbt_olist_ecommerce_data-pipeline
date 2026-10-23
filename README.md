<h2>Overview</h2>
This project transforms raw operational data from the Brazilian E-Commerce Public Dataset by Olist into a robust, dimensional star schema designed for high-performance business intelligence and reporting.
The pipeline follows staging ➔ intermediate ➔ marts design.

<a href=https://abdelrahman7000.github.io/dbt_olist_ecommerce_data-pipeline> View Interactive dbt Documentation </a> 

<h2>Key Technical Features</h2>
<ul>
  <li>Incremental Modeling (fact_orders, fact_order_items): Optimized for scalability using incremental materializations to get only new data from the source systems using merge incremental strategy.</li>

  <li>Slowly Changing Dimensions (SCD Type 2): Utilizes dbt snapshots on raw seller and customer data to track historical changes over time with dbt_valid_from and       dbt_valid_to audit columns.</li>
<li>Surrogate Key Generation: Leverages dbt_utils.generate_surrogate_key across dimension and fact tables to ensure unique primary key constraints.</li>
<li>Data Quality & Testing: Enforces constraints (unique, not_null) across mart models to guarantee data integrity.</li>
</ul>



<h2>Getting Started & Setup</h2>
<h3>Prerequisites</h3>
<ul>
  <li>docker</li>
  <li>Python</li>
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
<li>Load raw CSV data into your PostgreSQL raw schema.</li>
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

</ul>


