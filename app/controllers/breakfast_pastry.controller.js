import breakfastPastryDatamapper from '../datamappers/breakfast_pastry.datamapper.js'

import createdSchemaBreakFastPastry from "../validations/schemas/created.schema.breakfast_pastry.js";
import updatedSchemaBreakFastPastry from "../validations/schemas/updated.schema.breakfast_pastry.js";

export default {

    async getBreakFastPastrys(req, res) {
        try {
            const breakFastPastrys = await breakfastPastryDatamapper.getBreakfastPastrys();
            res.status(200).json(breakFastPastrys);
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async getBreakFastPastryById(req, res) {
        const id = req.params.id;
        try {
            const breakFastPastryId = Number.parseInt(req.params.id, 10);
            if(isNaN(breakFastPastryId)){
            return res.status(400).json({error: 'Break fast pastry ID should be a valid integer'});
            }

            const breakFastPastry = await breakfastPastryDatamapper.getBreakfastPastryById(id);

            if(breakFastPastry.length == 0){
                return res.status(400).json({error: 'Break fast pastry not found. Please verify the provided id.'});
            }
            res.status(200).json(breakFastPastry)
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async createdBreakFastPastry(req, res) {

        try {
            const createdBreakFastPastrySchema = createdSchemaBreakFastPastry;
            const { error } = createdBreakFastPastrySchema.validate(req.body);
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
            const existingBreakFastPastryByTitle = await breakfastPastryDatamapper.getBreakfastPastryByTitle(title);
          
          if (existingBreakFastPastryByTitle.length != 0 ) {

            return res.status(400).json({error: 'Title is already in use'});
          }

            const createdBreakFastPastry = await breakfastPastryDatamapper.createdBreakfastPastry(data);
            
            res.status(201).json(createdBreakFastPastry);

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async updatedBreakFastPastry(req, res) {
        const id = req.params.id;
        try {
            const breakFastPastryId = Number.parseInt(req.params.id, 10);
            if(isNaN(breakFastPastryId)){
            return res.status(400).json({error: 'Break fast pastry ID should be a valid integer'});
            }

            const updatedBreakFastPastrySchema = updatedSchemaBreakFastPastry;
            const { error } = updatedBreakFastPastrySchema.validate(req.body);
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
		        allergens: req.body.allergens
            };

            const title = req.body.title;
            const existingBreakFastPastryByTitle = await breakfastPastryDatamapper.getBreakfastPastryByTitle(title);
          
          if (existingBreakFastPastryByTitle.length != 0 ) {

            return res.status(400).json({error: 'Title is already in use'});
          }

            const updatedBreakFastPastry = await breakfastPastryDatamapper.updatedBreakfastPastry(data);

            if(updatedBreakFastPastry.length == 0){
                return res.status(400).json({error: 'Break fast pastry not found. Please verify the provided id.'});
            }

            res.status(200).json(updatedBreakFastPastry)

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async deletedBreakfastPastry(req, res) {
        const id = req.params.id;
        try {
            const breakFastPastryId = Number.parseInt(req.params.id, 10);
            if(isNaN(breakFastPastryId)){
            return res.status(400).json({error: 'Break fast pastry ID should be a valid integer'});
            }

            const breakFastPastry = await breakfastPastryDatamapper.getBreakfastPastryById(id);

            if(breakFastPastry.length == 0){
                return res.status(400).json({error: 'Break fast pastry not found. Please verify the provided id.'})
            };

            const deletedBreakFastPastry = await breakfastPastryDatamapper.deleteBreakfastPastry(id);

            
            if(deletedBreakFastPastry) {
                return res.status(200).json({message: `The Break fast pastry number ' ${breakFastPastry[0].id} ' is deleted`});
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