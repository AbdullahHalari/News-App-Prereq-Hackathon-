import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/favourite.dart';
import 'package:newsapp/screens/login.dart';
import 'package:newsapp/bottombar.dart';

import 'package:flutter/cupertino.dart';

Widget userfavorite() {
  User user = FirebaseAuth.instance.currentUser;
  if (user != null) {
   return Favorites();
  } else {
    return Login();
  }
}
