import { Router } from "express";

import breadsController from "../controllers/breads.controller.js";

import createdSchemaBreads from "../validations/schemas/created.schema.breads.js";
import updatedSchemaBreads from "../validations/schemas/updated.schema.breads.js";

import validationMiddleware from "../validations/validation.middleware.js"

export const router = Router();

router.get('/breads', breadsController.getBreads);
router.get('/breads/:id', breadsController.getBreadById);
router.post('/breads',validationMiddleware('body', createdSchemaBreads) ,breadsController.createdBread);
router.patch('/breads/:id',validationMiddleware('body', updatedSchemaBreads) ,breadsController.updatedBread);
router.delete('/breads/:id', breadsController.deletedBread);