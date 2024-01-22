import pastriesDatamapper from '../datamappers/pastries.datamapper.js'

import createdSchemaPastrie from '../validations/schemas/created.schema.pastrie.js';
import updatedSchemaPastrie from '../validations/schemas/updated.schema.pastrie.js';

export default {

    async getPastries(req, res) {
        try {
            const pastries = await pastriesDatamapper.getPastries();
            res.status(200).json(pastries);
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async getPastrieById(req, res) {
        const id = req.params.id;
        try {
            const pastrieId = Number.parseInt(req.params.id, 10);
            if(isNaN(pastrieId)){
            return res.status(400).json({error: 'Pastrie ID should be a valid integer'});
            }

            const pastrie = await pastriesDatamapper.getPastrieById(id);

            if(pastrie.length == 0){
                return res.status(400).json({error: 'Pastrie not found. Please verify the provided id.'});
            }
            res.status(200).json(pastrie)
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async createdPastrie(req, res) {

        try {
            const createdPastrieSchema = createdSchemaPastrie;
            const { error } = createdPastrieSchema.validate(req.body);
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
           

            const createdPastrie = await pastriesDatamapper.createdPastrie(data);
            
            res.status(201).json(createdPastrie);

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async updatedPastrie(req, res) {
        const id = req.params.id;
        try {
            const pastrieId = Number.parseInt(req.params.id, 10);
            if(isNaN(pastrieId)){
            return res.status(400).json({error: 'Pastrie ID should be a valid integer'});
            }

            const updatedPastrieSchema = updatedSchemaPastrie;
            const { error } = updatedPastrieSchema.validate(req.body);
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
                id
            };

            const updatedPastrie = await pastriesDatamapper.updatedPastrie(data);

            if(updatedPastrie.length == 0){
                return res.status(400).json({error: 'Pastrie not found. Please verify the provided id.'});
            }

            res.status(200).json(updatedPastrie)

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async deletedPastrie(req, res) {
        const id = req.params.id;
        try {
            const pastrieId = Number.parseInt(req.params.id, 10);
            if(isNaN(pastrieId)){
            return res.status(400).json({error: 'Pastrie ID should be a valid integer'});
            }

            const pastrie = await pastriesDatamapper.getPastrieById(id);

            if(pastrie.length == 0){
                return res.status(400).json({error: 'Pastrie not found. Please verify the provided id.'});
            }

            const deletedPastrie = await pastriesDatamapper.deletePastrie(id);


            if(deletedPastrie) {
                return res.status(200).json({message: `The pastrie number ' ${pastrie[0].id} ' is deleted`});
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