import { Router } from "express";

import pastriesController from "../controllers/pastries.controller.js";

import createdSchemaPastrie from '../validations/schemas/created.schema.pastrie.js';
import updatedSchemaPastrie from '../validations/schemas/updated.schema.pastrie.js';

import validationMiddleware from "../validations/validation.middleware.js"

export const router = Router();

router.get('/pastries', pastriesController.getPastries);
router.get('/pastries/:id', pastriesController.getPastrieById);
router.post('/pastries', validationMiddleware('body', createdSchemaPastrie), pastriesController.createdPastrie);
router.patch('/pastries/:id', validationMiddleware('body', updatedSchemaPastrie), pastriesController.updatedPastrie);
router.delete('/pastries/:id', pastriesController.deletedPastrie);