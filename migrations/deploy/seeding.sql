
-- Deploy migrations:seeding to pg

BEGIN;

INSERT INTO "breads"
    (
        "title",
        "description",
        "img",
        "price",
        "method_of_conservation",
        "composition",
        "nutritional_values",
        "allergens"
    )
VALUES 
    (
        'Baguette',
        'Une nouveauté tout à fait délicieuse à base de farine de blé malté, graines de lin et tournesol, réalisée avec des farines sélectionnées, croustillante comme il faut.',
        '.',
        '1.10',
        'Se conserve 24h à température ambiante.',
        'farine de tradition (GLUTEN), eau, levain (eau, farine de BLÉ), sel, farine de maïs, levure.',
        'Valeurs moyennes pour 100g: 1242 kJ / 293 kcal; Matières grasses: 2,1g; Acides gras saturés: 0,47g; Glucides: 58,6g; Sucres: 2,5g; Protéines: 9,9g; Sel: 1,48g.',
        'Gluten.Fabriqué dans un atelier utilisant fruits à coque, lait, œuf, sésame.'
    ),
    (
        'Baguette de tradition',
        'Comme une grosse baguette à base de farine blanche de tradition, ce pain est le compagnon idéal de vos repas et petit-déjeuners. Et au cas où il en reste, il se conserve plutôt pas mal.',
        '.',
        '1.30',
        'Se conserve 24h à température ambiante.',
        'farine de tradition (GLUTEN), eau, levain (eau, farine de BLÉ), sel, farine de maïs, levure.',
        'Valeurs moyennes pour 100g: 1242 kJ / 293 kcal; Matières grasses: 2,1g; Acides gras saturés: 0,47g; Glucides: 58,6g; Sucres: 2,5g; Protéines: 9,9g; Sel: 1,48g.',
        'Gluten.Fabriqué dans un atelier utilisant fruits à coque, lait, œuf, sésame.'
    ),
    (
        'pain au céréales',
        'L''abondance des parfums du mélange de graines de sésame est sublimé dans ce pain.',
        '.',
        '2.70',
        'Se conserve 24h à température ambiante.',
        'farine de tradition (GLUTEN), eau, levain (eau, farine de BLÉ), mélange de céréales 7,4% (graines de lin brun, lin jaune, millet, SÉSAME, pavot bleu), sel, farine de maïs, levure.',
        'Valeurs moyennes pour 100g: 1044 kJ / 246 kcal; Matières grasses: 3,8g; Acides gras saturés: 1,8g; Glucides: 46,8g; Sucres: 2g; Protéines: 8,4g; Sel: 1,35g.',
        'Gluten, sésame. Fabriqué dans un atelier utilisant fruits à coque, lait, oeuf.'
    ),
    (
        'boule de pain',
        'Retrouvez toutes les saveurs d''une mie brune et dense.',
        '.',
        '3.30',
        'Se conserve 48h à température ambiante.',
        'farine de BLÉ complète (42,6%), eau, farine de tradition (GLUTEN), levain (eau, farine de BLÉ), sel, levure.',
        'Valeurs moyennes pour 100g: 1024 kJ / 242kcal; Matières grasses: 1g; Acides gras saturés: 0,2g; Glucides: 46,4g; Sucres: 1,6g; Protéines: 8,7g; Sel: 1,62g.',
        'Gluten. Fabriqué dans un atelier utilisant fruits à coque, lait, œuf, sésame.'
    );

INSERT INTO "pastries"
    (
        "title",
        "description",
        "img",
        "price",
        "method_of_conservation",
        "composition",
        "nutritional_values",
        "allergens"
    )
