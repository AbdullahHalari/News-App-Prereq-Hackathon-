import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/bottombar.dart';
import 'package:newsapp/screens/login.dart';
import 'package:newsapp/screens/profile.dart';

class Checklogin extends StatefulWidget {
  const Checklogin({Key key}) : super(key: key);

  @override
  _CheckloginState createState() => _CheckloginState();
}

class _CheckloginState extends State<Checklogin> {
  @override
  Widget build(BuildContext context) {
    void check() {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile()));
      }
    }

    

    return Scaffold(
      body: Container(
        child: ElevatedButton(
            onPressed: () {
              //
              check();
             
            },
            child: Text("login")),
            
      ),
    );
  }
}
