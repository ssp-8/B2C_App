const express = require("express")
const client = require("../../../database/connection")

const route = express.Router()

route.get('/',(req,res)=> {

    let getQuery = `Select * from "buyer"."buyer"`
    let Filters = req.query
    let FilterKeys = Object.keys(Filters)

    if(FilterKeys.length != 0) getQuery+=' where '
    for(i = 0; i < FilterKeys.length; i++){

        getQuery+=` "${FilterKeys[i]}" = '${Filters[FilterKeys[i]]}'`

        if(i != FilterKeys.length-1) getQuery+=' and '
    }

    client.query(getQuery,(err,result) => {

        if(err){

            console.log(err)
            res.sendStatus(500)
        }
        else {

            res.json(result.rows)
        }
    })
})

route.put('/:id',(req,res) => {

    let id = req.params.id

    if(req.body){

        if(!req.block) {

            res.sendStatus(401)
        }

        else {

            let updateQuery = `Update "buyer"."buyer" Set "block" = '${req.body.block}' where "id" = '${id}'`

            client.query(updateQuery,(err,result)=> {

                if(err){

                    console.log(err)
                    res.sendStatus(500)
                }
                else {

                    res.json(result.rows)
                }
            })
        }
    }

    else {
        res.sendStatus(412)
    }
})

module.exports = route