VALUES 
    (
        'Mi-cuit au chocolat',
        'Le mi-cuit au chocolat au cœur fondant.',
        '.',
        '3.95',
        'Se conserve 24 heures au frais.',
        'ŒUFS, sucre, chocolat noir 20% (pâte de cacao, sucre, beurre de cacao, émulsifiant: lécithine de SOJA, arôme naturel de vanille), BEURRE, farine de BLÉ. Fabriqué dans un atelier utilisant fruits à coque, sésame.',
        'Valeurs moyennes pour 100g: 1751 kJ / 420 kcal; Matières grasses: 25,9g; Acides gras saturés: 16,6g; Glucides: 39,4g; Sucres: 31,6g; Protéines: 5,8g; Sel: 0,1g.',
        'Gluten, lait, œuf, soja. Fabriqué dans un atelier utilisant fruits à coque, sésame.'
    ),
    (
        'FLan',
        'Le délice français d''une crème pâtissière à la délicate vanille.',
        '.',
        '3.60',
        'Se conserve 24 heures au frais.',
        ' LAIT entier, farine de BLÉ, sucre, ŒUFS, BEURRE, préparation en poudre pour crème pâtissière (amidon modifié de maïs, amidon de maïs, dextrose, colorants (bétacarotène, riboflavine), arôme), sucre glace, poudre d''AMANDE, sel, vanille en poudre.',
        'Valeurs moyennes pour 100g: 963 kJ / 229 kcal; Matières grasses: 10g; Acides gras saturés: 5,9g; Glucides: 29,5g; Sucres: 18g; Protéines: 4,8g; Sel: 0,23g.',
        'Gluten, lait, œufs, fruits à coque. Fabriqué dans un atelier utilisant sésame.'
    ),
    (
        'Éclair au chocolat',
        'L''éclair au chocolat fondant, un classique de la pâtisserie individuelle.',
        '.',
        '3.90',
        'Se conserve 24 heures au frais.',
        'LAIT demi-écrémé, chocolat noir 13,3% (pâte de cacao 44%, sucre, beurre de cacao, émulsifiant: lécithine de SOJA, arôme naturel de vanille), farine de BLÉ, eau, gélatine bovine, ŒUFS, CRÈME, BEURRE, sucre, eau, jaune d''ŒUF, sirop de glucose (SULFITES), LAIT concentré (LAIT entier, sucre), amidon de maïs, beurre de cacao, sel. Décor chocolat (chocolat 98% (pâte de cacao, sucre, beurre de cacao, émulsifiant: lécithine de SOJA, extrait de vanille), beurre de cacao).',
        'Valeurs moyennes pour 100g: 1458 kJ/ 349 kcal; Matières grasses: 21,4g; dont Acides gras saturés: 13,3g; Glucides: 30,9g; dont Sucres: 19,9g; Protéines: 6,8g; Sel: 0,19g.',
        'Gluten, lait, œuf, soja, sulfites. Fabriqué dans un atelier utilisant fruits à coque, sésame.'
    ),
    (
        'Éclair au café',
        'Le classique de la pâtisserie individuelle dans sa version corsée au café.',
        '.',
        '3.90',
        'Se conserve 24 heures au frais.',
        'LAIT demi-écrémé, BEURRE, farine de BLÉ, ŒUF, CRÈME, sucre, eau, jaune d''ŒUF, chocolat blanc (sucre, beurre de cacao, LAIT entier en poudre, poudre de LAIT écrémé, émulsifiant: lécithine de SOJA), sirop de glucose (SULFITES), pâte au café 1,4% (café, eau, sucre), LAIT concentré (LAIT entier, sucre), eau, gélatine bovine, amidon de maïs, beurre de cacao, extrait de café liquide 0,3% (café, eau, sucre), sel, colorant tartrazine*. Chocolat (chocolat 98% (pâte de cacao, sucre, beurre de cacao, émulsifiant: lécithine de SOJA, extrait de vanille), beurre de cacao), grain de café chocolat (sucre, pâte de cacao, beurre de cacao, pâte de café 2% (café, arôme, graisse végétale, émulsifiant: lécithine de SOJA), matière grasse LAITIÈRE anhydre, poudre de cacao maigre, émulsifiant (lécithine de SOJA), arôme naturel de vanille, agents d''enrobage). *Peut avoir des effets indésirables sur l''activité et l''attention chez les enfants.',
        'Valeurs moyennes pour 100g: 1546 kJ/ 371 kcal; Matières grasses: 24,9g; dont Acides gras saturés: 16,4g; Glucides: 28,6g; dont Sucres: 17,5g; Protéines: 7,1g; Sel: 0,19g.',
        'Gluten, lait, œuf, soja, sulfites. Fabriqué dans un atelier utilisant fruits à coque, sésame.'
    );

