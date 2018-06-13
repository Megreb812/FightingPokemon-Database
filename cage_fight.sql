SELECT 
pokemon1.pokemonName AS "pokemon1Name",
pokemon1.moveName AS "pokemon1MoveName",
pokemon1.power AS "pokemon1MovePower",
pokemon2.pokemonName AS "pokemon2Name",
pokemon2.moveName AS "pokemon2MoveName",
pokemon2.power AS "pokemon2MovePower",
attack1.multiplier,
attack2.multiplier,
pokemon1.power * attack1.multiplier AS "pokemon1Power",
pokemon2.power * attack2.multiplier AS "pokemon2Power",
CASE 
    WHEN pokemon1.power * attack1.multiplier > pokemon2.power * attack2.multiplier
    THEN pokemon1.pokemonName || " wins"
    WHEN pokemon1.power * attack1.multiplier < pokemon2.power * attack2.multiplier
    THEN pokemon2.pokemonName || " wins"
    ELSE "TIE"
END AS "Result"
FROM pokedex AS pokemon1
JOIN pokedex AS pokemon2
ON pokemon1.pokemonId != pokemon2.pokemonId

JOIN battle AS attack1
ON (attack1.attackTypeId = pokemon1.typeId 
AND attack1.defenseTypeId = pokemon2.typeId)

JOIN battle AS attack2
ON (attack2.attackTypeId = pokemon2.typeId
AND attack2.defenseTypeId = pokemon1.typeId)

WHERE pokemon1.pokemonId = (SELECT pokemonId FROM pokemon ORDER BY RANDOM() LIMIT 1)
ORDER BY RANDOM() LIMIT 1;