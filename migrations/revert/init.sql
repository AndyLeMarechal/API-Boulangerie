-- Revert migrations:init from pg

BEGIN;

DROP TABLE "pains", "pâtisserie", "viennoiserie","côté salé";

COMMIT;
