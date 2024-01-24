import { Router } from "express";

import our_bakeryController from "../controllers/our_bakery.controller.js";

import createdSchemaOurBakery from "../validations/schemas/created.schema.our_bakery.js"
import updatedSchemaOurBakery from "../validations/schemas/updated.schema.our_bakery.js"

import validationMiddleware from "../validations/validation.middleware.js"

export const router = Router();

router.get('/ourBakerys', our_bakeryController.getOurBakerys);
router.get('/ourBakerys/:id', our_bakeryController.getOurBakeryById);
router.post('/ourBakerys',validationMiddleware('body', createdSchemaOurBakery) ,our_bakeryController.createdOurBakery);
router.patch('/ourBakerys/:id',validationMiddleware('body', updatedSchemaOurBakery) ,our_bakeryController.updatedOurBakery);
router.delete('/ourBakerys/:id', our_bakeryController.deletedOurBakery);