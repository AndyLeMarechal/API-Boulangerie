import breakfastPastryDatamapper from '../datamappers/breakfast_pastry.datamapper.js'

import createdSchemaBreakFastPastry from "../validations/schemas/created.schema.breakfast_pastry.js";
import updatedSchemaBreakFastPastry from "../validations/schemas/updated.schema.breakfast_pastry.js";

export default {

    async getBreakFastPastrys(req, res) {
        try {
            const BreakFastPastrys = await breakfastPastryDatamapper.getBreakfastPastrys();
            res.status(200).json(BreakFastPastrys);
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
            return res.status(400).json({error: 'Bread ID should be a valid integer'});
            }

            const BreakFastPastry = await breakfastPastryDatamapper.getBreakfastPastryById(id);

            if(BreakFastPastry.length == 0){
                return res.status(400).json({error: 'Bread not found. Please verify the provided id.'});
            }
            res.status(200).json(BreakFastPastry)
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
            console.log(data);

            const createdBreakFastPastry = await breakfastPastryDatamapper.createdBreakfastPastry(data);
            console.log(createdBread);
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
            return res.status(400).json({error: 'Bread ID should be a valid integer'});
            }

            const updatedBreakFastPastrySchema = updatedSchemaBreakFastPastry;
            const { error } = updatedBreakFastPastrySchema.validate(req.body);
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

            const updatedBreakFastPastry = await breakfastPastryDatamapper.updatedBreakfastPastry(data);

            if(updatedBreakFastPastry.length == 0){
                return res.status(400).json({error: 'Bread not found. Please verify the provided id.'});
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
            return res.status(400).json({error: 'Bread ID should be a valid integer'});
            }

            const deletedBreakFastPastry = await breakfastPastryDatamapper.deleteBreakfastPastry(id);

            if(deletedBreakFastPastry.length == 0){
                return res.status(400).json({error: 'Bread not found. Please verify the provided id.'});
            }
            res.end(204);
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    }
};