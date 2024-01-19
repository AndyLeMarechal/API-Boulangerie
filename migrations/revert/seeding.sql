-- Revert migrations:seeding from pg

BEGIN;

TRUNCATE "pains";
TRUNCATE "pâtisserie";
TRUNCATE "viennoiserie";
TRUNCATE "côté_salé";
COMMIT;
