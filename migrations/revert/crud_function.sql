-- Revert migrations:crud_function from pg

BEGIN;

DROP FUNCTION insert_pains;

DROP FUNCTION updated_pains;

DROP FUNCTION insert_pâtisserie;

DROP FUNCTION updated_pâtisserie;

DROP FUNCTION insert_viennoiserie;

DROP FUNCTION updated_viennoiserie;

DROP FUNCTION insert_côté_salé;

DROP FUNCTION updated_côté_salé;

COMMIT;
