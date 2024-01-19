-- Revert migrations:seeding_Our_Bakery from pg

BEGIN;

TRUNCATE "our_bakery";

COMMIT;
