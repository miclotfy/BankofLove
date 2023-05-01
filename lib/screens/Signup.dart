import 'package:bankoflove/screens/SignIn.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isPassword= true;

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
                  child: Image.asset('assets/images/img_undrawcouplelovere3fw6.png'),
                ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  width: width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius:const BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w900),),
                        const SizedBox(height: 25,),
                        Container(
                          width: width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration.collapsed(hintText:'Email Address'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Container(
                          width: width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: isPassword,
                                    decoration: InputDecoration.collapsed(hintText:'Password'),
                                  ),
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
                              }, icon:const Icon(Icons.remove_red_eye))
                            ],
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Container(
                          width: width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: isPassword,
                                    decoration: InputDecoration.collapsed(hintText:'confirm Password'),
                                  ),
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
                              }, icon:const Icon(Icons.remove_red_eye))
                            ],
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Container(
                          width: width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: MaterialButton(
                            onPressed: (){

                            },
                            child: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                          ),

                        ),
                        const SizedBox(height: 25,),

                        GestureDetector(
                            onTap: () {
                              onTapTxtOrsignin(
                                  context);
                            },

                            child: Text(
                                "Or sign In",
                                overflow:
                                TextOverflow
                                    .ellipsis,
                                textAlign:
                                TextAlign
                                    .left,
                                style: TextStyle(color: Colors.red,fontSize: 20,

                                )
                            )),

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
  onTapTxtOrsignin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
  }
}
