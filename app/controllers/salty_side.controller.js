import salySideDatamapper from '../datamappers/salty_side.datamapper.js'

import createdSchemaSalty_side from '../validations/schemas/created.schema.salty_side.js'
import updatedSchemaSalty_side from '../validations/schemas/updated.schema.salty_side.js';

export default {

    async getSaltySides(req, res) {
        try {
            const saltySides = await salySideDatamapper.getSaltySides();
            res.status(200).json(saltySides);
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async getSaltySideById(req, res) {
        const id = req.params.id;
        try {
            const saltySideId = Number.parseInt(req.params.id, 10);
            if(isNaN(saltySideId)){
            return res.status(400).json({error: 'Salty side ID should be a valid integer'});
            }

            const saltySide = await salySideDatamapper.getSaltySideById(id);

            if(saltySide.length == 0){
                return res.status(400).json({error: 'Salty side not found. Please verify the provided id.'});
            }
            res.status(200).json(saltySide)
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async createdSaltySide(req, res) {

        try {
            const createdSaltySideSchema = createdSchemaSalty_side;
            const { error } = createdSaltySideSchema.validate(req.body);
            if (error) { return res.status(400).json({ error: error.message }); }

            const data = {
                title: req.body.title,
                description: req.body.description,
                img: req.body.img,
                price: req.body.price,
                method_of_conservation: req.body.method_of_conservation,
                composition: req.body.composition,
		        nutritional_values: req.body.nutritional_values,
		        allergens: req.body.allergens,
            };

            const title = req.body.title;
            const existingSaltySideByTitle = await salySideDatamapper.getSaltySideByTitle(title);
          
          if (existingSaltySideByTitle.length != 0 ) {

            return res.status(400).json({error: 'Title is already in use'});
          }


            const createdSaltySide = await salySideDatamapper.createdSaltySide(data);

            res.status(201).json(createdSaltySide);

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async updatedSaltySide(req, res) {
        const id = req.params.id;
        try {
            const saltySideId = Number.parseInt(req.params.id, 10);
            if(isNaN(saltySideId)){
            return res.status(400).json({error: 'Salty side ID should be a valid integer'});
            }

            const updatedSaltySideSchema = updatedSchemaSalty_side;
            const { error } = updatedSaltySideSchema.validate(req.body);
            if (error) { return res.status(400).json({ error: error.message }); }

            const data = {
                id,
                title: req.body.title,
                description: req.body.description,
                img: req.body.img,
                price: req.body.price,
                method_of_conservation: req.body.method_of_conservation,
                composition: req.body.composition,
		        nutritional_values: req.body.nutritional_values,
		        allergens: req.body.allergens,
                
            };

            const title = req.body.title;
            const existingSaltySideByTitle = await salySideDatamapper.getSaltySideByTitle(title);
          
          if (existingSaltySideByTitle.length != 0 ) {

            return res.status(400).json({error: 'Title is already in use'});
          }

            const updatedSaltySide = await salySideDatamapper.updatedSaltySide(data);

            if(updatedSaltySide.length == 0){
                return res.status(400).json({error: 'Salty side not found. Please verify the provided id.'});
            }

            res.status(200).json(updatedSaltySide)

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async deletedSaltySide(req, res) {
        const id = req.params.id;
        try {
            const saltySideId = Number.parseInt(req.params.id, 10);
            if(isNaN(saltySideId)){
            return res.status(400).json({error: 'Salty side ID should be a valid integer'});
            }

            const saltySide = await salySideDatamapper.getSaltySideById(id)

            if(saltySide.length == 0){
                return res.status(400).json({error: 'Salty side not found. Please verify the provided id.'});
            }

            const deletedSaltySide = await salySideDatamapper.deleteSaltySide(id);

            if(deletedSaltySide) {
                return res.status(200).json({message: `The salty side number : ${saltySide[0].id} is deleted`});
            }
            else {
                return res.status(404).json({error: 'Whoops! \n 404'});
            }

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    }
};