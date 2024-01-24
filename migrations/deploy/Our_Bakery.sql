-- Deploy migrations:Our_Bakery to pg

BEGIN;

CREATE TABLE "our_bakery" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL ,
    "img" TEXT,
    "hourly" TEXT,
    "city" TEXT,
    "address" TEXT,
    "zip_code" text NOT NULL CHECK(
    "zip_code" ~ '^0[1-9]\d{3}$' -- code postaux (métropole) de 01 à 09
    OR "zip_code" ~ '^[1-8]\d{4}$' -- code postaux (métropole) de 10 à 89
    OR "zip_code" ~ '^9[0-59]\d{3}$' -- code postaux  (métropole) de 90 à 95 + La poste et les Jeu concours
    OR "zip_code" ~ '^97[1-8]\d{2}$' -- DOM
    OR "zip_code" ~ '^98[046-9]\d{2}$' -- TOM + monaco
    OR "zip_code" ~ '^00000$'),
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz 
);

COMMIT;
