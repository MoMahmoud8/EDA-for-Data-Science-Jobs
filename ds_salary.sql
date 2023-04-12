select * from ds_salaries

-- get unique values in each column
select [work_year] ,count(*) Count_ from ds_salaries group by [work_year]

select [experience_level] ,count(*) Count_ from ds_salaries group by [experience_level]

select [employment_type] ,count(*) Count_ from ds_salaries group by [employment_type]

select  [job_title],count(*) Count_ from ds_salaries group by [job_title]

select [salary_currency] ,count(*) Count_ from ds_salaries group by [salary_currency]

select [employee_residence] ,count(*) Count_ from ds_salaries group by [employee_residence]

select  [remote_ratio],count(*) Count_ from ds_salaries group by [remote_ratio]

select  [company_location],count(*) Count_ from ds_salaries group by [company_location]

select [company_size],count(*) Count_ from ds_salaries group by [company_size]



--avg salary for each company_size
select [company_size],avg([salary])
from ds_salaries
group by [company_size];


--the increase in avg salaries in usd from 2020 to 2022
select work_year ,avg([salary_in_usd])
from ds_salaries
group by work_year;

--count of experience level per job title 
select [job_title],[experience_level],count(*) experience_level_per_job_title
from ds_salaries
group by [job_title],[experience_level]
order by 1;


--all the job related to data field
SELECT distinct [job_title]
FROM ds_salaries
group by [job_title]



--the amount of each emloyment_type
select[employment_type] ,count(*)
from ds_salaries
group by [employment_type];

-- Mean Salaries per Job
select [job_title],avg([salary_in_usd])avg_salary
from ds_salaries
group by [job_title]
order by 1;

--avg salaries for each job title and company_size

select [job_title],[company_size],avg([salary_in_usd])avg_salary
from ds_salaries
group by [job_title],[company_size]
order by 1;

-- mean salary for job title per location
select [job_title],[company_location],avg([salary_in_usd])avg_salary
from ds_salaries
group by [job_title],[company_location]
order by 1,2;

--percent of employees who work out of there country with their roles and country
select (sum(case when [employee_residence] != [company_location] then 1 else 0 end )*100/count(*)) foreign_employees
from ds_salaries;


-- mean salary for job title in USA
select [job_title],avg([salary_in_usd])avg_salary
from ds_salaries
where [company_location] ='US'
group by [job_title]
order by 1,2;

-- number of companies in each country 

select [company_location] ,count(*) number_of_companies
from ds_salaries
group by [company_location]
order by 2 desc;

-- number of job titles in each country 
select [job_title] ,[company_location],count(*) number_of_companies
from ds_salaries
group by [job_title],[company_location]
order by 3 desc;


--top 10 countries which hire data roles
select top 10 [company_location] ,count(*)
from ds_salaries
group by [company_location]
order by 2 desc;
--# Experience Level destribution
select  [experience_level],count(*)number_of_levels
from ds_salaries
group by experience_level;

select sum(case when [experience_level]='EN' then 1 else 0 end)*100.0/count(*) as Entry_level_ratio,
sum(case when [experience_level]='MI' then 1 else 0 end)*100.0/count(*) as MID_ratio,
sum(case when [experience_level]='SE' then 1 else 0 end)*100.0/count(*) as Senior_ratio,
sum(case when [experience_level]='EX' then 1 else 0 end)*100.0/count(*) as Expert_ratio
from ds_salaries;

--# avg per per experience level 
select [experience_level],avg([salary_in_usd]) avg_salary
from ds_salaries
group by experience_level
order by 2 desc;

--avg salaries of experience level per year
select [work_year],[experience_level],count(*)Number_of_experience,avg([salary_in_usd]) avg_salary
from ds_salaries
group by [work_year],[experience_level]
order by 2;

--A comparison between the salaries of Employee Residence and foreigns in large company
select job_title , case when employee_residence = company_location then 'resident' else 'foreign' end as employee_type,
  avg(salary) avg_salary
FROM ds_salaries
where company_size ='L'
group by job_title, company_size,case when employee_residence = company_location then 'resident' else 'foreign' end
order by 1,2;

-- avg salary per job based on remote ratio 
select [job_title],case when [remote_ratio] =0 then 'remote' when [remote_ratio]=50 then 'hybird' else 'on-site' end as job_type, avg([salary_in_usd])
from ds_salaries
group by [job_title],case when [remote_ratio] =0 then 'remote' when [remote_ratio]=50 then 'hybird' else 'on-site' end
order by 1;


--count of experience level per job title 
select [job_title],[experience_level],count(*) experience_level_per_job_title
from ds_salaries
group by [job_title],[experience_level]
order by 1;


--top 5 job_titles in data field exist in 2022
SELECT top 5 [job_title],count(*)
FROM ds_salaries
WHERE work_year=2022
group by [job_title]
order by 2 desc;
