const express = require("express")
const client = require("../../../database/connection")
const {v4:uuidv4} = require("uuid")

const route = express.Router()

route.get('/',(req,res) => {

    let Filters = req.query
    let FilterKeys = Object.keys(Filters)
    let getQuery = `Select * from "product"."carousel"`
    
    if(FilterKeys.length != 0) getQuery+=' where '
    for(i = 0; i < FilterKeys.length;i++){

        getQuery+=` "${FilterKeys[i]}" = '${Filters[FilterKeys[i]]}'`
        if(i != FilterKeys.length-1) getQuery+=' and '
    }

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

route.post('/',(req,res) => {

    let Carousel = req.body
    if(!Carousel && (!Carousel.name || !Carousel.image)) res.sendStatus(412)
    else {
        if(!Carousel.url) Carousel.url = "NaN"
        Carousel.id = uuidv4()

        let insertQuery = `insert into "product"."carousel" ("id","name","image","url")
        values ('${Carousel.id}','${Carousel.name}','${Carousel.image}','${Carousel.url}')`

        client.query(insertQuery,(err,result) => {

            if(err) {

                console.log(err)
                res.sendStatus(500)
            }
            else {

                res.json(Carousel)
            }
        })
    }
})

route.put('/:id',(req,res) => {

    let id = req.params.id
    let Carousel = req.body

    if(!Carousel) res.sendStatus(412)
    
    else {
    let CarouselAttributes = Object.keys(Carousel)
    let updateQuery = `Update "product"."carousel" Set `

    for(i = 0; i < CarouselAttributes.length; i++) {

        updateQuery+=` "${CarouselAttributes[i]}" = '${Carousel[CarouselAttributes[i]]}'`
        if(i != CarouselAttributes.length-1) updateQuery+=', '
    }
    updateQuery+=` where "id" = '${id}'`

    client.query(updateQuery, (err,result) => {

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

route.delete('/:id',(req,res) => {

    let id = req.params.id
    let deleteQuery = `Delete from "product"."carousel" where "id" = '${id}'`

    client.query(deleteQuery,(err,result)=> {

        if(err) {

            console.log(err)
            res.sendStatus(500)
        }
        else {

            res.sendStatus(200)
        }
    })
})

module.exports = route