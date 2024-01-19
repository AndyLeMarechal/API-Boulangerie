-- Deploy migrations:crud_function to pg

BEGIN;

CREATE OR REPLACE FUNCTION insert_pains("data" json) RETURNS pains AS $$

    INSERT INTO pains
    (
        title,
        description,
        img,
        price,
        mode_de_conservation,
        composition,
		valeurs_nutritionnelles,
		allergènes
    )
    VALUES
    (
        data->>'title',
        data->>'description',
        data->>'img',
        (data->>'price')::numeric,
        data->>'mode_de_conservation',
        data->>'composition',
		data->>'valeurs_nutritionnelles',
        data->>'allergènes'
    )
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION insert_pâtisserie("data" json) RETURNS pâtisserie AS $$

    INSERT INTO pâtisserie
    (
        title,
        description,
        img,
        price,
        mode_de_conservation,
        composition,
		valeurs_nutritionnelles,
		allergènes
    )
    VALUES
    (
        data->>'title',
        data->>'description',
        data->>'img',
        (data->>'price')::numeric,
        data->>'mode_de_conservation',
        data->>'composition',
		data->>'valeurs_nutritionnelles',
        data->>'allergènes'
    )
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION insert_viennoiserie("data" json) RETURNS viennoiserie AS $$

    INSERT INTO viennoiserie
    (
        title,
        description,
        img,
        price,
        mode_de_conservation,
        composition,
		valeurs_nutritionnelles,
		allergènes
    )
    VALUES
    (
        data->>'title',
        data->>'description',
        data->>'img',
        (data->>'price')::numeric,
        data->>'mode_de_conservation',
        data->>'composition',
		data->>'valeurs_nutritionnelles',
        data->>'allergènes'
    )
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION insert_côté_salé("data" json) RETURNS côté_salé AS $$

    INSERT INTO côté_salé
    (
        title,
        description,
        img,
        price,
        mode_de_conservation,
        composition,
		valeurs_nutritionnelles,
		allergènes
    )
    VALUES
    (
        data->>'title',
        data->>'description',
        data->>'img',
        (data->>'price')::numeric,
        data->>'mode_de_conservation',
        data->>'composition',
		data->>'valeurs_nutritionnelles',
        data->>'allergènes'
    )
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION updated_pains("data" json) RETURNS pains AS $$
	
	UPDATE pains
	SET
		title = COALESCE((data->>'title'),'title'),
        description = COALESCE((data->>'description'),'description'),
        img = COALESCE((data->>'img'),'img'),
        price = COALESCE((data->>'price')::numeric),
        mode_de_conservation = COALESCE((data->>'mode_de_conservation'),'mode_de_conservation'),
        composition = COALESCE((data->>'composition'),'composition'),
		valeurs_nutritionnelles = COALESCE((data->>'valeurs_nutritionnelles'),'valeurs_nutritionnelles'),
		allergènes = COALESCE((data->>'allergènes'),'allergènes'),
		updated_at = now()
	WHERE "id" = (data->>'id')::int
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION updated_pâtisserie("data" json) RETURNS pâtisserie AS $$
	
	UPDATE pâtisserie
	SET
		title = COALESCE((data->>'title'),'title'),
        description = COALESCE((data->>'description'),'description'),
        img = COALESCE((data->>'img'),'img'),
        price = COALESCE((data->>'price')::numeric),
        mode_de_conservation = COALESCE((data->>'mode_de_conservation'),'mode_de_conservation'),
        composition = COALESCE((data->>'composition'),'composition'),
		valeurs_nutritionnelles = COALESCE((data->>'valeurs_nutritionnelles'),'valeurs_nutritionnelles'),
		allergènes = COALESCE((data->>'allergènes'),'allergènes'),
		updated_at = now()
	WHERE "id" = (data->>'id')::int
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION updated_viennoiserie("data" json) RETURNS viennoiserie AS $$
	
	UPDATE viennoiserie
	SET
		title = COALESCE((data->>'title'),'title'),
        description = COALESCE((data->>'description'),'description'),
        img = COALESCE((data->>'img'),'img'),
        price = COALESCE((data->>'price')::numeric),
        mode_de_conservation = COALESCE((data->>'mode_de_conservation'),'mode_de_conservation'),
        composition = COALESCE((data->>'composition'),'composition'),
		valeurs_nutritionnelles = COALESCE((data->>'valeurs_nutritionnelles'),'valeurs_nutritionnelles'),
		allergènes = COALESCE((data->>'allergènes'),'allergènes'),
		updated_at = now()
	WHERE "id" = (data->>'id')::int
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION updated_côté_salé("data" json) RETURNS côté_salé AS $$
	
	UPDATE côté_salé
	SET
		title = COALESCE((data->>'title'),'title'),
        description = COALESCE((data->>'description'),'description'),
        img = COALESCE((data->>'img'),'img'),
        price = COALESCE((data->>'price')::numeric),
        mode_de_conservation = COALESCE((data->>'mode_de_conservation'),'mode_de_conservation'),
        composition = COALESCE((data->>'composition'),'composition'),
		valeurs_nutritionnelles = COALESCE((data->>'valeurs_nutritionnelles'),'valeurs_nutritionnelles'),
		allergènes = COALESCE((data->>'allergènes'),'allergènes'),
		updated_at = now()
	WHERE "id" = (data->>'id')::int
RETURNING *;
$$ LANGUAGE sql STRICT;

COMMIT;
