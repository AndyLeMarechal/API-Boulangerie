import { Router } from "express";


import { router as breadsRouter } from "./breads.router.js";


export const router = Router();


// Main API routes
router.use(breadsRouter);




router.use((req, res) => {
  res.status(404).json({ error: "Ressource not found" });
});