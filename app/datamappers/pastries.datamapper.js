import client from "./pg.client.js";

export default {

    async getPastries() {
        const query = {
            text: 'SELECT* FROM "pastries"'
        };
        const result = await client.query(query);
        return result.rows;
    },

    async getPastrieById(id) {
        const query = {
            text: 'SELECT * FROM "pastries" WHERE "id"=$1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    },

    async createdPastrie(data) {
        const result = await client.query(
            'SELECT insert_pastries($1)',
            [data]
        );
        return result.rows
    },

    async updatedPastrie(data) {
        const result = await client.query(
            'SELECT updated_pastries($1)',
            [data]
        );
        return result.rows;
    },

    async deletePastrie(id) {
        const query = {
            text: 'DELETE FROM "pastries" WHERE "id" = $1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    }

}