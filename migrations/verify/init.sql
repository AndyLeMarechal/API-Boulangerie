-- Verify migrations:init on pg

BEGIN;
SELECT * FROM "breads";
SELECT * FROM "pastries";
SELECT * FROM "breakfast_pastry";
SELECT * FROM "salty_side";

ROLLBACK;
