const express = require("express")
const AdminRoute = require('./routes/admin')
const BuyerRoute = require('./routes/buyer')
require("dotenv").config()

const app = express()

let PORT = process.env.PORT || 5000

app.listen(PORT,()=>{
    console.log(`Started Listening at port ${PORT}`)
})

app.use(express.urlencoded({extended:false}))
app.use(express.json())

app.use('/apis/v1/admin',AdminRoute)
app.use('/apis/v1/buyer',BuyerRoute)