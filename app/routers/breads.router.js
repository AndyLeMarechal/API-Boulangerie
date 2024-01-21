import { Router } from "express";

import breadsController from "../controllers/breads.controller.js";
import breadsDatamapper from "../datamappers/breads.datamapper.js";


export const router = Router();

router.get('/breads', breadsController.getBreads);
router.get('/breads/:id', breadsController.getBreadById);
router.post('/breads', breadsDatamapper.createdBread);
router.patch('/breads/:id', breadsController.updatedBread);
router.delete('/breads/:id', breadsController.deletedBread);