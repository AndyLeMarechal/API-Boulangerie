import breadsDatamapper from "../datamappers/breads.datamapper.js";

import createdSchemaBreads from "../validations/schemas/created.schema.breads.js";
import updatedSchemaBreads from "../validations/schemas/updated.schema.breads.js";

export default {

    async getBreads(req, res) {
        try {
            const breads = await breadsDatamapper.getBreads();
            res.status(200).json(breads);
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async getBreadById(req, res) {
        const id = req.params.id;
        try {
            const breadId = Number.parseInt(req.params.id, 10);
            if(isNaN(breadId)){
            return res.status(400).json({error: 'Bread ID should be a valid integer'});
            }

            const bread = await breadsDatamapper.getBreadById(id);

            if(bread.length == 0){
                return res.status(400).json({error: 'Bread not found. Please verify the provided id.'});
            }
            res.status(200).json(bread)
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async createdBread(req, res) {

        try {
            const createdBreadsSchema = createdSchemaBreads;
            const { error } = createdBreadsSchema.validate(req.body);
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
            const existingBreadByTitle = await breadsDatamapper.getBreadByTitle(title);
          
          if (existingBreadByTitle.length != 0 ) {

            return res.status(400).json({error: 'Title is already in use'});
          }

            const createdBread = await breadsDatamapper.createdBread(data);
            console.log(createdBread);
            res.status(201).json(createdBread);

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async updatedBread(req, res) {
        const id = req.params.id;
        try {
            const breadId = Number.parseInt(req.params.id, 10);
            if(isNaN(breadId)){
            return res.status(400).json({error: 'Bread ID should be a valid integer'});
            }

            const updatedBreadsSchema = updatedSchemaBreads;
            const { error } = updatedBreadsSchema.validate(req.body);
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
            const existingBreadByTitle = await breadsDatamapper.getBreadByTitle(title);
          
          if (existingBreadByTitle.length != 0 ) {

            return res.status(400).json({error: 'Title is already in use'});
          }

            const updatedBread = await breadsDatamapper.updatedBread(data);

            if(updatedBread.length == 0){
                return res.status(400).json({error: 'Bread not found. Please verify the provided id.'});
            }

            res.status(200).json(updatedBread)

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async deletedBread(req, res) {
        const id = req.params.id;
        try {
            const breadId = Number.parseInt(req.params.id, 10);
            if(isNaN(breadId)){
            return res.status(400).json({error: 'Bread ID should be a valid integer'});
            };

            const bread = await breadsDatamapper.getBreadById(id);

            if(bread.length == 0){
                return res.status(400).json({error: 'Bread not found. Please verify the provided id.'});
            }

            const deletedBread = await breadsDatamapper.deleteBread(id);

            if(deletedBread) {
                return res.status(200).json({message: `The bread number ' ${breakFastPastry[0].id} ' is deleted`});
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