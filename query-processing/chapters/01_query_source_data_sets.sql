/*
CHALLENGE: Write a query to report animals and their vaccinations
- Include animal that have not been vaccinated
Show
- name, species, breed, primary color
- vaccination time and name
- staff first and last name and role

Use the minimal number of tables req
Use the corect logical join types with forced order where needed
*/
SELECT 
    a.name,
    a.species,
    a.breed,
    a.primary_color,
    v.vaccination_time,
    v.name,
    p.first_name,
    p.last_name,
    sa.role
FROM animals a
LEFT JOIN  (
    vaccinations v 
    JOIN staff_assignments sa
        ON v.email = sa.email
    JOIN persons p
        on sa.email = p.email
) ON a.name = v.name AND a.species = v.species;