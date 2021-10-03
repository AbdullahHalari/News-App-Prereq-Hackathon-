import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/favourite.dart';
import 'package:newsapp/screens/login.dart';
import 'package:newsapp/bottombar.dart';

// import 'package:newsapp/screens/favorite.dart';

// class Userfavorite extends StatefulWidget {
//   const Userfavorite({Key key}) : super(key: key);

//   @override
//   _UserfavoriteState createState() => _UserfavoriteState();
// }

// class _UserfavoriteState extends State<Userfavorite> {
//   @override
//   Widget build(BuildContext context) {
//     User user = FirebaseAuth.instance.currentUser;
//     return  FutureBuilder<User>(
//       future: FirebaseAuth.instance.currentUser,
//       builder: (BuildContext context, AsyncSnapshot<User> snapshot){
//                  if (snapshot.hasData){
//                      User user = snapshot.data; // this is your user instance
//                      /// is because there is user already logged
//                      return Favorites();
//                   }
//                    /// other way there is no user logged.
//                    return Login();
//        }
//     );
//   }
// }
import 'package:flutter/cupertino.dart';

Widget userfavorite() {
  User user = FirebaseAuth.instance.currentUser;
  if (user != null) {
   return Favorites();
    //signed out
  } else {
    return Login();
    //signed in
  }
}
