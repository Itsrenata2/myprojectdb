# 🎵 Chinook Database Analysis

## 🧠 Introduction

This project explores the **Chinook Database**, a classic dataset for SQL analysis representing a digital music store.  
Through this analysis, we dive into customer demographics, sales performance, and musical trends — discovering insights about 💰 **revenue**, 🎧 **top artists**, and 🌍 **customer distribution**.

🔍 **SQL queries?** Check them out here: [`chinook_sql/`](chinook_sql)

---

## 🏗️ Background

The Chinook Database contains information about customers, employees, invoices, tracks, albums, artists, and genres.  
This analysis was designed to answer questions such as:

1. Which genres have the highest average track prices?  
2. How are customers distributed across countries and cities?  
3. Which employee generated the most revenue?  
4. What is the average monthly revenue?  
5. Who are the top-selling artists and albums?  
6. Which customer spent the most overall?

---

## 🧰 Tools I Used

- **SQL** – For querying and exploring data  
- **PostgreSQL** – To manage and query the Chinook dataset  
- **Visual Studio Code** – For running and testing SQL scripts  
- **Git & GitHub** – For version control and project organization  

---

## 🔎 The Analysis

Each query focuses on a key business or music-related question derived from the Chinook dataset.

---

### 1️⃣ Average Track Price per Genre

```sql
SELECT 
    g.name AS genre,
    CEIL(AVG(i.unit_price)) AS avg_track_price
FROM invoice_line AS i
JOIN track AS t
    ON i.track_id = t.track_id
JOIN genre AS g
    ON t.genre_id = g.genre_id
GROUP BY g.name
ORDER BY avg_track_price DESC;
```
**Insight:**
🎬 Sci-Fi & Fantasy tracks have the highest average price among all genres.

### 2️⃣ Customers per Country and City

**By Country:**
```sql
SELECT
    COUNT(*) AS customers_per_country,
    country
FROM customer AS c
GROUP BY country
ORDER BY customers_per_country DESC;
```
**By City:**
```sql
SELECT
    COUNT(*) AS customers_per_country,
    city
FROM customer AS c
GROUP BY city
ORDER BY customers_per_country DESC;
```
**Insight:**
🇺🇸 The USA has the largest customer base in the dataset.

### 3️⃣ Revenue per Employee

```sql
SELECT 
    e.first_name,
    e.last_name,
    ROUND(SUM(i.total), 2) AS total_revenue
FROM employee AS e
JOIN customer AS c
    ON c.support_rep_id = e.employee_id
JOIN invoice AS i
    ON i.customer_id = c.customer_id
GROUP BY e.first_name, e.last_name
ORDER BY total_revenue DESC;
```
**Insight:**
💼 Jane Peacock generated the highest revenue among employees.

### 4️⃣ Average Monthly Revenue

```sql
SELECT 
    EXTRACT(MONTH FROM invoice_date) AS month,
    ROUND(AVG(total)) AS avg_monthly_revenue
FROM invoice
GROUP BY 
    EXTRACT(MONTH FROM invoice_date)
ORDER BY month ASC;
```
**Insight:**
📅 The average revenue remains consistent across months, showing steady sales throughout the year.


### 5️⃣ Most Sold Artists

```sql
SELECT 
    ar.name,
    SUM(i.quantity) AS total_sold
FROM invoice_line AS i
JOIN track AS t
    ON i.track_id = t.track_id
JOIN album AS al
    ON t.album_id = al.album_id
JOIN artist AS ar
    ON al.artist_id = ar.artist_id
GROUP BY ar.name
ORDER BY total_sold DESC;
```
**Insight:**
🎸 Iron Maiden leads with 140 tracks sold, followed by U2, Metallica, and Led Zeppelin.

### 6️⃣ Most Sold Albums

```sql
SELECT
    al.title,
    SUM(i.quantity) AS total_sold
FROM invoice_line AS i
JOIN track AS t
    ON i.track_id = t.track_id
JOIN album AS al
    ON t.album_id = al.album_id
GROUP BY al.title
ORDER BY total_sold DESC;
```
**Insight:**
💿 The album “Minha História” is the top-selling album in the store.

### 7️⃣ Top Customer by Total Purchases

```sql
SELECT 
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_spent
FROM customer AS c
JOIN invoice AS i
    ON i.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;
```
**Insight:**
💿 Helena Holý is the store’s top customer by total purchases.

---

## 🚀 What I Learned

- 🧩 **Advanced SQL joins:** mastering INNER and multi-table joins  
- 📊 **Data grouping and aggregation:** using `GROUP BY`, `AVG()`, `SUM()`, and `COUNT()`  
- 🕵️‍♀️ **Analytical thinking:** extracting insights about customer behavior, revenue trends, and performance  
- 💡 **Business translation:** turning questions into actionable SQL queries  

---

## 🧭 Conclusions & Insights

- 🎶 *Sci-Fi & Fantasy* has the highest track prices  
- 🌎 The **USA** leads in customer count  
- 💼 **Jane Peacock** is the top-performing employee  
- 📅 Monthly revenue remains steady  
- 🎸 **Iron Maiden** dominates in track sales  
- 💿 *Minha História* tops the album charts  
- 👑 **Helena Holú** is the most valuable customer  

---

## 💬 Closing Thoughts

This project was a fun and practical exploration of SQL with the **Chinook Database**.  
It strengthened my skills in **data querying, aggregation, and interpretation**, while uncovering trends in **music sales** and **customer behavior**.  
The analysis demonstrates how SQL can transform raw data into **meaningful business insights**.
