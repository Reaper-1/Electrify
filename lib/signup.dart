import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  void main() =>
      runApp(MyApp());
   Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              const Color(0xFFFFFF),
              const Color(0xFFFFFF),
            ],
          ),
        ),
        child: Form(
          child: Center(
            child: ListView(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/bulb.gif')),
                    //SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(right: 35,left: 35),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Consumer ID',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(right: 35,left: 35),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(right: 35,left: 35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode : AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                      ),
                    ),
                    SizedBox(height: 10),

                SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(right: 35,left: 35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                ? 'Enter min. 6 characters'
                : null,
            ),
          ),
          SizedBox(height: 10),
          Container(padding: EdgeInsets.only(right: 35,left: 35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 52,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  signUp();
                  Navigator.pushNamed(context, '/login');
                  //String email = _emailController.text;
                  String password = _passwordController.text;
                  String confirmPassword = _confirmPasswordController.text;
                },
                child: Text('SIGN IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            ),],
                        ),
                      ),
        ),
                  ),
              );
    }

    Future signUp() async {
     final isValid = formKey.currentState!.validate();
     if (!isValid) return;

     showDialog(
         context: context,
         barrierDismissible: false,
         builder: (context) => Center(child: CircularProgressIndicator()),
     );
     
     try{
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: _emailController.text.trim(),
           password: _passwordController.text.trim(),
       );
     } on FirebaseAuthException catch (e) {
       print(e);
     }
     navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
  }

  class DatabaseService {

  }

