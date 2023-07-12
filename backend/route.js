const express = require('express')
const { register, signin } = require('./controller/userController')


const router=express.Router()

router.post('register',register)
router.post('sign_in',signin)
module.exports=router;