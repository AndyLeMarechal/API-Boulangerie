-- Revert migrations:init from pg

BEGIN;


DROP TABLE "breads", "pastries", "breakfast_pastry","salty_side";

COMMIT;
