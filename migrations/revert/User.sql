-- Revert migrations:User from pg

BEGIN;

DROP TABLE IF EXISTS "user" CASCADE;

COMMIT;
