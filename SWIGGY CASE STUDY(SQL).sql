use swiggy;

SELECT * FROM swiggy.swiggy_1;

#Q1: HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?

select count(distinct restaurant_name) as high_rated_restaurant from swiggy_1
where rating > 4.5;

#Q2: WHICH CITY HAS THE MAXIMUM NUMBER OF RESTAURANTS?

select city,count( distinct restaurant_name) as total_restaurant from swiggy_1
group by city
order by total_restaurant desc
limit 1;

#Q3: HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAMES?

  select count(distinct restaurant_name) as PIZZA_restaurant from swiggy_1
  where restaurant_name like"%Pizza%";
  
#Q4: WHAT IS THE MOST COMMON CUISINE AMONG ALL THE RESTAURANTS IN THE DATASET?
  
  select cuisine,count(*) as most_ordered from swiggy_1
  group by cuisine
  order by most_ordered desc
  limit 1;
  
#Q5: WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?

select city,round(avg(rating)) from swiggy_1
group by city;

#Q6:WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE "RECOMMENDED" MENU CATEGORY FOR EACH RESTAURANT?

select distinct restaurant_name, menu_category, max(price) from swiggy_1
where menu_category="Recommended"
group by restaurant_name,menu_category;

#Q7:FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE?

select distinct restaurant_name,cost_per_person from swiggy_1
where cuisine <>"Indian"
order by cost_per_person desc
limit 5;

#Q8:FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL THE RESTAURANTS TOGETHER?

select distinct restaurant_name,cost_per_person from swiggy_1
where cost_per_person> (select avg(cost_per_person) from swiggy_1);

#Q9 RETRIEVE THE DETAILS OF THE RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES?

select distinct t1.restaurant_name,t1.city,t2.city
from swiggy_1 t1 join swiggy_1 t2
on t1.restaurant_name=t2.restaurant_name and
t1.city<>t2.city;

#Q10: WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE "MAIN COURSE" CATEGORY?

select distinct restaurant_name,menu_category,count(item) as total_items from swiggy_1
where menu_category = "Main course" 
group  by restaurant_name,menu_category
order by total_items desc
limit 1;

#Q11: LIST THE NAME OF RESTAURANTS THAT ARE 100% VEGETARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME

select distinct restaurant_name,
(count(case when veg_or_non-veg="Veg" then 1 end)*100/
count(*)) as vegetarian_percetage
from swiggy_1
group by restaurant_name
having vegetarian_percetage=100.00
order by restaurant_name;

#Q12:WHICH IS THE RESTAURANT PROVIDING LOWEST AVERAGE PRICE OF ALL ITEMS?

select distinct restaurant_name,avg(price) as average_price
from swiggy_1
 group by restaurant_name
order by average_price limit 1;

#Q13: WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?

select distinct restaurant_name,
count(distinct menu_category) as no_of_categories
from swiggy_1
group by restaurant_name
order by no_of_categories desc limit 5;

#Q14: WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEG FOOD?

select distinct restaurant_name,
(count(case when 'veg_or_non-veg'='Non-veg' then 1 end)*100
/count(*)) as nonvegetarian_percentage
from swiggy_1
group by restaurant_name
order by nonvegetarian_percentage DESC limit 1;








  
  