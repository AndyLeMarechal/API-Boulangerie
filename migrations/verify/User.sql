-- Verify migrations:User on pg

BEGIN;

SELECT * FROM "user";

ROLLBACK;
