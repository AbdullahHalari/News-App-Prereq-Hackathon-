import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/login.dart';
import 'package:newsapp/screens/profile.dart';


// class Userprofile extends StatefulWidget {
//   const Userprofile({Key key}) : super(key: key);

//   @override
//   _UserprofileState createState() => _UserprofileState();
// }

// class _UserprofileState extends State<Userprofile> {
//   @override
//   Widget build(BuildContext context) {
//     User user = FirebaseAuth.instance.currentUser;
//     return  FutureBuilder<FirebaseFirestore>(
//             // future: FirebaseAuth.instance.currentUser,
//             builder: (BuildContext context, AsyncSnapshot<FirebaseFirestore> snapshot){
//                        if (snapshot.hasData){
//                            FirebaseFirestore user = snapshot.data; // this is your user instance
//                            /// is because there is user already logged
//                            return Profile();
//                         }
//                          /// other way there is no user logged.
//                          return Login();
//              }
//           );
//   }
// }
Widget userprofile() {
  User user = FirebaseAuth.instance.currentUser;
  if (user != null) {
   return Profile();
    //signed out
  } else {
    return Login();
    //signed in
  }
}

