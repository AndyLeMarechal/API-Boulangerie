import { Router } from "express";


import { router as breadsRouter } from "./breads.router.js";
import { router as breakFastPastryRouter } from "./breakfast_pastry.router.js";
import { router as pastriesRouter } from "./pastrie.router.js"
import { router as saltySidesRouter } from "./salty_side.router.js"
import { router as userRouter } from "./user.router.js"
import { router as ourBakeryRouter } from "./our_bakery.router.js"

export const router = Router();


// Main API routes
router.use(breadsRouter);
router.use(breakFastPastryRouter);
router.use(pastriesRouter);
router.use(saltySidesRouter);
router.use(userRouter);
router.use(ourBakeryRouter);




router.use((req, res) => {
  res.status(404).json({ error: "Ressource not found" });
});