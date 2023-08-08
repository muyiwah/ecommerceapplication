const express = require('express')
const { register, signin, listProducts, addToCart, addProduct, addPaidProducts } = require('./controller/userController')


const router = express.Router()

router.post('/register', register)
router.post('/sign_in', signin)
router.post('/add-product', addProduct)
router.get('/list-products', listProducts)
router.post('/add-to-cart', addToCart)
router.post('/add-paid-products', addPaidProducts)
module.exports = router; 