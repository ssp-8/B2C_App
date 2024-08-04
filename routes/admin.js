const express = require("express")

const SignInRoute = require('../controllers/Admin/Profile/SignIn')
const SignOutRoute = require('../controllers/Admin/Profile/SignOut')
const ProductRoute = require('../controllers/Admin/Product/Product')
const ProductReviewRoute = require('../controllers/Admin/Product/ProductReview')
const CategoryRoute = require('../controllers/Admin/Product/Category')
const BuyerRoute = require('../controllers/Admin/Buyer/Buyer')
const CouponRoute = require('../controllers/Admin/Product/Coupon')
const CarouselRoute = require('../controllers/Admin/Product/CarouselController')
const Authorizer = require('../middleware/Admin/authorize')

const route = express.Router()

route.use('/signin',SignInRoute)
route.use('/signout',SignOutRoute)

route.use(Authorizer.AdminLoggedIn())

route.use('/product',ProductRoute)
route.use('/category',CategoryRoute)
route.use('/buyer',BuyerRoute)
route.use('/product_review',ProductReviewRoute)
route.use('/coupon',CouponRoute)
route.use('/carousel',CarouselRoute)

module.exports = route