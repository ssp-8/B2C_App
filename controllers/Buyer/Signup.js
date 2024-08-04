const express = require('express')
const client = require('../../database/connection')
const pass = require('js-sha512')
const {v4: uuidv4} = require('uuid')

const route = express.Router()

route.post('/', (req, res)=>{
    let buyer = req.body

    buyer.id = uuidv4()
    if(!buyer) res.sendStatus(412)
    else if((!buyer.id || !buyer.name || !buyer.mail || !buyer.phone || !buyer.password)) res.sendStatus(412)
    
    else {
        if(!buyer.addressline_1) buyer.addressline_1 = "NaN"
        if(!buyer.addressline_2) buyer.addressline_2 = "NaN"
        if(!buyer.addressline_3) buyer.addressline_3 = "NaN"
        if(!buyer.city) buyer.city = "NaN"
        if(!buyer.state) buyer.state = "NaN"
        if(!buyer.country) buyer.country = "NaN"
        if(!buyer.pincode) buyer.pincode = "NaN"
        if(!buyer.block) buyer.block = "False"
    }
    
    let signupQuery = `insert into "buyer"."buyer" ("id" ,"name","mail","phone","password","addressline-1","addressline-2",
    "addressline-3","city","state","country","pincode","block")
    values ('${buyer.id}','${buyer.name}','${buyer.mail}','${buyer.phone}','${pass.sha512(buyer.password)}','${buyer.addressline_1}','${buyer.addressline_2}',
    '${buyer.addressline_3}','${buyer.city}','${buyer.state}','${buyer.country}','${buyer.pincode}','${buyer.block}')`
    console.log(signupQuery)
    client.query(signupQuery, (err, result)=>{

        if(err){
            console.log(err)
            res.sendStatus(500)
        }

        else{
           res.json(buyer)
        }

    })
})

module.exports = route