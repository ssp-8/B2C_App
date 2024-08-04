const express = require("express")
const route = express.Router()
const Authorizer = require("../middleware/Buyer/authorize")

const SignUpRoute = require('../controllers/Buyer/Signup')
const SignInRoute = require('../controllers/Buyer/SignIn')
const ProfileRoute = require('../controllers/Buyer/Profile')
const ProductRoute = require('../controllers/Buyer/Product')
const ReviewRoute = require('../controllers/Buyer/ProductReview')

route.use('/signup',SignUpRoute)
route.use('/signin',SignInRoute)

route.use(Authorizer.verifyBuyer());

route.use('/profile',ProfileRoute)
route.use('/product',ProductRoute)
route.use('/product_review',ReviewRoute)

module.exports = route