import breakfast_pastryController from "../controllers/breakfast_pastry.controller.js";

export const router = Router();

router.get('/breakFastPastrys', breakfast_pastryController.getBreakFastPastrys);
router.get('/breakFastPastrys/:id', breakfast_pastryController.getBreakFastPastryById);
router.post('/breakFastPastrys', breakfast_pastryController.createdBreakFastPastry);
router.patch('/breakFastPastrys/:id', breakfast_pastryController.updatedBreakFastPastry);
router.delete('/breakFastPastrys/:id', breakfast_pastryController.deletedBreakfastPastry);