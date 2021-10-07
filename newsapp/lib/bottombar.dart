import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/screens/home.dart';
import 'package:newsapp/screens/search.dart';
import 'package:newsapp/checkuser/userprofile.dart';
import 'package:newsapp/checkuser/userfavorite.dart';
import 'package:bottom_bars/bottom_bars.dart';

class Bottombar extends StatefulWidget {
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

     return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: BottomBars(
      
      items: [
              
        BottomBarsItem(
          
          page: 
          Scaffold(
            body: 
          
            Home(),
            
          ),

          item: Item(
            activeColor: Colors.amber,
           color: Colors.red[900],
            icon: Icons.home,iconSize: 30,
            title: Text("Home"),
            
          ),
          
        ),
        BottomBarsItem(
          page: Scaffold(
           body: Search(),
          ),
          

          item: Item(
            activeColor: Colors.amber,
            color: Colors.red[900],
            icon: Icons.search_rounded,iconSize: 30,
            title: Text("Search",),
          ),
        ),
        BottomBarsItem(
          page: Scaffold(
            
             body: userfavorite(),
          ),
          item: Item(
            activeColor: Colors.amber,
            color: Colors.red[900],
            icon: Icons.favorite_border,iconSize: 30,
            title: Text("Favorite"), 
          ),
        ),
        BottomBarsItem(
          page: Scaffold(
            body: userprofile(),
          ),
          item: Item(
           activeColor: Colors.amber,
            icon: Icons.person,iconSize: 30,
            title: Text("Profile"),
            color: Colors.red[900],
          ),
          
        ),
        
      ],),
    );
    
  
    
  }
}
