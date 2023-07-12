const bcrypt = require('bcrypt');
const user = require('../model/user');

module.exports.register = async (req, res, next) => {
    try { 
      const { email, password, fullName  } = req.body
      console.log(req.body);
    
    
        const checkUser = await user.findOne({ email: email })
        if (checkUser) { 
          res.status(400).json({message: "user already exists, please proceed to login"})
        } else {
          const salt = await bcrypt.genSalt(10) 
          const hash = await bcrypt.hash(password, salt)
          const user = new userModel({ email, password, fullName , password: hash })
       
          
           res.status(200).json({ message: 'succesful' })
        }
       
    } catch (error) { 
      next(error) 
    }
  }

  module.exports.signin = async (req, res, next) => {
    try{
    } catch (error) {
      next(error);
    }
  };


  module.exports.siginin = async (req, res)=>{
try{
const{email, password}=req.body;
if(email.length==o ||password.length==0)return res.json({message:'invalid entry'});
const user= user.findOne({email:email})
if(!user)return res.status(400).json({message:"no user found"})
const userPassword =await bycrypt.copare(password, user.password)
if(!userPassword) return res.status(400).json({message:"wrong passowrd"})
if(userPassword){
const  {password, ...other}=user._doc;
return res.status(200).json({message:"success", data:{other}})

}




}
catch(e){
res.status(500).json({message:'error'})
}

  }