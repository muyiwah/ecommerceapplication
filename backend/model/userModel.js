const mongoose = require('mongoose')
const userModel =new mongoose.Schema({
    name:{type:String},
email:{type: String,
unique:true,
required:true},
password:{type:String},
role:{type:String,
default:'user',
enum:['user','admin']},
cart:[],
bought:[]})
const user =mongoose.model('user',userModel)
module.exports =user; 