import { Router } from "express";

import salty_sideController from "../controllers/salty_side.controller.js";

import createdSchemaSalty_side from '../validations/schemas/created.schema.salty_side.js'
import updatedSchemaSalty_side from '../validations/schemas/updated.schema.salty_side.js';

import validationMiddleware from "../validations/validation.middleware.js"

export const router = Router();

router.get('/saltySides', salty_sideController.getSaltySides);
router.get('/saltySides/:id', salty_sideController.getSaltySideById);
router.post('/saltySides', validationMiddleware('body', createdSchemaSalty_side), salty_sideController.createdSaltySide);
router.patch('/saltySides/:id', validationMiddleware('body', updatedSchemaSalty_side), salty_sideController.updatedSaltySide);
router.delete('/saltySides/:id', salty_sideController.deletedSaltySide);