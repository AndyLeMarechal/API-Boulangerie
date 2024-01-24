-- Deploy migrations:User to pg

BEGIN;

CREATE TABLE "user" (
  "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "username" TEXT NOT NULL UNIQUE,
  "email" TEXT NOT NULL UNIQUE,
  "password" TEXT NOT NULL ,
  "firstname" TEXT NOT NULL,
  "lastname" TEXT NOT NULL,
  "address" TEXT NOT NULL,
  "role" TEXT,
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "updated_at" TIMESTAMPTZ
);

COMMIT;
