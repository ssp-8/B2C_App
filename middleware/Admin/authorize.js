function AdminLoggedIn () {

    return (req,res,next) => {

        if(process.env.LOGIN == "true"){

            next()
        }
        else {
            res.sendStatus(401)
        }
    }
}

module.exports = {AdminLoggedIn}