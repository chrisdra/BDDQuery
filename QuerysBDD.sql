select o.country, o.city ,e.firstname, e.lastname, e.email 
from employees e, offices o 
where e.jobtitle = 'Sales Rep' 
and e.officecode = o.officecode
order by o.country, o.city ,e.firstname asc;

select customernumber, customername, creditlimit 
from customers 
where customername like '%Ltd%' 
order by creditlimit desc;

select e.employeenumber, e.firstname, e.lastname, count(*) as cartera
from employees e inner join customers c
on e.employeenumber = c.salesrepemployeenumber
group by c.salesrepemployeenumber, e.employeenumber, e.firstname, e.lastname
order by count(*) desc;

Select off.country, off.city, count(*) cantidad
FROM orders o, customers cu, employees em, offices off
where o.customernumber = cu.customernumber 
and em.employeenumber = cu.salesrepemployeenumber
and em.officecode = off.officecode
group by off.country, off.city
order by count(*) desc;

select c.customername, sum(ord.quantityordered * ord.priceeach) as SumaMontoOrdenes 
from customers c, orders o, orderdetails ord
where c.customernumber = o.customernumber 
and o.ordernumber = ord.ordernumber
and o.orderdate BETWEEN '01/01/04' and '31/12/2004'
group by c.customername 
order by SumaMontoOrdenes desc;