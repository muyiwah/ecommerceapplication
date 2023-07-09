const express = require('express')
const cors = require('cors')
const mongoose = require('mongoose')
const {success, error} = require ('consola')
const bodyParser = require('body-parser')
const { route } = require('./route')
require('dotenv').config()

const app = express()


//middle wares
app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:false}))

mongoose
  .connect('mongodb://localhost:27017/test', {   
    useNewUrlParser: true,
    useCreateIndex: true,
    useFindAndModify: false,
    useUnifiedTopology: true,
  })
  .then((response) =>
    success({ message: 'Database connected successfully', badge: true }),
  )
  .catch((err) => error({ message: 'Database connection failed', badge: true }))

// api routes
app.use('/api/', route)   
  
// create server
port = 7000
   
app.listen(port, () => { 
  success({ message: `server started on port ${port}`, badge: true })  
})
 