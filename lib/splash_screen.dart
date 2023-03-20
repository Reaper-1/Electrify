import 'package:flutter/material.dart';
class getstarted extends StatelessWidget {
  const getstarted({Key? key}) : super(key: key);

  @override
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
              ],),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'ElectriFY',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text('KNOW YOUR ELECTRICITY BILL'),
              ),
              Container(
                alignment: Alignment.center,
                child: Text('ANYTIME...ANYWHERE...'),
              ),
              Image(image: AssetImage('assets/home2.png'),
                height: 100.0,width: 100.0,
              ),
              Padding(
                padding: EdgeInsets.only(left:30,right:30,top: 170),
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    child: Text('LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      //  elevation: 20,  // Elevation
                     // shadowColor: Colors.black,
                    ),
                  ),
                ),),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextButton(
                  child: Text('Dont have account? signup',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black45
                    ),),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),),
            ],
          ),)
    );}}
