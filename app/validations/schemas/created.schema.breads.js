import Joi from "joi";

export default Joi.object({
    title: Joi.string().min(2).max(20),
    description: Joi.string().min(2),
    img: Joi.string().empty('').uri(),
    price: Joi.number(),
    method_of_conservation: Joi.string().min(2),
    composition: Joi.string().min(2),
    nutritional_values: Joi.string().min(2),
    allergens: Joi.string().min(2),
})

.min(1);