create table hospital(
	patient_id int8 primary key,
	first_name varchar(50),
	last_name varchar(50),
	birthdate date,
	gender varchar(50),
	race varchar(100),
	department	varchar(50),
	jobtitle varchar(50),
	loc varchar(50),
	hire_date date,
	termdate date,
	location_city varchar(50),
	location_state varchar(50)
)

ALTER TABLE hospital ALTER COLUMN patient_id TYPE VARCHAR;

select *  from hospital

alter table hospital add column age int
update hospital
set age = date_part('year',age(birthdate))

select min(age) as youngest,
max(age) as oldest from hospital
