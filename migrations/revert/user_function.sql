-- Revert migrations:user_function from pg

BEGIN;

TRUNCATE insert_user;
TRUNCATE updated_user;

COMMIT;
