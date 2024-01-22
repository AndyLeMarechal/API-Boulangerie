-- Deploy migrations:user_function to pg

BEGIN;

CREATE OR REPLACE FUNCTION insert_user("data" json) RETURNS "user" AS $$

    INSERT INTO "user"
    (
        username,
        email,
        password,
		firstname,
        lastname,
        address,
        role
    )
    VALUES
    (
        data->>'username',
        data->>'email',
        data->>'password',
        data->>'firstname',
        data->>'lastname',
        data->>'address',
		data->>'role'
    )
RETURNING *;
$$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION updated_user("data" json) RETURNS "user" AS $$
	
	UPDATE "user"
	SET
		username = COALESCE((data->>'username'),username),
        email = COALESCE((data->>'email'),email),
        password = COALESCE((data->>'password'),password),
        firstname = COALESCE((data->>'firstname'),firstname),
        lastname = COALESCE((data->>'lastname'),lastname),
        address = COALESCE((data->>'address'),address),
		role = COALESCE((data->>'role'),role),
		updated_at = now()
	WHERE "id" = (data->>'id')::int
RETURNING *;
$$ LANGUAGE sql STRICT;

COMMIT;
