import our_bakeryDatamapper from "../datamappers/our_bakery.datamapper.js";

import createdSchemaOurBakery from "../validations/schemas/created.schema.our_bakery.js"
import updatedSchemaOurBakery from "../validations/schemas/updated.schema.our_bakery.js"

export default {

    async getOurBakerys(req, res) {
        try {
            const ourBakerys = await our_bakeryDatamapper.getOurBakerys();
            res.status(200).json(ourBakerys);
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }

    },

    async getOurBakeryById(req, res) {
        const id = req.params.id;
        try {
            const ourBakeryId = Number.parseInt(req.params.id, 10);
            if(isNaN(ourBakeryId)){
            return res.status(400).json({error: 'Our bakery ID should be a valid integer'});
            }

            const ourBakery = await our_bakeryDatamapper.getOurBakeryById(id);

            if(ourBakery.length == 0){
                return res.status(400).json({error: 'Our bakery not found. Please verify the provided id.'});
            }
            res.status(200).json(ourBakery)
        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async createdOurBakery(req, res) {
        try {
            const createSchemaOurBakery = createdSchemaOurBakery;
            const { error } = createSchemaOurBakery.validate(req.body);
            if (error) { return res.status(400).json({ error: error.message }); }
            
            const data = {
                title: req.body.title,
                description: req.body.description,
                img: req.body.img,
                hourly: req.body.hourly,
                city: req.body.city,
                address: req.body.address,
		        zip_code: req.body.zip_code
            };
            
            const title = req.body.title;
            const existingOurBakeryByTitle = await our_bakeryDatamapper.getOurBakeryByTitle(title);
          
          if (existingOurBakeryByTitle.length != 0 ) {

            return res.status(400).json({error: 'Title is already in use'});
          }
            

            const createdOurBakery = await our_bakeryDatamapper.createdOurBakery(data);
            res.status(201).json(createdOurBakery);

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async updatedOurBakery(req, res) {
        const id = req.params.id;
        try {
            const ourBakeryId = Number.parseInt(req.params.id, 10);
            if(isNaN(ourBakeryId)){
            return res.status(400).json({error: 'Our bakery ID should be a valid integer'});
            }

            const updateSchemaOurBakery = updatedSchemaOurBakery;
            const { error } = updateSchemaOurBakery.validate(req.body);
            if (error) { return res.status(400).json({ error: error.message }); }

            const data = {
                id: id,
                title: req.body.title,
                description: req.body.description,
                img: req.body.img,
                hourly: req.body.hourly,
                city: req.body.city,
                address: req.body.address,
		        zip_code: req.body.zip_code
            };

            const title = req.body.title;
            const existingOurBakeryByTitle = await our_bakeryDatamapper.getOurBakeryByTitle(title);
          
          if (existingOurBakeryByTitle.length != 0 ) {

            return res.status(400).json({error: 'Title is already in use'});
          }

            const updatedOurBakery = await our_bakeryDatamapper.updatedOurBakery(data);

            if(updatedOurBakery.length == 0){
                return res.status(400).json({error: 'Our bakery not found. Please verify the provided id.'});
            }

            res.status(200).json(updatedOurBakery)

        }
        catch(err) {
            console.trace(err);
            res.status(500).json({error: '500 Internal Server Error'});
        }
    },

    async deletedOurBakery(req, res) {
        const id = req.params.id;
        try {
            const ourBakeryId = Number.parseInt(req.params.id, 10);
            if(isNaN(ourBakeryId)){
            return res.status(400).json({error: 'Our bakery ID should be a valid integer'});
            }

            const ourBakery = await our_bakeryDatamapper.getOurBakeryById(id);

            if(ourBakery.length == 0){
                return res.status(400).json({error: 'Our bakery not found. Please verify the provided id.'});
            }

            const deletedOurBakery = await our_bakeryDatamapper.deletedOurBakery(id);

            if(deletedOurBakery) {
                return res.status(200).json({message: `The bread whith title ' ${ourBakery[0].title} ' is deleted`});
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
}