-- Deploy migrations:crud_function to pg

BEGIN;

CREATE OR REPLACE FUNCTION insert_breads("data" json) RETURNS breads AS $$

    INSERT INTO breads
    (
        title,
        description,
        img,
        price,
        method_of_conservation,
        composition,
		nutritional_values,
		allergens
    )
    VALUES
    (
        data->>'title',
        data->>'description',
        data->>'img',
        (data->>'price')::numeric,
        data->>'method_of_conservation',
        data->>'composition',
		data->>'nutritional_values',
        data->>'allergens'
    )
RETURNING *;
$$ LANGUAGE sql STRICT;


CREATE OR REPLACE FUNCTION updated_breads("data" json) RETURNS breads AS $$
	
	UPDATE breads
	SET
		title = COALESCE((data->>'title'), title),
        description = COALESCE((data->>'description'), description),
        img = COALESCE((data->>'img'), img),
        price = COALESCE((data->>'price')::numeric, price),
        method_of_conservation = COALESCE((data->>'method_of_conservation'), method_of_conservation),
        composition = COALESCE((data->>'composition'), composition),
		nutritional_values = COALESCE((data->>'nutritional_values'), nutritional_values),
		allergens = COALESCE((data->>'allergens'), allergens),
		updated_at = now()
	WHERE "id" = (data->>'id')::int
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION insert_pastries("data" json) RETURNS pastries AS $$

    INSERT INTO pastries
    (
        title,
        description,
        img,
        price,
        method_of_conservation,
        composition,
		nutritional_values,
		allergens
    )
    VALUES
    (
        data->>'title',
        data->>'description',
        data->>'img',
        (data->>'price')::numeric,
        data->>'method_of_conservation',
        data->>'composition',
		data->>'nutritional_values',
        data->>'allergens'
    )
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION insert_breakfast_pastry("data" json) RETURNS breakfast_pastry AS $$

    INSERT INTO breakfast_pastry
    (
        title,
        description,
        img,
        price,
        method_of_conservation,
        composition,
		nutritional_values,
		allergens
    )
    VALUES
    (
        data->>'title',
        data->>'description',
        data->>'img',
        (data->>'price')::numeric,
        data->>'method_of_conservation',
        data->>'composition',
		data->>'nutritional_values',
        data->>'allergens'
    )
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION insert_salty_side("data" json) RETURNS salty_side AS $$

    INSERT INTO salty_side
    (
        title,
        description,
        img,
        price,
        method_of_conservation,
        composition,
		nutritional_values,
		allergens
    )
    VALUES
    (
        data->>'title',
        data->>'description',
        data->>'img',
        (data->>'price')::numeric,
        data->>'method_of_conservation',
        data->>'composition',
		data->>'nutritional_values',
        data->>'allergens'
    )
RETURNING *;
$$ LANGUAGE sql STRICT;


CREATE OR REPLACE FUNCTION updated_pastries("data" json) RETURNS pastries AS $$
	
	UPDATE pastries
	SET
		title = COALESCE((data->>'title'), title),
        description = COALESCE((data->>'description'), description),
        img = COALESCE((data->>'img'), img),
        price = COALESCE((data->>'price')::numeric, price),
        method_of_conservation = COALESCE((data->>'method_of_conservation'), method_of_conservation),
        composition = COALESCE((data->>'composition'), composition),
		nutritional_values = COALESCE((data->>'nutritional_values'), nutritional_values),
		allergens = COALESCE((data->>'allergens'), allergens),
		updated_at = now()
	WHERE "id" = (data->>'id')::int
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION updated_breakfast_pastry("data" json) RETURNS breakfast_pastry AS $$
	
	UPDATE breakfast_pastry
	SET
		title = COALESCE((data->>'title'), title),
        description = COALESCE((data->>'description'), description),
        img = COALESCE((data->>'img'), img),
        price = COALESCE((data->>'price')::numeric, price),
        method_of_conservation = COALESCE((data->>'method_of_conservation'), method_of_conservation),
        composition = COALESCE((data->>'composition'), composition),
		nutritional_values = COALESCE((data->>'nutritional_values'), nutritional_values),
		allergens = COALESCE((data->>'allergens'), allergens),
		updated_at = now()
	WHERE "id" = (data->>'id')::int
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION updated_salty_side("data" json) RETURNS salty_side AS $$
	
	UPDATE salty_side
	SET
		title = COALESCE((data->>'title'), title),
        description = COALESCE((data->>'description'), description),
        img = COALESCE((data->>'img'), img),
        price = COALESCE((data->>'price')::numeric, price),
        method_of_conservation = COALESCE((data->>'method_of_conservation'), method_of_conservation),
        composition = COALESCE((data->>'composition'), composition),
		nutritional_values = COALESCE((data->>'nutritional_values'), nutritional_values),
		allergens = COALESCE((data->>'allergens'), allergens),
		updated_at = now()
	WHERE "id" = (data->>'id')::int
RETURNING *;
$$ LANGUAGE sql STRICT;

COMMIT;
