import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/bulb.gif')),
                  SizedBox(height: 10),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
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

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 52,
                      width: 200,
                      child: ElevatedButton(
                        child: Text('NEXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        onPressed: () {
                          Navigator.pushNamed(context, '/password');
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          String confirmPassword = _confirmPasswordController.text;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

          ),
        ),
      );

    }
  }

