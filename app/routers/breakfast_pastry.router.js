import { Router } from "express";

import breakfast_pastryController from "../controllers/breakfast_pastry.controller.js";

import createdSchemaBreakFastPastry from "../validations/schemas/created.schema.breakfast_pastry.js";
import updatedSchemaBreakFastPastry from "../validations/schemas/updated.schema.breakfast_pastry.js";

import validationMiddleware from "../validations/validation.middleware.js"

export const router = Router();

router.get('/breakFastPastrys', breakfast_pastryController.getBreakFastPastrys);
router.get('/breakFastPastrys/:id', breakfast_pastryController.getBreakFastPastryById);
router.post('/breakFastPastrys', validationMiddleware('body', createdSchemaBreakFastPastry) , breakfast_pastryController.createdBreakFastPastry);
router.patch('/breakFastPastrys/:id', validationMiddleware('body', updatedSchemaBreakFastPastry),breakfast_pastryController.updatedBreakFastPastry);
router.delete('/breakFastPastrys/:id', breakfast_pastryController.deletedBreakfastPastry);