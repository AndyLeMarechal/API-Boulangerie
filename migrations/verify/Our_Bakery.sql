-- Verify migrations:Our_Bakery on pg

BEGIN;

SELECT * FROM "our_bakery";

ROLLBACK;
