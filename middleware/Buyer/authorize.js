const jwt = require("jsonwebtoken")

function getAccessToken (id) {
    return jwt.sign(id,process.env.ACCESS_TOKEN_SECRET,{expiresIn:'30d'});
}

function verifyBuyer () {

    return (req,res,next) => {
        authHeader = req.header("authorization")

        if(!authHeader) res.sendStatus(401)
        else {
            
            token = authHeader.split(' ')[1]

            jwt.verify(token,process.env.ACCESS_TOKEN_SECRET,(err,decoded)=> {

                if(err) res.sendStatus(401)
                else {
                    req.params.id = id
                    next()
                }
            })
        }
    }
}

module.exports = {getAccessToken,verifyBuyer}
