-- Revert migrations:function_our_bakery from pg

BEGIN;

DROP FUNCTION insert_our_bakery;
DROP FUNCTION updated_our_bakery;

COMMIT;
