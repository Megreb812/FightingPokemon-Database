INSERT INTO pokemon_types
(pokemonId,typeid)
VALUES
((SELECT pokemonId
FROM pokemon
WHERE pokemonId NOT IN(
    SELECT pokemonId FROM pokemon 
    JOIN pokemon_types
    USING(pokemonId)
)
ORDER BY RANDOM() LIMIT 1),
(SELECT typeId FROM types ORDER BY RANDOM() LIMIT 1)
);

SELECT * FROM pokemon_types;