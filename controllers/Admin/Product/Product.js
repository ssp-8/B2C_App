const express = require("express")
const client = require("../../../database/connection")
const {v4:uuidv4} = require('uuid')
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

route.post('/',(req,res)=>{

    let Product = req.body
    let ProductID = uuidv4()
    Product.id = ProductID

   

    if(!Product || !Product.id || !Product.name || !Product.company || 
        !Product.qty || !Product.price || !Product.description || !Product.category){

            res.status(412).json({"message":"Incomplete Information"})
        }
    else {

        if(!Product.active) Product.active = 'Yes'
        if(!Product.block) Product.block = "No"
        if(!Product.discount) Product.discount = "0.0"
        if(!Product.date) {
            let date = new Date(Date.now())
            Product.date = `${date.getDate()} ${date.getMonth()+1} ${date.getFullYear()}`
        }
        if(!Product.rating) Product.rating = "NaN"
        if(!Product.images) Product.images = "NaN"
        if(!Product.specific_attributes) Product.specific_attributes = "NaN"
        if(!Product.videos) Product.videos = "NaN"
        if(!Product.obj) Product.obj = "NaN"
        
        let insertQuery = `insert into "product"."product" ("id","name","company","qty","price","description","category","active","block","discount","date","subcategory","rating","specific_attributes","images","videos","obj")
        values ('${Product.id}','${Product.name}','${Product.company}','${Product.qty}','${Product.price}','${Product.description}','${Product.category}','${Product.active}','${Product.block}','${Product.discount}','${Product.date}','${Product.subcategory}','${Product.rating}','${Product.specific_attributes}','${Product.images}','${Product.videos}','${Product.obj}')`

        client.query(insertQuery,(err,result)=>{

            if(err){

                console.log(err)
                res.sendStatus(500)
            }
            else {

                res.json(Product)
            }
        })
    }
    
})

route.put('/:id',(req,res)=> {

    id = req.params.id
    UpdateInfo = req.body
    UpdateAttributes = Object.keys(UpdateInfo)
    let updateQuery = `Update "product"."product" Set `

    for(i = 0; i < UpdateAttributes.length;i++){

        updateQuery+=` "${UpdateAttributes[i]}" = '${UpdateInfo[UpdateAttributes[i]]}'`
        if(i != UpdateAttributes.length -1) updateQuery+=', '
    }

    updateQuery+=` where "id" = '${id}'`
    console.log(updateQuery)

    client.query(updateQuery,(err,result)=>{

        if(err){

            console.log(err)
            res.sendStatus(500)
        }

        else {
            res.json(result.rows)
        }
    })
})

route.delete('/:id',(req,res)=> {

    let id = req.params.id
    let deleteQuery = `Delete from "product"."product" where "id" = '${id}'`

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