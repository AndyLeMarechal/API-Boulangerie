import client from "./pg.client.js";

export default {

    async getBreads() {
        const query = {
            text: 'SELECT* FROM "breads"'
        };
        const result = await client.query(query);
        return result.rows;
    },

    async getBreadById(id) {
        const query = {
            text: 'SELECT * FROM "breads" WHERE "id"=$1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    },

    async createdBread(data) {
        const result = await client.query(
            'SELECT insert_breads($1)',
            [data]
        );
        return result.rows
    },

    async updatedBread(data) {
        const result = await client.query(
            'SELECT updated_breads($1)',
            [data]
        );
        return result.rows;
    },

    async deleteBread(id) {
        const query = {
            text: 'DELETE FROM "breads" WHERE "id" = $1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    }

}