-- Revert migrations:Our_Bakery from pg

BEGIN;
DROP TABLE IF EXISTS "our_bakery";

COMMIT;
