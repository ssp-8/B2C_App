const express = require("express")
const client = require("../../database/connection")
const pass = require('js-sha512')
const Authorizer = require("../../middleware/Buyer/authorize")

const route = express.Router()

route.get('/',(req,res) => {

    let buyer = req.body
    if(!buyer.name || !buyer.password) res.sendStatus(412)
    else {

        let getQuery = `Select "id" from "buyer"."buyer" where "name" = '${buyer.name}' and "password" = '${pass.sha512(buyer.password)}'`

        client.query(getQuery,(err,result)=> {

            if(err) {

                console.log(err)
                res.sendStatus(500)
            }
            else {

                if(result.rowCount == 1) {

                    let token = Authorizer.getAccessToken(result[0]["id"])
                    res.setHeader("X-Token",token)
                    res.sendStatus(200)
                }
                else {
                    res.sendStatus(500)
                }
            }
        })
        }
})

module.exports = route