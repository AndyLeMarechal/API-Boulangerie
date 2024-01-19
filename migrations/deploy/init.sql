-- Deploy migrations:init to pg

BEGIN;


CREATE TABLE "pains" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL UNIQUE,
    "img" TEXT,
    "price" numeric NOT NULL,
    "mode_de_conservation" text NOT NULL ,
    "composition" text NOT NULL ,
    "valeurs_nutritionnelles" text NOT NULL ,
    "allergènes" text NOT NULL ,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz 
);

CREATE TABLE "pâtisserie" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL UNIQUE,
    "img" TEXT,
    "price" numeric NOT NULL,
    "mode_de_conservation" text NOT NULL ,
    "composition" text NOT NULL ,
    "valeurs_nutritionnelles" text NOT NULL ,
    "allergènes" text NOT NULL ,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz 
);

CREATE TABLE "viennoiserie" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL UNIQUE,
    "img" TEXT,
    "price" numeric NOT NULL,
    "mode_de_conservation" text NOT NULL ,
    "composition" text NOT NULL ,
    "valeurs_nutritionnelles" text NOT NULL ,
    "allergènes" text NOT NULL ,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz
);

CREATE TABLE "côté_salé" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL UNIQUE,
    "img" TEXT,
    "price" numeric NOT NULL,
    "mode_de_conservation" text NOT NULL ,
    "composition" text NOT NULL ,
    "valeurs_nutritionnelles" text NOT NULL ,
    "allergènes" text NOT NULL ,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz 
);

COMMIT;
