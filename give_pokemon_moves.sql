INSERT INTO pokemon_moves
(pokemonId,moveId)
VALUES
((SELECT pokemonId
FROM pokemon
WHERE pokemonId NOT IN(
    SELECT pokemonId FROM pokemon 
    JOIN pokemon_moves
    USING(pokemonId)
)
ORDER BY RANDOM() LIMIT 1),
(SELECT moveId FROM moves ORDER BY RANDOM() LIMIT 1)
);

SELECT * FROM pokemon_moves;