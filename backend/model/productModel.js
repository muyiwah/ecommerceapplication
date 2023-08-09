const mongoose = require('mongoose')
const productModel = new mongoose.Schema({
    size: {
        type: String,
        required: true,
    },
    description: { type: String },
    price: {
        type: String,
        required: true
    },
    imageUrl: {
        type: String,
        required: true
    },
    track: {
        type: String,
        default: '0'
    }
})

const product = mongoose.model('product', productModel)
module.exports = product;