-- Deploy migrations:init to pg

BEGIN;


CREATE TABLE "breads" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL ,
    "img" TEXT,
    "price" numeric NOT NULL,
    "method_of_conservation" text NOT NULL ,
    "composition" text NOT NULL ,
    "nutritional_values" text NOT NULL ,
    "allergens" text NOT NULL ,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz 
);

CREATE TABLE "pastries" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL ,
    "img" TEXT,
    "price" numeric NOT NULL,
    "method_of_conservation" text NOT NULL ,
    "composition" text NOT NULL ,
    "nutritional_values" text NOT NULL ,
    "allergens" text NOT NULL ,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz 
);

CREATE TABLE "breakfast_pastry" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL ,
    "img" TEXT,
    "price" numeric NOT NULL,
    "method_of_conservation" text NOT NULL ,
    "composition" text NOT NULL ,
    "nutritional_values" text NOT NULL ,
    "allergens" text NOT NULL ,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz
);

CREATE TABLE "salty_side" (
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" text NOT NULL UNIQUE,
    "description" text NOT NULL ,
    "img" TEXT,
    "price" numeric NOT NULL,
    "method_of_conservation" text NOT NULL ,
    "composition" text NOT NULL ,
    "nutritional_values" text NOT NULL ,
    "allergens" text NOT NULL ,
    "created_at" timestamptz NOT NULL DEFAULT now(),
    "updated_at" timestamptz 
);

COMMIT;
