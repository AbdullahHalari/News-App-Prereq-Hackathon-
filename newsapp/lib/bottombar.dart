import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:newsapp/check.dart';
import 'package:newsapp/screens/favourite.dart';

import 'package:newsapp/screens/home.dart';
import 'package:newsapp/screens/profile.dart';
// import 'package:newsapp/screens/login.dart';
// import 'package:newsapp/screens/search.dart';
// import 'package:newsapp/screens/signup.dart';
// import 'package:newsapp/screens/profile.dart';
// import 'package:newsapp/screens/favourite.dart';

class Bottombar extends StatefulWidget {
  
  // const Bottombar({ Key? key }) : super(key: key);


  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _currentPage = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    
    //  return WillPopScope(
    //     onWillPop: () async {
    //       // ScaffoldMessenger.of(context).showSnackBar(
    //       //     SnackBar(content: Text('Please First login to enter the app')));
    //       return false;
    //     },
       return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Home(),
          // Test(),
          // Test(),
          // Test(),
        Favorites(),
        Checklogin(),
        
          // Home(),
          // Search(),
          // Search(),
          // // Favorites(),
          // Profile()

          // Container(color: Colors.blue),
          // Container(color: Colors.red),
          // Container(color: Colors.greenAccent.shade700),
          // Container(color: Colors.orange),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: 
      
      BottomBar(

        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home,
            color: Colors.red,
            ),
            title: Text('Home'),
            activeColor: Colors.red[900],
          ),
          BottomBarItem(
            icon: Icon(Icons.search,color: Colors.red,),
            title: Text('Search'),
            activeColor: Colors.red[900],
             darkActiveColor: Colors.greenAccent.shade400,
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite,color: Colors.red,),
            title: Text('Favorites'),
            activeColor: Colors.red[900],
            darkActiveColor: Colors.red.shade400,
          ),
          
          BottomBarItem(
            icon: Icon(Icons.person,color: Colors.red,),
            title: Text('Profile'),
            activeColor: Colors.red[900],
          ),
        ],
      ),
    );
    // );
    
  
    
  }
}
