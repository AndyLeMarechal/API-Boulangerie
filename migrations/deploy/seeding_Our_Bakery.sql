-- Deploy migrations:seeding_Our_Bakery to pg

BEGIN;

INSERT INTO "our_bakery" 
    (
        "title" ,
        "description" , 
        "img" ,
        "hourly" , 
        "city" ,
        "address" ,
        "zip_code"
    )
VALUES
    (
        'Boulangerie du louvre',
        'qsd',
        '.',
        'Ouvert de 8h30-19h00
        Lundi : 8h30-19h00
        Mardi : 8h30-19h00
        Mercredi : 8h30-19h00
        Jeudi : ---------
        Vendredi : 8h30-19h00
        Samedi : 8h30-19h00
        Dimanche : 8h30-19h00',
        'Paris',
        '15 Voie George Pompidou',
        75001
    ),
    (
        'Boulangerie Désiré',
        'qsdd',
        '.',
        'Ouvert de 7h30-20h30
        Lundi : 7h30-20h30
        Mardi : ---------
        Mercredi : 7h30-20h30
        Jeudi : 7h30-20h30
        Vendredi : 7h30-20h30
        Samedi : 7h30-20h30
        Dimanche : 7h30-20h30',
        'Deauville',
        '32 Rue Désiré Le Hoc',
        14800
    ),
    (
        'Boulangerie Aeroport Orly',
        'sd',
        '.',
        'Ouvert de 8h30-19h00
        Lundi : 8h30-19h00
        Mardi : 8h30-19h00
        Mercredi : 8h30-19h00
        Jeudi : ---------
        Vendredi : 8h30-19h00
        Samedi : 8h30-19h00
        Dimanche : 8h30-19h00',
        'Orly',
        'Zone Internationale, Orly 4, Aéroport de Paris-Orly, Avenue Sud Hall A Orly FR, niveau port F30',
        94310
    ),
    (
        'Boulangerie Le Félix',
        'zaze',
        '.',
        'Ouvert de 8h30-19h00
        Lundi : 8h30-19h00
        Mardi : 8h30-19h00
        Mercredi : 8h30-19h00
        Jeudi : ---------
        Vendredi : 8h30-19h00
        Samedi : 8h30-19h00
        Dimanche : 8h30-19h00',
        'Nantes',
        '1 Place St Félix',
        44000
    );

COMMIT;
