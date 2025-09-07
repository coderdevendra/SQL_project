
create table Hospital_Data(
Hospital_Name varchar(50),
Location varchar(50),
Department varchar(20),
Doctors_Count int,
Patients_Count int,
Admission_Date varchar(50),
Discharge_Date varchar(50),
Medical_Expenses numeric(10,2)
);
drop table hospital_data;

select*from Hospital_Data;

copy 
Hospital_Data(Hospital_Name ,location, Department, Doctors_Count	,Patients_Count,	Admission_Date,	Discharge_Date,	Medical_Expenses)
from 'C:\B.Tech CSE(AI&ML)\Data Anlytics\SQL\Hospital_Data.csv'
csv header;


-- 1. Total Number of Patients

SELECT sum(patients_count) AS total_patients
FROM Hospital_Data;

-- 2.  Average Number of Doctors per Hospital 

SELECT Hospital_Name,AVG(Doctors_Count) AS avg_doctors 
FROM Hospital_Data
GROUP BY  Hospital_Name;

-- Top 3 Departments with the Highest Number of Patients 

select department, sum(patients_count) AS total_patients
from Hospital_Data
group by Department
order by 
 total_patients desc
 limit 3;


 -- 4. Hospital with the Maximum Medical Expenses


SELECT 
Hospital_Name, Location, Department, Medical_Expenses
FROM 
    Hospital_Data
ORDER BY 
    Medical_Expenses DESC
LIMIT 1;



 --5. Daily Average Medical Expenses 

select   Hospital_Name, 
 avg(Medical_Expenses) as avg_medical_exp
from 
	Hospital_data
group by 
	Hospital_Name
order by 
	 avg_medical_exp asc;


 --6. Longest Hospital Stay 
--  Find the patient with the longest stay by calculating  the difference 
--  between  Discharge Date and Admission Date. 

select Hospital_Name,location,SUM(discharge_date - admission_date) as stay_days
from Hospital_Data
group by Hospital_Name,location
order by stay_days desc;


-- 7.  Total Patients Treated Per City

select Location as City, sum(patients_count) AS total_patients_treated
from Hospital_Data
group by City ;

--8. Average Length of Stay Per Department 
select department, avg(discharge_date - admission_date) as avg_days_spend 
from Hospital_Data 
group by department; 



-- 9. Identify the Department with the Lowest  Number of Patients 


SELECT department, SUM(patients_count) AS lowest_patients
FROM Hospital_Data
GROUP BY department
ORDER BY lowest_patients asc
LIMIT 1;


-- 10. Monthly Medical Expenses Report 

select  extract( month from admission_date) as month ,sum(medical_expenses) as total_expenses
from Hospital_Data
group by extract( month from admission_date)
order by  month ;










