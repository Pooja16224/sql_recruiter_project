
#1.Write a query to find the total number of candidates.

select count(*) number_of_candidates
from candidates;

#2.Write a query to find the total number of jobs posted.
select count(*) number_of_jobs_posted
from jobs;

#3.Write a query to count the total number of applications.
select count(*) number_of_applications
from applications;

#4.Write a query to list all companies working in the IT industry.
select company_name
from companies
where industry="IT";

#5.Write a query to find the number of jobs posted by each company.
select c.company_name,
	   count(*) number_of_jobs_posted
from companies c 
join jobs j
on c.company_id = j.company_id
group by c.company_name; 

#6.Write a query to classify candidates into Fresher, Mid, and Senior based on experience.
    select *,
    case
		when experience_years < 2 then 'Fresher'
        when experience_years between 2 and 5 then 'Mid-level'
        else 'Senior'
        end as 'Category'
	from candidates;
    
 #7.Write a query to find the number of applications under each status (Applied, Selected, Rejected, etc.).
 
 select status,count(*) number_of_status
 from applications
 group by 1;
 
 
 #8.Write a query to find how many candidates are from each city.
 select city,count(*) number_of_candidates
 from candidates
 group by 1;
 
 #9.Write a query to find the job with the highest salary.
 
 select *
 from jobs
 order by salary desc
 limit 1;
 
 #10.Write a query to find the job that has received the highest number of applications.
 
 select job_id,number_of_applications
 from
(select j.job_id,count(*) number_of_applications,
 rank() over(order by count(*) desc) as rnk
 from jobs j join applications a 
 on j.job_id = a.job_id
 group by j.job_id
 ) table1
 where rnk=1;
 

 
 #11.Write a query to find the hiring success count for each candidate.
 select candidate_id,
 count(
	case 
		when status ='Selected' then 1 end ) as hiring_success_count
 from applications 
 group by candidate_id;
 
  #12.Write a query to find the number of selected candidates for each company.
 select c.company_name,count(*) number_of_selected_candidates
 from applications a join jobs j
 on a.job_id = j.job_id
 join companies c 
 on c.company_id = j.company_id
  where a.status='selected'
 group by c.company_name;
;
 
 #13.Write a query to find the most in-demand skill from candidates.
 select skills,count(*) as demand
from candidates
group by skills 
order by demand desc
limit 1;

#14.Write a query to find candidates who have applied for more than one job.
select c.candidate_id, c.name,count(a.job_id) number_of_job_applied
from candidates c join applications a
on c.candidate_id =a.candidate_id
group by c.candidate_id
having  number_of_job_applied > 1 ;

#15.Write a query to calculate the interview success rate (percentage of selected candidates).
select
 count(case when status = 'selected' then 1 
 end)  * 100.0 /
 count(*)  as success_rate 
 from applications;

#16.Write a query to rank candidates based on their experience in descending order.
select *,
rank() over(order by experience_years desc) rank_based_on_experience,
dense_rank() over(order by experience_years desc) dense_rank_based_on_experience
from candidates;


#17.Write a query to find recruiters or companies handling the highest number of applications.

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





