 create database swiggy_diwali;

create table pre_diwali
(
DT  char(100),
ID int,
City int,
NAME char(100),
ITEM_ID int,
ITEM_NAME char(100),
HR_of_the_day int,
ORDERS	int,
QTY int,
ITEM_GMV int,
CATEGORY char(100)
);
create table post_diwali
(
DT	char(100),
ID	int,
City int,
NAME	 char(100),
ITEM_ID	 int,
ITEM_NAME	 char(100),
Hour_of_the_day int,
ORDERS	 int,
QTY	 int,
ITEM_GMV	 int,
CATEGORY char(100)
);

select * from pre_diwali;  
select * from post_diwali;
/*how many category are there in pre_diwali ?*/
select distinct category
from pre_diwali;
/*how many category are their in post diwali*/
select distinct category 
from post_diwali;

/*how many items sold by guptabrothers */
select id,item_name,name, dt, count(qty)
from pre_diwali
where name='Gupta Brothers -Ballygunge' 
group by item_name
order by qty;
/*post_diwali*/
select id,item_name,name, dt, count(qty)
from post_diwali
where name='Gupta Brothers -Ballygunge' 
group by item_name
order by qty;
/*average revenue quantity*/
select item_name,avg(qty)as revenue
from pre_diwali
group by  ITEM_NAME
order by 2 desc
limit 5;
/*average revenue quantity*/
select item_name,avg(qty)as revenue
from post_diwali
group by  ITEM_NAME
order by 2 desc
limit 5;

/*which item doesn't sold in post diwali */
select item_name,  category
from pre_diwali
where ITEM_NAME not in(select item_name from post_diwali);

/*item_name that are in both */
select item_name,  category
from pre_diwali
where ITEM_NAME  in(select item_name from post_diwali);

/*shows all the item_name from both table doesn't remove duplicate ones*/
select item_name
from pre_diwali
union all
select item_name
from post_diwali;
/*item_names that are any of the two table or all are in pre or post table or both*/
select item_name
from pre_diwali
union 
select item_name
from post_diwali;
/*category Quick Bites exists or not*/
select item_name,category,name
from pre_diwali
where CATEGORY='Quick Bites' and exists(select item_name,category from pre_diwali where CATEGORY='Quick Bites' and name='SHREE CHAPPAN BHOG');

select city, item_name, name
from post_diwali
where city='10459';

/*if there is any new city deliver on post diwali*/
select city
from post_diwali
where city not in(select city from pre_diwali);

/*items that are oders morethan 15 times  and hr_of_the_day between 10 to 15 on pre_diwali*/
select item_name,orders, qty,HR_of_the_day,name
from pre_diwali
where orders>15 and HR_of_the_day between 10 and 15;

/*items that are oders morethan 15 times  and hr_of_the_day between 10 to 15 on post_diwali*/
select item_name,orders, qty,Hour_of_the_day,name
from post_diwali
where orders>15 and Hour_of_the_day between 10 and 15 
order by 2 desc;
/*maximum items orders on post diwali*/
select item_name,max(orders) as maximum_orders
from post_diwali;

/*maximum order on pre_diwali*/
select item_name, max(orders)
from pre_diwali;
/*less order on pre_diwali*/
select item_name , min(orders)
from pre_diwali;
/*less order on post_diwali*/
select item_name, min(orders)
from post_diwali;
/*new items that was not pre_diwali*/
select item_name
from post_diwali
where ITEM_NAME not in(select item_name from pre_diwali);
/*how many times Chola Batura ordered on pre_diwali*/
select item_name,count(item_name)
from pre_diwali
where item_name='Chola Batura';
/*how many times chola bhatura oredered in post diwali*/
select item_name,count(item_name)
from post_diwali
where item_name='Chola Batura';
/*city that gives ordes more than 30 times on pre_diwali*/
select city,item_name,count(orders)  as total_number_of_orders
from pre_diwali
where orders>30;
/*city that gives ordes more than 30 times on post_diwali*/
select city,item_name,count(orders)  as total_number_of_orders
from post_diwali
where orders>30;
/*item_gmv>1000 that item_name on pre diwali*/
select item_name,item_gmv
from pre_diwali
where ITEM_GMV>1000;

/*item_gmv>1000 that item_name on post diwali*/
SELECT 
    item_name, item_gmv
FROM
    post_diwali
WHERE
    ITEM_GMV > 1000;

/*items order by Bhikharam Chandmal*/
select distinct item_name,name
from pre_diwali
where name='Bhikharam Chandmal';
/*bhikharam doesn't oreder the items in post diwali*/
select distinct item_name,name
from pre_diwali
where name='Bhikharam Chandmal'and ITEM_NAME not in(select distinct item_name from post_diwali);
/*items that are not sold on pre_diwali but sold on post_diwali*/
select distinct item_name 
from pre_diwali
where item_name not in (select distinct ITEM_NAME from post_diwali);
/*same item on pre and post diwali*/
select distinct item_name
from pre_diwali
where item_name in(select distinct item_name from post_diwali);
/*new shop name on post diwali*/
select distinct  name
from post_diwali
where name not in (select distinct name from pre_diwali);
/*new shop name on pre diwali*/
select distinct  name
from pre_diwali
where name not in (select distinct name from post_diwali);
















