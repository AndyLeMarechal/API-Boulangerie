import pg from 'pg'
const client = new pg.Client(
    {
        user: process.env.PGUSER,
        password: process.env.PGPASSWORD,
        host: process.env.HOST,
        database: process.env.PGDATABASE,
        port: process.env.PGPORT
    }
);

await client.connect();

export default client;