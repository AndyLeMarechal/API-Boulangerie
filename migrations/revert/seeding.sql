-- Revert migrations:seeding from pg

BEGIN;

TRUNCATE "breads";
TRUNCATE "pastries";
TRUNCATE "breakfast_pastry";
TRUNCATE "salty_side";
COMMIT;
