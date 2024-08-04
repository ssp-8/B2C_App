const express = require("express")
const client = require("../../../database/connection")
const {v4:uuidv4} = require('uuid')
const route = express.Router()

route.get('/',(req,res)=>{

    let Filters = req.query
    let FilterKeys = Object.keys(Filters)
    
    let getQuery = `Select * from "product"."category"`

    if(FilterKeys.length != 0) getQuery+=' where '
    // Apply Filters
    for(i = 0;i < FilterKeys.length;i++){

        getQuery+=` "${FilterKeys[i]}" = '${Filters[FilterKeys[i]]}'`

        if(i != FilterKeys.length) getQuery+=' and '
    }

    getQuery+=`Order by name ASC`
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

    let Category = req.body
    let CategoryID = uuidv4()
    if(!Category.name) {

        res.sendStatus(412)
    }
    if(!Category.image) Category.image = ""

    if(!Category.subcategories) Category.subcategories = ""

    // Generating Sub Category IDs
    else {
        subcategories = Category.subcategories.split(',')

        for(i = 0; i < subcategories.length;i++){
            SubCategoryID = `${CategoryID}`+`_${i}`
            subcategories[i] = `${SubCategoryID}:${subcategories[i]}`
        }

        Category.subcategories = subcategories.toString()
    }

    let insertQuery = `insert into "product"."category" ("id","name","image","subcategories") values
    ('${CategoryID}','${Category.name}','${Category.image}','${Category.subcategories}')`


    client.query(insertQuery,(err,result)=>{
        
        if(err){

            console.log(err)
            res.status(500).send(err)

        }
        else {

            Category.id = CategoryID
            res.json(Category)
        }
    })
})

route.put('/:id',GetSubCategories(), async (req,res)=>{

    let CategoryID = req.params.id
    let updateQuery = `Update "product"."category" Set `
    let UpdateInfo = req.body
    let UpdateAttributes = Object.keys(UpdateInfo)
        
    for(i = 0; i < UpdateAttributes.length;i++){

        updateQuery+=` ${UpdateAttributes[i]} = '${UpdateInfo[UpdateAttributes[i]]}'`
        if(i != UpdateAttributes.length-1) updateQuery+=','
    }
    updateQuery+=` where "id" = '${CategoryID}'`

    console.log(updateQuery)
    client.query(updateQuery,(err,result)=>{
        if(err) {

            console.log(err)
            res.status(500)
        }
        else {

                res.sendStatus(200)
        }
    })
})

route.delete('/:id',(req,res)=>{

    let deleteQuery = `Delete from "product"."category" where "id" = '${req.params.id}'`

    client.query(deleteQuery,(err,result)=>{

        if(err){

            console.log(err)
            res.sendStatus(500)
        }
        else {

            let CategoryChangeQuery = `Update "product"."product" Set "category" = 'null' where "category" = '${req.params.id}'`

            client.query(CategoryChangeQuery,(err2,result2)=>{
                
                if(err2){

                    console.log(err2)
                    res.sendStatus(500)
                }
                else {

                    res.sendStatus(200)
                }
            }
        )
        }
    })
})

function GetSubCategories () {
    return (req,res,next)=>{
        UpdateInfo = req.body
        let UpdateAttributes = Object.keys(UpdateInfo)

        if (UpdateAttributes.length == 0){
    
            res.sendStatus(412)
        }
        else if(UpdateInfo.id) {
            res.sendStatus(401)
        }
        if(!UpdateInfo.subcategories) next()
        
        CategoryID = req.params.id
        let getQuery = `Select "subcategories" from "product"."category" where "id" = '${CategoryID}'`

        console.log(getQuery)
        let initalSubCategories = ""

        let lastsubCategoryID = -1

            client.query(getQuery, (err, result1) => {

                if (err) {
                    res.sendStatus(500)
                    console.log(err)
                }
                else {

                    console.log(result1.rows[0]["subcategories"])
                    initalSubCategories = result1.rows[0]["subcategories"]

                    if(initalSubCategories!= ""){
                    let subCategoryIDs = initalSubCategories.split(',')
                    lastsubCategoryID = subCategoryIDs[subCategoryIDs.length-1].split('_')[1]
                    lastsubCategoryID = lastsubCategoryID.split(':')[0]
                    }

                    let subcategories = UpdateInfo.subcategories.split(',')
                    console.log(lastsubCategoryID)
        
                    for(i = 0; i < subcategories.length;i++){
                    let SubCategoryID = `${CategoryID}`+`_${parseInt(i)+parseInt(lastsubCategoryID)+1}`
                    subcategories[i] = `${SubCategoryID}:${subcategories[i]}`

                    console.log(subcategories[i])
                }

                subcategories = subcategories.toString()
                if(initalSubCategories!= "")subcategories+=','
                subcategories+=initalSubCategories
                req.body.subcategories = subcategories
                next()
            }
        })
}
    }
module.exports = route