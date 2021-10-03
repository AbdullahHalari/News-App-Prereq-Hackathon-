import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newsapp/bottombar.dart';
import 'package:newsapp/main.dart';
import 'package:newsapp/screens/login.dart';

class Signup extends StatefulWidget {
  // const Signup({ Key? key }) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    final TextEditingController fnameController = TextEditingController();
    final TextEditingController lnameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController urlcontroller = TextEditingController();

    void register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;
      final String fname = fnameController.text;
      final String lname = lnameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;
      final String phone = phoneController.text;
      final String url = urlcontroller.text;
      try {
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await db.collection("users").doc(user.user.uid).set({
          "email": email,
          "first_name": fname,
          "last_name": lname,
          "password": password,
          "phone_number": phone,
          "url": url,
        });
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => Bottombar()));
        print("user is registerd");
      } catch (e) {
        print(e);
      }
      
    }

    return Scaffold(
        // backgroundColor: Colors.blue,
        body: Container(
          // color: Colors.red[900],
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/back3.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
                padding: EdgeInsets.all(3),
                child: ListView(
                  children: <Widget>[
                    Container(
                      // child: Image.asset('images/logohm.png',
                          // width: 100, height: 150),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(3),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: fnameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.white),
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                          labelText: 'First Name',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: lnameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Last Name',
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.white),
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                          labelText: 'Email',
                        ),
                      ),
                    ),
                     Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: phoneController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(),
                          
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Mobile Number',
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        style: TextStyle(color: Colors.red),
                        cursorColor: Colors.red,
                        controller: passwordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(),
                          suffix: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          hoverColor: Colors.amber[800],
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Password (at least 6 char)',
                          fillColor: Color.fromRGBO(255, 255, 255, 0.6),
                          filled: true,
                        ),
                      ),
                    ),
                   
                    Container(
                        // height: 50,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              // padding: EdgeInsets.fromLTRB(100, 0, 100, 0)
                            ),
                            // textColor: Colors.black,
                            // color: Colors.red,
                            child: Text('Sign up'),
                            onPressed: register)),
                   
                  ],
                ))));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
