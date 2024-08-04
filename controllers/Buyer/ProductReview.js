const express = require("express")
const client = require("../../database/connection")
const {v3:uuidv3} = require('uuid')

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

route.post('/',(req,res)=> {

    let Review = req.body
    if(!Review) {
        res.sendStatus(412)
    }
    else {
        Review.id = uuidv3()

        if(!Review.id || !req.params.id || !Review.product_id || !Review.rating) {

            res.sendStatus(412)
        }
        else {

            if(!Review.comment) Review.comment = ""
            if(!Review.photo) Review.photo = "NaN"
            if(!Review.category_id) Review.category_id = "NaN"
            if(!Review.date) {

                let date = Date.now()
                date = new Date(date)
                Review.date = `${date.getDate()} ${date.getMonth()+1} ${date.getFullYear()}`
            }
            
            let postQuery = `insert into "product"."product_review" ("id","buyer_id","product_id","category_id","rating","photo","comment","date")
            values ('${Review.id}','${req.params.id}','${Review.product_id}','${Review.category_id}','${Review.rating}','${Review.photo}','${Review.comment}','${Review.date}')`

            client.query(postQuery,(err,result) => {

                if(err) {
                    
                    console.log(err)
                    res.sendStatus(500)
                }
                else {
                    Review.buyer_id = req.params.id
                    res.json(Review)
                }
            })
        }
    }

})

route.delete('/:ReviewID',(req,res)=> {

    let ReviewID = req.params.ReviewID
    let deleteQuery = `Delete from "product"."product_review" where "id" = '${ReviewID}'`

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