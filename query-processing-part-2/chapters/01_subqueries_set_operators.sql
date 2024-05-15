/*
Show which breeds were never adopted.
*/

-- 1) query which breeds were adopted, 
-- 2) use (1) as the except
select 
	species, breed -- solution: I forgot to include species
from 
	animals
where breed is not null -- solution: does not include this
except
-- breeds that were adopted
select 
	an.species, an.breed -- solution: forgot species
from animals an
join adoptions ad
	on ad.name = an.name and ad.species = an.species;