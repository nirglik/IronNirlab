use sakila;
#In this lab, you will be using the Sakila database of movie rentals. If you need to get the data again, refer to the official installation link.
#The database is structured as follows:
#Instructions
# 1. Which actor has appeared in the most films?
#Hint: group by actor_id
select first_name, last_name, count(film_id) from actor
join film_actor using (actor_id)
group by actor_id
order by count(film_id) desc;
#Answer: Gina Degeneres
# 2. Most active customer (the customer that has rented the most number of films)
select first_name, last_name, count(customer_id) from customer
join rental using (customer_id)
group by customer_id
order by count(customer_id) desc;
#Answer: Eleanor Hunt
# 3. List number of films per category.
select name, count(film_id) from film_category
join category using (category_id)
group by name;
# 4. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff
join address using (address_id);
# 5. get film titles where the film language is either English or Italian, and whose titles starts with letter “M” , sorted by title descending.
select title, name from film
join language using (language_id)
where title like “M%”
order by title desc;
# 6. Display the total amount rung up by each staff member in August of 2005.
select first_name, last_name, sum(amount) from payment
join staff using (staff_id)
WHERE payment_date BETWEEN ‘2005-08-01’ AND ‘2005-08-31’
group by first_name, last_name
order by sum(amount) desc;
# 7. List each film and the number of actors who are listed for that film.
select title, count(actor_id) from film_actor
join film using (film_id)
group by title
order by count(actor_id) desc;
# 8. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select first_name, last_name, sum(amount) from payment
join customer using (customer_id)
group by customer_id
order by last_name;
# 9. Write sql statement to check if you can find any actor who never particiapted in any film.
select film_id, actor_id from film
join film_actor using (film_id)
where actor_id is NULL;
# 10. get the addresses that has NO customers, and ends with the letter “e”.
select address from address
left join customer using (address_id)
WHERE address like “%e” and customer_id is Null;
# Optional - Optional: what is the most rented film?
#The answer is “Bucket Brotherhood” .
#This query might require using more than one join statement. Give it a try.