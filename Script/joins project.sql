-- ** Movie Database project. See the file movies_erd for table\column info. **

-- 1. Give the name, release year, and worldwide gross of the lowest grossing movie.
-- SELECT s.film_title, s.release_year, r.worldwide_gross
-- FROM specs AS s
-- LEFT JOIN revenue AS r
-- ON (s.movie_id = r.movie_id)
-- ORDER BY r.worldwide_gross
-- LIMIT 1;

-- Answer: Semi-Tough, Release Year = 1977, Worldwide Gross = $37,187,139

-- 2. What year has the highest average imdb rating?
-- SELECT s.release_year, AVG(r.imdb_rating) AS avg_imdb_rating
-- FROM specs AS s
-- LEFT JOIN rating AS r
-- ON s.movie_id = r.movie_id
-- GROUP BY s.release_year
-- ORDER BY avg_imdb_rating DESC
-- LIMIT 1;

--Answer: 1991 - AVG IMDB rating = 7.45

-- 3. What is the highest grossing G-rated movie? Which company distributed it?
-- SELECT s.film_title, d.company_name, r.worldwide_gross
-- FROM specs AS s
-- LEFT JOIN revenue AS r
-- USING (movie_id)
-- LEFT JOIN distributors AS d
-- ON s.domestic_distributor_id = d.distributor_id
-- WHERE mpaa_rating ='G'
-- ORDER BY r.worldwide_gross DESC
-- LIMIT 1;

--ANSWER: Toy Story 4 - Walt Disney - Worldwide_gross = 1073394593

-- 4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that 
-- distributor in the movies table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.
-- SELECT d.company_name, COUNT(s.film_title) AS count_movies_created
-- FROM distributors AS d
-- LEFT JOIN specs AS s
-- ON d.distributor_id = s.domestic_distributor_id
-- GROUP BY d.company_name
-- ORDER BY COUNT(s.film_title) DESC;

-- 5. Write a query that returns the five distributors with the highest average movie budget.
-- SELECT d.company_name, AVG(r.film_budget) AS avg_movie_budget
-- FROM distributors AS d
-- INNER JOIN specs AS s
-- ON d.distributor_id = s.domestic_distributor_id
-- INNER JOIN revenue AS r
-- USING(movie_id)
-- WHERE r.film_budget IS NOT NULL
-- GROUP BY d.company_name
-- ORDER BY AVG(r.film_budget) DESC
-- LIMIT 5;

--ANSWER: Walt Disney, Sony Pictures, Lionsgate, Dreamworks, and Warner Bros.

-- 6. How many movies in the dataset are distributed by a company which is not headquartered in California? 
-- Which of these movies has the highest imdb rating?
-- SELECT d.company_name, d.headquarters, s.film_title, r.imdb_rating
-- FROM distributors AS d
-- LEFT JOIN specs AS s
-- ON d.distributor_id = s.domestic_distributor_id
-- INNER JOIN rating AS r
-- USING (movie_id)
-- WHERE d.headquarters NOT ILIKE '%CA'
-- ORDER BY r.imdb_rating DESC;

--ANSWER: Vestron Pictures - Chicago, Illanois - Dirty Dancing - imdb_rating = 7

-- 7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?
-- SELECT (s.length_in_min / 60) AS length_in_hours, ROUND(AVG(r.imdb_Rating),2) AS avg_rating
-- FROM specs AS s
-- INNER JOIN rating AS r
-- USING (movie_id)
-- GROUP BY length_in_hours
-- ORDER BY avg_rating DESC;

--ANSWER: Over 2 hours


