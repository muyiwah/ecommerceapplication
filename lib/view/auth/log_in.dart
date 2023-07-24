import 'package:ecommercapp/controller/user_controller.dart';
import 'package:flutter/material.dart';

import '../../model/user.dart';

class LogIn extends StatelessWidget {
   LogIn({super.key});
TextEditingController _passwordController=TextEditingController();
TextEditingController _emailController =TextEditingController();
  UserController _userController=UserController();
void logUserIn(context)async{print(_passwordController.text);
_userController.signin(_passwordController.text, _emailController.text, context);
}


void onSucess(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back_sharp,
          color: Colors.black,
          size: 18,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
                       height: MediaQuery.of(context).size.height,
        
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(children: [
                    const Positioned(
                      top: 35,
                      child: Text(
                        'SHOE',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ),
                    const Positioned(
                      left: 30,
                      top: 60,
                      child: Text(
                        'HOUSE',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.green),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      top: 25,
                      child: Transform.rotate(
                        angle: 1.58,
                        child: Text(
                          'BEST',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.green),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
               TextField(controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Email Address',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
               TextField(controller: _passwordController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye_rounded),
                  border: OutlineInputBorder(),
                  label: Text(
                    'Password ',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              Text(
                'forgot Password?',
                style: TextStyle(color: Colors.grey),
              ),
              Center(
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(260, 50),
                ),
                onPressed: () {logUserIn(context);},
                child: Text('Log in'),
              )),
             const Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '_____________________',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '  or  ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '_____________________',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.face),
                  Icon(Icons.face),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  InkWell(
                    onTap: () {
                      print('sign up');
                    },
                    child: Text(
                      '  Sign Up',
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
