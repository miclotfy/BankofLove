import 'package:bankoflove/screens/Signup.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key, });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


 // final String title;

  @override
  State<SignIn> createState() => _SignIn();
}

class _SignIn extends State<SignIn> {

  bool isPassword= true;
  String _errorMessage = '';



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                width: width,
                height: 300,
                child: Center(
                  child: Image.asset('assets/LoveHP.png'),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: width,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),topRight:Radius.circular(50)
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sign In ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800)),
                      const SizedBox(height: 25,),
                      Container(
                        width: width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              onChanged: (val){
                                validateEmail(val);

                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration.collapsed(hintText: 'Email Address'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25,),
                      Container(
                        width: width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: isPassword,
                                    decoration: InputDecoration.collapsed(hintText: ' Password'),
                                  ),
                                ),
                                IconButton(onPressed: (){
                                  if(isPassword){
                                    setState(() {
                                      isPassword= false;
                                    });
                                  }else{
                                    setState(() {
                                      isPassword = true;
                                    });
                                  }
                                  print(isPassword);

                                }, icon:const Icon(Icons.remove_red_eye))
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),

                      Container(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,6,13,0),
                                child: Text('Forget Password?'),
                              )),
                            ],
                          )
                      ),
                      const SizedBox(height: 25,),
                      Container(
                        width: width,
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.red,
                        ),
                        child: MaterialButton(
                          onPressed: (){

                          },
                          child: Text('Sign In',style: TextStyle(fontSize: 20,color: Colors.white),),
                        ),
                      ),

                      const SizedBox(height: 20,),



                      GestureDetector(
                          onTap: () {
                            onTapTxtOrsignup(
                                context);
                          },

                              child: Text(
                                  "Or sign up",
                                  overflow:
                                  TextOverflow
                                      .ellipsis,
                                  textAlign:
                                  TextAlign
                                      .left,
                                  style: TextStyle(color: Colors.red,fontSize: 20,

                                  )
                                      )),




                      const SizedBox(height: 20,),
                      Container(
                        width: width,
                        child: Center(
                            child: Text(_errorMessage, style: TextStyle(color: Colors.red),),
                          ),
                        ),


                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );


  }

  onTapTxtOrsignup(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
  }
  void validateEmail(String val) {
    print('innn');
    if(val.isEmpty){
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    }else{
      setState(() {

        _errorMessage = "";
      });
    }
  }
}

