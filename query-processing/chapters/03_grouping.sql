/*
Wirter a query to report the number of vaccinations 
each animlal received and include animals that were 
never vaccinated.
Exclude rabbits, rabies vaccines, and animals that 
were last vaccinated on or after October first, 2019
The report should show
- animal name and species
- color and breed
- number of vaccinations

Use correct logical join types and force order if needed
Use correct logical group by expressions
*/
select * from vaccinations limit 10;
select 
    a.name,
    a.species,
    a.primary_color,
    a.breed,
    count(v.vaccine) as num_of_vaccines,
	string_agg(v.vaccine, ', ')
from
    animals a
left join
    vaccinations v on a.name = v.name and a.species = v.species
where
    a.species <> 'Rabbit' 
    -- and v.vaccine <> 'Rabies' -- correction, this excludes null values too (non-vaccinated animals)
	and v.vaccine is distinct from 'Rabies' -- correction
	-- and v.vaccination_time < '2019-10-01' -- correction, moved to having, this removes the animal
group by a.name, a.species, a.primary_color, a.breed
having max(v.vaccination_time) < '2019-10-01' or max(v.vaccination_time) is null
order by name asc, species asc, num_of_vaccines desc

/* 
COMMENTS
- other option is to use a "dummy" agg function on breed and color
    - eg, MAX(primar_color)

- can't add <> on 'Rabies' because it will exclude animals not vaccinated (null)
/*
