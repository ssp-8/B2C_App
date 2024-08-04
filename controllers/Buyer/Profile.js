const express = require('express')
const client = require('../../database/connection')

const route = express.Router()

route.get('/',(req,res)=> {
    let id = req.params.id

    let getQuery = `Select * from "buyer"."buyer" where "id" = '${id}'`
    
    client.query(getQuery,(err,result)=> {

        if(err) {
            
            console.log(err)
            res.sendStatus(500)
        }
        else {
            res.json(result.rows)
        }
    })
})

route.put('/',(req,res)=> {
    let id = req.params.id
    let UpdateAttributes = req.body
    let UpdateKeys = Object.keys(UpdateAttributes)
    let updateQuery = `Update "buyer"."buyer" `
    if(UpdateKeys.length == 0) {
        res.sendStatus(412)
    }
    else {
        updateQuery+=' Set '
        for(i = 0; i < UpdateKeys.length;i++){
            updateQuery+=` "${UpdateKeys[i]}" = '${UpdateAttributes[UpdateKeys[i]]}'`
            if(i != UpdateKeys.length - 1) updateQuery+=' , '
        }
        updateQuery+=` where "id" = '${id}'`

        client.query(updateQuery,(err,result)=> {
            if(err) {
                console.log(err)
                res.sendStatus(500)
            }
            else {
                res.sendStatus(200)
            }
        })
    }
})
module.exports = route