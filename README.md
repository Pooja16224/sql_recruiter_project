# Recruiter Analytics SQL Project

## Project Overview

**Project Title**: Recruiter Analytics System  
**Level**: Intermediate  
**Database**: `recruiter_db`

This project focuses on analyzing recruitment data using SQL. It helps in understanding hiring trends, candidate distribution, job demand, and company performance.

The project demonstrates how SQL can be used to extract meaningful insights from real-world hiring data.

---

## Objectives

* Design a structured database for recruitment analysis
* Analyze candidate and job-related data using SQL
* Generate business insights from hiring patterns
* Practice SQL concepts like joins, aggregations, CASE, and window functions

---

## Project Structure

### Database Tables

* **Candidates** → Stores candidate details (experience, skills, city)
* **Companies** → Stores company information
* **Jobs** → Job postings by companies
* **Applications** → Links candidates with jobs
* **Interviews** → Tracks interview outcomes

---

## Entity Relationship Diagram
![ER Diagram](https://github.com/Pooja16224/sql_recruiter_project/blob/main/ER%20Diagram.png?raw=true)

---

## Data Analysis & Business Questions

Below are some key questions explored to understand the recruitment data:

---

### 1. How many candidates are there in the database?

```sql
select count(*) number_of_candidates
from candidates;
```

---

### 2. How many jobs have been posted in total?

```sql
select count(*) number_of_jobs_posted
from jobs;
```

---

### 3. How many applications have candidates submitted?

```sql
select count(*) number_of_applications
from applications;
```

---

### 4. Which companies belong to the IT industry?

```sql
select company_name
from companies
where industry="IT";
```

---

### 5. How many jobs has each company posted?

```sql
select c.company_name,
	   count(*) number_of_jobs_posted
from companies c 
join jobs j
on c.company_id = j.company_id
group by c.company_name; 
```

---

### 6. How can candidates be grouped based on their experience level?

```sql
 select *,
    case
		when experience_years < 2 then 'Fresher'
        when experience_years between 2 and 5 then 'Mid-level'
        else 'Senior'
        end as 'Category'
	from candidates;
```

---

### 7. What is the distribution of application statuses?

```sql
select status,count(*) number_of_status
 from applications
 group by 1;
```

---

### 8. Which cities have the highest number of candidates?

```sql
select city,count(*) number_of_candidates
 from candidates
 group by 1;
```

---

### 9. Which job offers the highest salary?

```sql
select *
 from jobs
 order by salary desc
 limit 1;
```

---

### 10. Which job has received the most applications?

```sql
select job_id,number_of_applications
 from
(select j.job_id,count(*) number_of_applications,
 rank() over(order by count(*) desc) as rnk
 from jobs j join applications a 
 on j.job_id = a.job_id
 group by j.job_id
 ) table1
 where rnk=1;
```

---

### 11. How many times has each candidate been successfully selected?

```sql
 select candidate_id,
 count(
	case 
		when status ='Selected' then 1 end ) as hiring_success_count
 from applications 
 group by candidate_id;
```

---

### 12. How many candidates has each company selected?

```sql
select c.company_name,count(*) number_of_selected_candidates
 from applications a join jobs j
 on a.job_id = j.job_id
 join companies c 
 on c.company_id = j.company_id
  where a.status='selected'
 group by c.company_name;
```

---

### 13. What is the most common skill among candidates?

```sql
select skills,count(*) as demand
from candidates
group by skills 
order by demand desc
limit 1;
```

---

### 14. Which candidates have applied to more than one job?

```sql
select c.candidate_id, c.name,
	count(a.job_id) number_of_job_applied
from candidates c join applications a
on c.candidate_id =a.candidate_id
group by c.candidate_id
having  number_of_job_applied > 1 ;
```

---

### 15. What is the overall hiring success rate?

```sql
select
 count(case when status = 'selected' then 1 
 end)  * 100.0 /
 count(*)  as success_rate 
 from applications;
```

---

### 16. How do candidates rank based on their experience?

```sql
select *,
rank() over(order by experience_years desc) rank_based_on_experience,
dense_rank() over(order by experience_years desc) dense_rank_based_on_experience
from candidates;
```

---

### 17. Which company has received the highest number of applications?

```sql
select company_name,number_of_applications
from
(select
 c.company_name,
 count(a.application_id) number_of_applications,
 rank() over(order by count(application_id) desc) as rnk
from applications a join jobs j
on a.job_id = j.job_id
join companies c
on c.company_id =j.company_id
group by c.company_name
) table1
where rnk =1;
```

---

## Key Insights

* Top hiring companies include **TCS and Infosys**
* Most common skills are **SQL and Java**
* Majority of candidates are **Mid-level (2–5 years experience)**
* Hiring success rate is around **33%**, showing a competitive process
* Cities like **Pune and Bangalore** have the highest candidate concentration

---

## Conclusion

This project demonstrates how SQL can be used to analyze recruitment data and generate useful business insights. It helps in understanding hiring patterns, candidate trends, and company performance.

---

## How to Use

1. Create the database and tables
2. Insert the data
3. Run the SQL queries
4. Analyze the results

---

## Author

This project is part of my portfolio showcasing SQL and data analysis skills for data analyst roles.
