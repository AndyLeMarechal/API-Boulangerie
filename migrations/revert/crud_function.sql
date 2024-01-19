-- Revert migrations:crud_function from pg

BEGIN;

DROP FUNCTION insert_breads;

DROP FUNCTION updated_breads;

DROP FUNCTION insert_pastries;

DROP FUNCTION updated_pastries;

DROP FUNCTION insert_breakfast_pastry;

DROP FUNCTION updated_breakfast_pastry;

DROP FUNCTION insert_salty_side;

DROP FUNCTION updated_salty_side;

COMMIT;
