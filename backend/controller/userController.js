const bcrypt = require('bcrypt');
const userModel = require('../model/userModel');
const product = require('../model/productModel');
module.exports.register = async (req, res, next) => {
  try {
    const { email, password, fullName } = req.body



    const checkUser = await userModel.findOne({ email: email })
    if (checkUser) {
      res.status(400).json({ message: "user already exists, please proceed to login" })
    } else {
      const salt = await bcrypt.genSalt(10)
      const hash = await bcrypt.hash(password, salt)
      const user = new userModel({ email, fullName, password: hash })
      const savedUser = await user.save(); console.log(user);
      const { ...other } = savedUser._doc;
      console.log(other);
      res.status(200).json({ message: 'succesful' })
    }

  } catch (error) {
    next(error)
  }
}



module.exports.signin = async (req, res) => {
  try {
    const { email, password } = req.body;
    console.log(email);
    console.log(req.body);
    if (email.length == 0 || password.length == 0) {
      console.log('failed');
      return res.json({ message: 'invalid entry' });
    }
    console.log('pssed');
    const user = await userModel.findOne({ email: email })
    console.log('other');

    if (!user) return res.status(400).json({ message: "no user found" })
    const userPassword = bcrypt.compare(password, user.password)
    if (!userPassword) return res.status(400).json({ message: "wrong passowrd" })
    if (userPassword) {
      const { password, ...other } = user._doc;
      console.log(user);
      return res.status(200).json({ message: "success", data: { other } })


    }

  }
  catch (e) {
    res.status(500).json({ message: 'error' })
  }

}

module.exports.addProduct = async (req, res) => {
  try {
    const { description, price, imageUrl, size } = req.body;
    console.log(price);
    const product2 = new product({ description: description, price: price, imageUrl: imageUrl, size: size })
    console.log(product2);
    const savedProduct = await product2.save();
    res.status(200).json(savedProduct)
  }
  catch (e) { }
}

module.exports.listProducts = async (req, res) => {
  try {
    const product2 = await product.find();
    res.status(200).json(product2)
  }
  catch (e) { res.status(500).json({ message: 'error' }) }
}

module.exports.addToCart = async (req, res) => {
  try {
    const { productId, userEmail } = req.body;
    console.log(userEmail);
    const userRef = await userModel.findOne({ email: userEmail });
    console.log(userRef);
    if (!userRef) return res.status(400).json({ message: 'no user found' })
    const product2 = await product.findOne({ _id: productId })
    console.log(product2);
    userRef.cart.push(product2);
    const savedUser = await userRef.save();
    console.log(savedUser);
    return res.status(200).json(savedUser)
  }
  catch (e) {
    res.status(500).json({ message: 'error' })
  }
}
module.exports.addPaidProducts = async (req, res) => {
  try {
    const { productId, email } = req.body; console.log(productId);
    const user = await userModel.findOne({ email: email })
    if (product.length == 0) return res.status(400).json({ message: "items not found" })
    for (let x = 0; productId.length > x; x++) {
      const shoe = await product.findById({ _id: productId[x] })
      user.bought.push(shoe);
      if (x == productId.length - 1) break;
    }
    user.cart = [];
    const savedUser = await user.save(); console.log(savedUser);
    return res.status(200).json(savedUser)

  }
  catch (e) {
    res.status(500).json({ message: 'error' })

  }
}