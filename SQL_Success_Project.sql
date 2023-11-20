Select * from project.dataset1;
select * from project.dataset2;

-- 1. How Many number of Rows present into our both dataset?
use project
select count(*) from dataset1;
select count(*) from dataset2;
select count(*) from project.dataset1; ##Both ways of getting number of rows are correct.

-- 2. Can you show us the complete data for two states Jharkhand and Bihar only?
Select * from dataset1 
where state in("Jharkhand", "Bihar");

-- 3. Calculate the population of India? Population saved as text in the dataset2. so need to convert first to integer.alter

select * from project.dataset2;
select sum(Population) from project.dataset2;

-- 4. Average Growth of India
select * from project.dataset1;
select avg(Growth) as AVG_Growth from project.dataset1;

-- 5. Calcualate average Growth as per each and every state of india?
select state, sum(Population) from project.dataset2 group by state;
select state, avg(Growth) as Avg_Growth from project.dataset1 group by state;

-- 6. Average sex-ratio as per state or some more examples like that.
select state, round(avg(Sex_Ratio)) as avg_sex_ratio from project.dataset1 group by state order by avg_sex_ratio asc;
select state, round(avg(Sex_Ratio)) as avg_sex_ratio from project.dataset1 group by state order by avg_sex_ratio desc;

-- 7. Now pls calcualte the average literacy rate
select state, round(avg(Literacy)) as Literacy from project.dataset1 group by state order by Literacy desc;
select state, round(avg(Literacy),0) as Literacy from project.dataset1
group by state having avg(Literacy)>90;

-- 8. Top three highest Growth ration statewise.
select state, avg(growth) as AVG_Growth from project.dataset1
group by state order by avg(growth) desc limit 3;

-- 9. Bottom 3 states showing lowest growth ratio
select state, avg(growth) as AVG_Growth from project.dataset1
group by state order by avg(growth) asc limit 3;

-- 10. top and bottom 3 states in Literacy rate.

drop table if exists topstates;
create table topstates(
state varchar(255),
tpstate float);

insert into topstates(
select state, round(avg(Literacy),0) as AVG_Literacy from project.dataset1
group by state order by avg(Literacy) asc limit 5);

SELECT * FROM project.topstates order by state desc limit 3;

drop table if exists bottostates;
create table bottomstates(
state varchar(255),
btstate float);

insert into bottomstates(
select state, avg(Literacy) as AVG_Literacy from project.dataset1
group by state order by avg(Literacy) asc);

SELECT * FROM project.bottomstates order by state asc limit 3;

-- Union Operators
select * from (
SELECT * FROM project.topstates order by state desc limit 3) a

union

select * from (
SELECT * FROM project.bottomstates order by state asc limit 3) b;

-- states starting start with letter a
select distinctrow state from project.dataset1 where lower(state) like 'a%';

-- states starting start with letter a and b
select distinctrow state from project.dataset1 where lower(state) like 'a%' or lower(state) like "b%";

-- states starting start with letter a and end with m
select distinctrow state from project.dataset1 where lower(state) like 'a%' and lower(state) like "%m";













