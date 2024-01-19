-- Deploy migrations:function_our_bakery to pg

BEGIN;

CREATE OR REPLACE FUNCTION insert_our_bakery("data" json) RETURNS our_bakery AS $$

    INSERT INTO our_bakery
    (
        title,
        description,
        img,
        hourly,
        city,
        address,
		zip_code
    )
    VALUES
    (
        data->>'title',
        data->>'description',
        data->>'img',
        data->>'hourly',
        data->>'city',
        data->>'address',
		data->>'zip_code'
    )
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION updated_our_bakery("data" json) RETURNS our_bakery AS $$
	
	UPDATE our_bakery
	SET
		title = COALESCE((data->>'title'),title),
        description = COALESCE((data->>'description'),description),
        img = COALESCE((data->>'img'),img),
        hourly = COALESCE((data->>'hourly'),hourly),
        city = COALESCE((data->>'city'),city),
        address = COALESCE((data->>'address'),address),
		zip_code = COALESCE((data->>'zip_code'),zip_code),
		updated_at = now()
	WHERE "id" = (data->>'id')::int
RETURNING *;
$$ LANGUAGE sql STRICT;

COMMIT;
