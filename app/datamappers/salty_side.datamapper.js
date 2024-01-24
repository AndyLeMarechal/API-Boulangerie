import client from "./pg.client.js";

export default {

    async getSaltySides() {
        const query = {
            text: 'SELECT* FROM "salty_side"'
        };
        const result = await client.query(query);
        return result.rows;
    },

    async getSaltySideById(id) {
        const query = {
            text: 'SELECT * FROM "salty_side" WHERE "id"=$1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    },

    async getSaltySideByTitle(title) {
        const query = {
            text: 'SELECT * FROM "salty_side" WHERE "title" = $1',
            values: [title]
        };
        const result = await client.query(query);
        return result.rows;
    },

    async createdSaltySide(data) {
        const result = await client.query(
            'SELECT insert_salty_side($1)',
            [data]
        );
        return result.rows
    },

    async updatedSaltySide(data) {
        const result = await client.query(
            'SELECT updated_salty_side($1)',
            [data]
        );
        return result.rows;
    },

    async deleteSaltySide(id) {
        const query = {
            text: 'DELETE FROM "salty_side" WHERE "id" = $1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    }

}