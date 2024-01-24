import client from "./pg.client.js";

export default {

    async getOurBakerys() {
        const query = {
            text: 'SELECT * FROM "our_bakery"'
        };
        const result = await client.query(query);
        return result.rows;
    },

    async getOurBakeryById(id) {
        const query = {
            text: 'SELECT * FROM "our_bakery" WHERE "id" = $1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    },

    async getOurBakeryByTitle(title) {
        const query = {
            text: 'SELECT * FROM "our_bakery" WHERE "title" = $1',
            values: [title]
        };
        const result = await client.query(query);
        return result.rows;
    },

    async createdOurBakery(data) {
        const result = await client.query(
            'SELECT insert_our_bakery($1)',
            [data]
        )
        return result.rows
    },

    async updatedOurBakery(data) {
        const result = await client.query(
            'SELECT updated_our_bakery($1)',
            [data]
        )
        return result.rows
    },

    async deletedOurBakery(id) {
        const query = {
            text: 'DELETE FROM "our_bakery" WHERE "id" = $1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    }

}