INSERT INTO "breakfast_pastry"
    (
        "title",
        "description",
        "img",
        "price",
        "method_of_conservation",
        "composition",
        "nutritional_values",
        "allergens"
    )
VALUES 
    (
        'Croissant',
        'Emblème du petit-déjeuner à la française, notre croissant doit son délicat feuilletage à l''expertise de nos touriers et à notre levain.',
        '.',
        '1.35',
        'Se conserve 8h à température au sec dans son papier d''emballage.',
        'Farine de BLÉ (farine de BLÉ, GLUTEN de BLÉ), BEURRE 26%, eau, levain (eau, farine de BLÉ), sucre, levure, améliorant (farine de BLÉ, GLUTEN de FROMENT, émulsifiant: lécithine de colza), miel, sel, ŒUFS.',
        'Valeurs moyennes pour 100g: 2022 kJ / 483 kcal; Matières grasses: 28g; Acides gras saturés: 18,1g; Glucides: 50,4g; Sucres: 7,7g; Protéines: 9,2g; Sel: 0,98g.',
        'Gluten, lait, œuf. Fabriqué dans un atelier utilisant fruits à coque, sésame.'
    ),
    (
        'Pain au chocolat',
        'Au petit-déjeuner ou au goûter, retrouvez toutes les saveurs de notre pain au chocolat.',
        '.',
        '1.45',
        'Se conserve 8h à température au sec dans son papier d''emballage.',
        'Farine de BLÉ (GLUTEN), BEURRE, eau, chocolat noir 8,9% (sucre, pâte de cacao, beurre de cacao, émulsifiant : lécithine de SOJA, vanilline), levain (eau, farine de BLÉ), sucre, levure, améliorant (farine de BLÉ, GLUTEN de FROMENT, émulsifiant : lécithine de colza), miel, sel, ŒUFS.',
        'Valeurs moyennes pour 100g: 1873 kJ / 447 kcal; Matières grasses: 25,5g; Acides gras saturés: 16,4g; Glucides: 47,4g; Sucres: 11,9g; Protéines: 8,2g; Sel: 0,81g.',
        'Gluten, lait, œuf, soja. Fabriqué dans un atelier utilisant fruits à coque, sésame.'
    ),
    (
        'Chausson aux pommes',
        'Une compote de pommes gourmande dans une enveloppe au délicat feuilletage au levain.',
        '.',
        '2.00',
        'Se conserve 8h à température au sec dans son papier d''emballage.',
        'Pâte feuilletée 57,7% (farine de BLÉ (farine de BLÉ malté, farine de fève), BEURRE, eau, régulateur de farine (farine de BLÉ, protéines de BLÉ), sel, sucre), compote de pommes 42,3% (pommes 83%, sucre). Dorure: ŒUFS.',
        'Valeurs moyennes pour 100g: 1525 kJ / 365 kcal; Matières grasses: 21,4g; Acides gras saturés: 15g; Glucides: 38,6g; Sucres: 13,8g; Protéines: 3,3g; Sel: 0,56g.',
        'Gluten, lait, œuf. Fabriqué dans un atelier utilisant fruits à coque, sésame.'
    ),
    (
        '100g de chouquettes',
        'Succomber à nos belles chouquettes dorées.',
        '.',
        '3.00',
        'Se conserve 8h à température au sec dans son papier d''emballage.',
        'ŒUF, eau, farine de BLÉ, BEURRE, sucre grain, sucre, sel.',
        'Valeurs Moyennes 1015 kJ / 243 kcal; Matières grasses: 14,28g; Acides gras saturés: 8,91g; Glucides: 22,16g, dont Sucres: 8,07g; Protéines: 5,57g; Sel: 0,74g.',
        'Gluten, lait, œuf. Fabriqué dans un atelier utilisant arachides, fruits à coque, lait, gluten, œuf, sésame, soja, sulfites.'
    );

INSERT INTO "salty_side"
    (
        "title",
        "description",
        "img",
        "price",
        "method_of_conservation",
        "composition",
        "nutritional_values",
        "allergens"
    )
