import { Router } from "express";

import userController from "../controllers/user.controller.js";

import createdSchemaUser from "../validations/schemas/created.schema.user.js";
import updatedSchemaUser from "../validations/schemas/updated.schema.user.js";

import validationMiddleware from "../validations/validation.middleware.js"

export const router = Router();

router.get('/users', userController.getUsers);
router.get('/users/:id', userController.getUser);
router.post('/users', validationMiddleware('body', createdSchemaUser), userController.createdUser);
router.patch('/users/:id', validationMiddleware('body', updatedSchemaUser), userController.updatedUser);
router.delete('/users/:id', userController.deletedUser);