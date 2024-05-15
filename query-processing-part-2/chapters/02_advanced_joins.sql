/*
Find purebred candidates of the 
same species and breed.
*/

select 
	a1.name, a1.species, a1.breed, a1.gender,
	a2.name, a2.species, a2.breed, a2.gender
from animals a1
join animals a2 on
	a1.breed = a2.breed and
	a1.gender > a2.gender and
	a1.name <> a2.name 
    -- should've added a predicate on species
order by a1.species, a1.breed;

-- while above is correct,
-- solution from video (below) has a cleaner presentation

select
    a1.species, a1.breed as breed, 
    a1.name as male, a2.name as female
from animals a1
join animals a2 on
	a1.species = a2.species and 
	a1.breed = a2.breed and
	a1.name <> a2.name and
	a1.gender > a2.gender 
order by a1.species, a1.breed;