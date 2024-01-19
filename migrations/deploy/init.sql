-- Deploy migrations:init to pg

BEGIN;


CREATE TABLE "pains" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL UNIQUE,
    "img" TEXT,
    "price" numeric NOT NULL,
    "mode_de_conservation" text NOT NULL UNIQUE,
    "composition" text NOT NULL UNIQUE,
    "valeurs_nutritionnelles" text NOT NULL UNIQUE,
    "allergènes" text NOT NULL UNIQUE,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz 
);

CREATE TABLE "pâtisserie" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL UNIQUE,
    "img" TEXT,
    "price" numeric NOT NULL,
    "mode_de_conservation" text NOT NULL UNIQUE,
    "composition" text NOT NULL UNIQUE,
    "valeurs_nutritionnelles" text NOT NULL UNIQUE,
    "allergènes" text NOT NULL UNIQUE,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz 
);

CREATE TABLE "viennoiserie" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL UNIQUE,
    "img" TEXT,
    "price" numeric NOT NULL,
    "mode_de_conservation" text NOT NULL UNIQUE,
    "composition" text NOT NULL UNIQUE,
    "valeurs_nutritionnelles" text NOT NULL UNIQUE,
    "allergènes" text NOT NULL UNIQUE,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz
);

CREATE TABLE "côté salé" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL UNIQUE,
    "img" TEXT,
    "price" numeric NOT NULL,
    "poid" TEXT,
    "mode_de_conservation" text NOT NULL UNIQUE,
    "composition" text NOT NULL UNIQUE,
    "valeurs_nutritionnelles" text NOT NULL UNIQUE,
    "allergènes" text NOT NULL UNIQUE,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz 
);

COMMIT;
