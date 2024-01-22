import { Router } from "express";


import { router as breadsRouter } from "./breads.router.js";
import { router as breakFastPastry } from "./breakfast_pastry.router.js";

export const router = Router();


// Main API routes
router.use(breadsRouter);
router.use(breakFastPastry);




router.use((req, res) => {
  res.status(404).json({ error: "Ressource not found" });
});