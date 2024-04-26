/*
Write a query using RANK or DENSE_RANK that
returns the registration information for the 
- first three conference attendee that registered from each state
*/
WITH ranked_ AS (
    SELECT
	    *,
	    RANK() OVER (PARTITION BY state ORDER BY  registration_date ASC) as rank,
		DENSE_RANK() OVER (PARTITION BY state ORDER BY  registration_date ASC) as dense_rank
	FROM
	    convention_attendees
	ORDER BY state
)

SELECT * FROM ranked_ WHERE dense_rank BETWEEN 1 AND 3;
