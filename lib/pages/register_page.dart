import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {

  final VoidCallback showLoginPage;
  const SignUp({Key?key,required this.showLoginPage}): super(key:key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();

  Future signUp() async{

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context)=>Center(child:CircularProgressIndicator())
      );

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:_emailController.text.trim(), 
        password: _passwordController.text.trim()
        );
    }on FirebaseAuthException catch(e){
      print(e);
    }
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body:SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children:[
              const Icon(
                Icons.emoji_people_outlined,
                size:70),
                const SizedBox(height:30),
              const Text(
                'Hop On Aboard!',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),

                SizedBox(height:13),
                const Text(
                'Please Register Below!',style:TextStyle(
                  fontSize: 20,
                )),

                SizedBox(height:37),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        )
                        ),
                      fillColor:Colors.white,
                      filled: true,
                      hintText: 'Email'
                    ),
                  ),
                ),

                SizedBox(height:20),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal:20),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        )
                        ),
                      fillColor:Colors.white,
                      filled: true,
                      hintText: 'Password'
                    ),
                  ),
                ),

                SizedBox(height:30),

                GestureDetector(
                  onTap: () => signUp(),
                  child: Container(
                    height:60,
                    width:350,
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child:const Center(
                      child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        ),)
                    ),
                  ),
                ),

                SizedBox(height:15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('I am a member! '),

                    GestureDetector(
                      onTap:widget.showLoginPage,
                      child: Text(
                        'Login Now',
                         style: TextStyle(
                           color:Colors.blue,
                           fontWeight: FontWeight.bold),),
                    )
                  ],
                )
                

            ],),
        ),
      )
      

    );
  }
}