-- Verify migrations:init on pg

BEGIN;
SELECT * FROM "pains";
SELECT * FROM "pâtisserie";
SELECT * FROM "viennoiserie";
SELECT * FROM "côté salé";

ROLLBACK;
