import client from "./pg.client.js";

export default {

    async getBreakfastPastrys() {
        const query = {
            text: 'SELECT* FROM "breakfast_pastry"'
        };
        const result = await client.query(query);
        return result.rows;
    },

    async getBreakfastPastryById(id) {
        const query = {
            text: 'SELECT * FROM "breakfast_pastry" WHERE "id"=$1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    },

    async createdBreakfastPastry(data) {
        const result = await client.query(
            'SELECT insert_breakfast_pastry($1)',
            [data]
        );
        return result.rows
    },

    async updatedBreakfastPastry(data) {
        const result = await client.query(
            'SELECT updated_breakfast_pastry($1)',
            [data]
        );
        return result.rows;
    },

    async deleteBreakfastPastry(id) {
        const query = {
            text: 'DELETE FROM "breakfast_pastry" WHERE "id" = $1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    }

}