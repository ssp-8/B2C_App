const {Client} = require('pg')

const client = new Client({
    host:process.env.host,
    user:'postgres',
    port:5432,
    password:'alpha',
    database: "B2C",
})

client.connect()

console.log("Database Connected")

module.exports = client