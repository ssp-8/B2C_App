const express = require("express")
const client = require("../../../database/connection")

const route = express.Router()

route.get('/',(req,res)=> {

    let Filters = req.query
    let FilterKeys = Object.keys(Filters)
    
    let getQuery = `Select * from "product"."product_review"`

    if(FilterKeys.length != 0) getQuery+=' where '

    // Apply Filters
    for(i = 0;i < FilterKeys.length;i++){

        getQuery+=` "${FilterKeys[i]}" = '${Filters[FilterKeys[i]]}'`
        
        if(i != FilterKeys.length - 1) getQuery+=' and '
    }

    getQuery += `Order by "date" ASC`
    client.query(getQuery,(err, result)=>{

        if(err){

            console.log(err)
            res.status(500).send(err)

        }
        else {

            res.json(result.rows)
        }
    })
})

route.delete('/:id',(req,res)=> {

    let id = req.params.id
    let deleteQuery = `Delete from "product"."product_review" where "id" = '${id}'`

    client.query(deleteQuery, (err,result)=> {

        if(err){

            console.log(err)
            res.sendStatus(500)
        }
        else {

            res.sendStatus(200)
        }
    })
})

module.exports = route