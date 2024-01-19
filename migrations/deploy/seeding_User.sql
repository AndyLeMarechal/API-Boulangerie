-- Deploy migrations:seeding_User to pg

BEGIN;

INSERT INTO "user"
    (
        "username",
        "email",
        "password",
        "firstname",
        "lastname",
        "address",
        "role"
    )
VALUES
    (
        'Miguel',
        'Miguel@boulangerieADMIN.io',
        '123456',
        'Miguel',
        'boulangerieADMIN',
        '.',
        'Admin'
    ),
    (
        'Violetta',
        'Violetta@boulangerieEDITOR.io',
        '54321',
        'Violetta',
        'boulangerieEDITOR',
        '.',
        'Editor'
    ),
    (
        'JeanDuPuis',
        'JeanDuPuis@gmail.com',
        '56789',
        'Jean',
        'Du Puis',
        '25 rue de la base de loisir, 92456 Clachy',
        'registered'
    )
;
COMMIT;
