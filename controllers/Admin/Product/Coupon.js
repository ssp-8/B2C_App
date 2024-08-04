const express = require("express")
const {v4:uuidv4} = require("uuid")
const client = require("../../../database/connection")

const route = express.Router()

route.get('/',(req,res)=> {

    let Filters = req.query
    let FilterKeys = Object.keys(Filters)
    let getQuery = `Select * from "product"."coupon"`
    
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

route.post('/',(req,res)=>{

    let Coupon = req.body
    Coupon.id = uuidv4()

    if(!Coupon && (!Coupon.code || !Coupon.name || !Coupon.amount)) res.sendStatus(412)
    else {
    if(!Coupon.buyerid) Coupon.buyerid = "NaN"
    if(!Coupon.validity) Coupon.validity = "NaN"
    if(!Coupon.date) {

        let date = new Date(Date.now())
        Coupon.date = `${date.getDate()} ${date.getMonth()+1} ${date.getFullYear()}`
    }

    let insertQuery = `insert into "product"."coupon" ("id","code","name","date","buyerid","validity","amount")
    values ('${Coupon.id}','${Coupon.code}', '${Coupon.name}', '${Coupon.date}','${Coupon.buyerid}', '${Coupon.validity}' ,'${Coupon.amount}')`

    client.query(insertQuery,(err,result) => {

        if(err) {

            console.log(err)
            res.sendStatus(500)
        }

        else {

            res.json(Coupon)
        }
    })
}
})

route.put('/:id',(req,res) => {

    let id = req.params.id
    let Coupon = req.body

    if(!Coupon) res.sendStatus(412)
    
    else {
    let CouponAttributes = Object.keys(Coupon)
    let updateQuery = `Update "product"."coupon" Set `

    for(i = 0; i < CouponAttributes.length; i++) {

        updateQuery+=` "${CouponAttributes[i]}" = '${Coupon[CouponAttributes[i]]}'`
        if(i != CouponAttributes.length-1) updateQuery+=', '
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
    let deleteQuery = `Delete from "product"."coupon" where "id" = '${id}'`

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