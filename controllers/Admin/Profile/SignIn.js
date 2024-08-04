const express = require("express")

const route = express.Router()

route.get('/',(req,res)=>{

    let admin = req.header("X-cred")
    
    if(!admin){

        process.env.LOGIN = false
        res.sendStatus(500)
    }
    else if(admin.split(' ')[0] == process.env.ADMINNAME && admin.split(' ')[1] == process.env.PASSWORD){

        process.env.LOGIN = true
        res.sendStatus(200)

    }
    else {

        process.env.LOGIN = false
        res.sendStatus(401)

    }

    
})


module.exports = route