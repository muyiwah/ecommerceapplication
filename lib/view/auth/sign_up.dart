

import 'package:ecommercapp/controller/user_controller.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  static const routeName = '/create-account';
  CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullnameController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
  }
void showSnack(context,text){ ScaffoldMessenger.of(context).showSnackBar
(SnackBar(backgroundColor: Colors.blue, content: Text(text),),);
}
  final  _fullnameController = TextEditingController();

  final  _emailController = TextEditingController();

  final  _confirmPasswordController =
      TextEditingController();


  final  _passwordController = TextEditingController();

  final _signUpformKey = GlobalKey<FormState>();
  
UserController userController =UserController();
Future registerUser()async{print('dfd');
 var res= await userController.register(onSuccess, _fullnameController.text, _passwordController.text, _emailController.text, context);
}
void onSuccess(){}
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 1, bottom: 18, right: 18, left: 18),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const Padding(
                    padding:  EdgeInsets.only(top: 1.0),
                    child: Column(
                      children:  [
                        Text(
                          'Create an Account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Sign-up for access to our content',
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _signUpformKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child:  TextFormField(controller: _fullnameController,
                          validator: (value) {
                            if(value==null||value.isEmpty){return "please enter some text";} 
                            return null;
                          },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Name ',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child:  TextFormField(controller: _emailController,
            validator: (value) {
                            if(value==null||value.isEmpty){return "please enter full name";} 
                            return null;
                          },  decoration:const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Email ',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child:  TextFormField(controller: _passwordController,
            validator: (value) {
                            if(value==null||value.isEmpty){return "please enter your email";} 
                            return null;
                          },  decoration:const InputDecoration(
                border: OutlineInputBorder(),
                label:  Text(
                  'Password ',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child:  TextFormField(controller: _confirmPasswordController,
            validator: (value) {
                            if(value==null||value.isEmpty){return "please enter your password";} 
                            return null;
                          },  decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Confirm Password ',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
                        ),
                        
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: Size(screenSize - 20, 50)),
                      onPressed: (() {
                            if (!_signUpformKey.currentState!.validate()) {
                 }
                  else  if (_passwordController.text !=
                            _confirmPasswordController.text) {
                     
  showSnack(context,"make sure your passwords are thesame");
                          } else if (_passwordController.text.length <3) {
  showSnack(context," password too short");
                        }
                        else{
                     registerUser();

                        } }),
                      child:
                        const  Text('Next', style: TextStyle(color: Colors.white))),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Have an account?",
                          style: TextStyle(fontSize: 13),
                        ),
                        InkWell(
                          onTap: () {
                          },
                          child:const Text(
                            'Log in',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
