-- Revert migrations:seeding_User from pg

BEGIN;

TRUNCATE "user";

COMMIT;
