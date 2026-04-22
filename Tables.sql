
create database recruiter_db;
use recruiter_db;


CREATE TABLE companies (
company_id INT PRIMARY KEY,
company_name VARCHAR(100),
industry VARCHAR(50),
location VARCHAR(100)
);

CREATE TABLE recruiters (
recruiter_id INT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
company_id INT,
FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE candidates (
candidate_id INT PRIMARY KEY,
name VARCHAR(100),
gender VARCHAR(10),
experience_years INT,
skills VARCHAR(200),
city VARCHAR(50)
);

CREATE TABLE jobs (
job_id INT PRIMARY KEY,
company_id INT,
job_title VARCHAR(100),
job_role VARCHAR(100),
salary DECIMAL(10,2),
location VARCHAR(100),
FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE applications (
application_id INT PRIMARY KEY,
candidate_id INT,
job_id INT,
application_date DATE,
status VARCHAR(50), 
-- Applied / Shortlisted / Interviewed / Selected / Rejected
FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id),
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE interviews (
interview_id INT PRIMARY KEY,
application_id INT,
interview_date DATE,
round VARCHAR(50),
result VARCHAR(50),
FOREIGN KEY (application_id) REFERENCES applications(application_id)
);

INSERT INTO companies VALUES
(1, 'TCS', 'IT', 'Mumbai'),
(2, 'Infosys', 'IT', 'Bangalore'),
(3, 'Accenture', 'Consulting', 'Pune'),
(4, 'Wipro', 'IT', 'Hyderabad'),
(5, 'Deloitte', 'Consulting', 'Gurgaon'),
(6, 'Capgemini', 'IT', 'Mumbai'),
(7, 'HCL Technologies', 'IT', 'Noida'),
(8, 'IBM', 'Technology', 'Bangalore');


INSERT INTO recruiters VALUES
(1, 'Amit Sharma', 'amit@tcs.com', 1),
(2, 'Neha Verma', 'neha@infosys.com', 2),
(3, 'Rahul Mehta', 'rahul@accenture.com', 3),
(4, 'Pooja Singh', 'pooja@wipro.com', 4),
(5, 'Karan Patel', 'karan@deloitte.com', 5),
(6, 'Suresh Reddy', 'suresh@capgemini.com', 6),
(7, 'Anjali Desai', 'anjali@hcl.com', 7),
(8, 'Mohit Jain', 'mohit@ibm.com', 8);

INSERT INTO candidates VALUES
(1, 'Ravi Kumar', 'Male', 2, 'SQL,Python', 'Pune'),
(2, 'Sneha Joshi', 'Female', 1, 'Excel,SQL', 'Mumbai'),
(3, 'Aman Gupta', 'Male', 5, 'Java,SQL', 'Delhi'),
(4, 'Priya Sharma', 'Female', 3, 'Python,Power BI', 'Bangalore'),
(5, 'Vikram Singh', 'Male', 4, 'SQL,Tableau', 'Hyderabad'),
(6, 'Neha Kapoor', 'Female', 2, 'Excel,Python', 'Pune'),
(7, 'Arjun Patel', 'Male', 1, 'SQL,Excel', 'Mumbai'),
(8, 'Kavya Nair', 'Female', 4, 'Python,Tableau', 'Chennai'),
(9, 'Rahul Yadav', 'Male', 3, 'Java,SQL', 'Pune'),
(10, 'Simran Kaur', 'Female', 2, 'Power BI,Excel', 'Delhi'),
(11, 'Deepak Sharma', 'Male', 5, 'SQL,Python,ETL', 'Bangalore');

INSERT INTO jobs VALUES
(1, 1, 'Data Analyst', 'Analytics', 600000, 'Pune'),
(2, 2, 'Software Engineer', 'Development', 800000, 'Bangalore'),
(3, 3, 'Business Analyst', 'Analytics', 700000, 'Pune'),
(4, 4, 'Data Engineer', 'Engineering', 900000, 'Hyderabad'),
(5, 5, 'Consultant', 'Strategy', 1000000, 'Gurgaon'),
(6, 6, 'Data Analyst', 'Analytics', 650000, 'Mumbai'),
(7, 7, 'Backend Developer', 'Development', 850000, 'Noida'),
(8, 8, 'Cloud Engineer', 'Engineering', 1200000, 'Bangalore');

INSERT INTO applications VALUES
(1, 1, 1, '2026-01-10', 'Selected'),
(2, 2, 1, '2026-01-11', 'Rejected'),
(3, 3, 2, '2026-01-12', 'Shortlisted'),
(4, 4, 3, '2026-01-13', 'Selected'),
(5, 5, 4, '2026-01-14', 'Interviewed'),
(6, 6, 5, '2026-01-15', 'Applied'),
(7, 1, 2, '2026-01-16', 'Shortlisted'),
(8, 7, 6, '2026-01-17', 'Selected'),
(9, 8, 7, '2026-01-18', 'Shortlisted'),
(10, 9, 8, '2026-01-19', 'Applied'),
(11, 10, 1, '2026-01-20', 'Rejected'),
(12, 11, 3, '2026-01-21', 'Selected'),
(13, 2, 4, '2026-01-22', 'Shortlisted'),
(14, 3, 5, '2026-01-23', 'Interviewed'),
(15, 4, 2, '2026-01-24', 'Selected');

INSERT INTO interviews VALUES
(1, 1, '2026-01-20', 'HR', 'Selected'),
(2, 3, '2026-01-21', 'Technical', 'Pending'),
(3, 4, '2026-01-22', 'Managerial', 'Selected'),
(4, 5, '2026-01-23', 'HR', 'Rejected'),
(5, 8, '2026-01-25', 'HR', 'Selected'),
(6, 9, '2026-01-26', 'Technical', 'Pending'),
(7, 12, '2026-01-27', 'Managerial', 'Selected'),
(8, 15, '2026-01-28', 'HR', 'Selected'),
(9, 14, '2026-01-29', 'Technical', 'Rejected');


select * from companies;
select * from jobs;
select * from recruiters;
select * from applications;
select * from interviews;
select * from candidates;
