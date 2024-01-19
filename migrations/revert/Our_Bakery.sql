-- Revert migrations:Our_Bakery from pg

BEGIN;
DROP TABLE "our_bakery" CASCADE;

COMMIT;
