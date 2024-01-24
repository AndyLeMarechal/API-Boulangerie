import client from "./pg.client.js";

export default {

    async getUsers() {
        const query = {
            text: 'SELECT* FROM "user"'
        };
        const result = await client.query(query);
        return result.rows;
    },

    async getUserById(id) {
        const query = {
            text: 'SELECT * FROM "user" WHERE "id"= $1',
            values: [id]
        };
        const result = await client.query(query);
        
        return result.rows;
    },

    async getUserByEmail(email) {
        const query = {
            text: 'SELECT * FROM "user" WHERE "email" = $1',
            values: [email]
        };
        const result = await client.query(query);
        
        return result.rows;
    },

    async getUserByUsername(username) {
        const query = {
            text: 'SELECT * FROM "user" WHERE "username" = $1',
            values: [username]
        };
        const result = await client.query(query);
        return result.rows;
    },

    async createdUser(data) {
        const result = await client.query(
            'SELECT insert_user($1)',
            [data]
        );
        return result.rows
    },

    async updatedUser(data) {
        const result = await client.query(
            'SELECT updated_user($1)',
            [data]
        );
        return result.rows;
    },

    async deleteUser(id) {
        const query = {
            text: 'DELETE FROM "user" WHERE "id" = $1',
            values: [id]
        };
        const result = await client.query(query);
        return result.rows;
    }

}