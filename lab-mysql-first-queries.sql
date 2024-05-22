USE lab_mysql;

SELECT * FROM applestore2;

-- 1. Which are the different genres?

SELECT DISTINCT(prime_genre)
FROM applestore2;

-- 2. Which is the genre with more apps rated?
SELECT prime_genre, SUM(rating_count_tot) as more_rated
FROM applestore2
GROUP BY prime_genre
ORDER BY more_rated DESC;


-- 3. Which is the genre with more apps?
SELECT prime_genre, COUNT(track_name) as num_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY num_apps DESC
LIMIT 1;


-- 4. Which is the one with less?
SELECT prime_genre, COUNT(track_name) as num_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY num_apps ASC
LIMIT 1;

-- 5. Take the 10 apps most rated.
SELECT track_name, SUM(rating_count_tot) as most_rated
FROM applestore2
GROUP BY track_name
ORDER BY most_rated DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.
SELECT track_name, MAX(user_rating) as rated_by_user
FROM applestore2
GROUP BY track_name
ORDER BY  rated_by_user DESC
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
/* In case with number 5 they are ranked by the sum and it's more fear and it's more precise to identify top 10*/


-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
/* In case with rating, we can choose max rating from all, but there a lot of apps with the same rating 5.0, so it's useless. High ratings might not always correlate with a large number of ratings, thus giving an incomplete picture of app popularity or reliability.


-- 9. Now compare the data from questions 5 and 6. What do you see?
It's different apps. Apps with the highest total ratings are popular and widely used, but not necessarily the best-rated. Conversely, apps with the highest ratings might have fewer total ratings, making them less popular despite high user satisfaction.

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes? */
SELECT track_name, AVG(user_rating) as avg_user_rating, SUM(rating_count_tot) as total_ratings
FROM applestore2
GROUP BY track_name
ORDER BY avg_user_rating DESC, total_ratings DESC
LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

/* I think in order to analyze it we can compare rating paid apps and free 
First we can see that more apps are free, and users use them more often then paid one, but paid apps have higher rating:*/

SELECT price, SUM(rating_count_tot) as total_ratings, AVG(user_rating) as avg_ratings
FROM applestore2
GROUP BY price
ORDER BY price;
