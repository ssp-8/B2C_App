const express = require("express")

const route = express.Router()

route.post('/',(req,res)=>{

    if(process.env.LOGIN == "true"){

        process.env.LOGIN = false
        res.sendStatus(200)
    }
    else {

        res.sendStatus(401)
    }
})

module.exports = route