const express = require("express")
const client = require("../../database/connection")
const route = express.Router()

route.get('/',(req,res)=>{

    let Filters = req.query
    let FilterKeys = Object.keys(Filters)
    
    let getQuery = `Select * from "product"."product"`

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

route.get('/:ProductID',(req,res)=> {

    let ProductID = req.params.ProductID
    let getQuery = `Select * from "product"."product" where "id" = '${ProductID}'`

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

module.exports = route