VALUES 
    (
        'Sandwich Rustique',
        'Notre pain au froment et sarrasin renferme un duo de poulet et tomates confites.',
        '.',
        '5.20',
        'Notre sandwich se conserve au frais dans son emballage et se déguste le jour de son achat.',
        'Pain rustique 60% (farine de tradition (GLUTEN), eau, levain (eau, farine de BLÉ), farine de sarrasin 5,2%, sel, farine d''ORGE maltée, GLUTEN de BLÉ, levure), filets de poulet 24%, mayonnaise (huile de colza, eau, jaune d''ŒUF, MOUTARDE (eau, graines de MOUTARDE, vinaigre, sel, conservateur: SULFITE acide de sodium), vinaigre, sel, sucre, amidon modifié, épaississants: gommes guar et xanthane, conservateur: sorbate de potassium, colorant: caroténoïdes), tomates séchées, salade.',
        'Valeurs moyennes pour 100g: 1012kJ / 241kcal; Matières grasses: 9g; Acides gras saturés: 0,86g; Glucides: 30,1g; Sucres: 2,3g; Protéines: 9,8g; Sel: 1,71g.',
        'Gluten, moutarde, œuf, sulfites. Fabriqué dans un atelier utilisant céleri, fruits à coque, lait, poisson, crustacés, sésame, soja.'
    ),
    (
        'Sandwich Thon',
        'Le classique sandwich thon-mayonnaise rehaussé de tomates et batavia.',
        '.',
        '5.20',
        'Notre sandwich se conserve au frais dans son emballage et se déguste le jour de son achat.',
        'Ciabatta 51% (eau, farine de tradition (GLUTEN), farine de gruau (GLUTEN), levain (eau, farine de BLÉ), huile d''olive extra vierge, sel, levure), THON 18,7%, mayonnaise (huile de colza, eau, jaune d''ŒUF, MOUTARDE (eau, graines de MOUTARDE, vinaigre, sel, conservateur: SULFITE acide de sodium), vinaigre, sel, sucre, amidon modifié, épaississants: gommes guar et xanthane, conservateur : sorbate de potassium, colorant : caroténoïdes), tomate, ciboulette, salade.',
        'Valeurs moyennes pour 100g: 984 kJ / 235 kcal; Matières grasses: 11,2g; Acides gras saturés: 1,1g; Glucides: 24g; Sucres: 1,5g; Protéines: 9,3g; Sel: 0,97g.',
        'Gluten, œuf, moutarde, poisson, sulfites. Fabriqué dans un atelier utilisant fruits à coque, lait, sésame, céleri.'
    ),
    (
        'Quiche lorraine aux lardons',
        'La traditionnelle quiche lorraine aux lardons au format individuel.',
        '.',
        '5.00',
        'Se conserve 24h au frais.',
        'CRÈME, ŒUFS, farine de BLÉ, lardons fumés au bois de hêtre 16,7% (poitrine de porc, sel, sucre, acidifiants (acétate de sodium, lactate de potassium), conservateur: nitrite de sodium, antioxydant: ascorbate de sodium), BEURRE, EMMENTAL 4,8%, LAIT-demi écrémé, sucre, sel, poivre.',
        'Valeurs moyennes pour 100g: 1335 kJ / 320 kcal; Matières grasses: 24,7g; Acides gras saturés: 14,9g; Glucides: 14g; Sucres: 1,9g; Protéines: 10g; Sel: 1,25g.',
        'Gluten, lait, œuf Fabriqué dans un atelier utilisant fruits à coque, céleri, crustacés, moutarde, poisson, sésame, soja.'
    ),
    (
        'Quiche tomate, féta et basilic',
        'Découvrez notre quiche fondante aux produits de saison.',
        '.',
        '5.00',
        'Se conserve 24h au frais.',
        'Farine de BLÉ, BEURRE, féta LAIT, tomate cerise marinée (huile de tournesol, sel, ail, origan), ŒUF, CRÈME, LAIT demi-écrémé, CRÈME, basilic surgelé, sel, sucre.',
        'Valeurs moyennes pour 100g: 1302kJ / 312kcal; Matières grasses: 21,51g; Acides gras saturés: 14,68g; Glucides: 21,69g; Sucres: 2,71g; Protéines: 7,2g; Sel: 1,05g.',
        'Gluten, lait, œuf. Fabriqué dans un atelier utilisant arachides, céleri, fruits à coque, gluten, lait, œuf, moutarde, poisson, crustacés, sésame, soja, sulfites.'
    );


COMMIT;
