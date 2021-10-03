import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:bottom_bar/bottom_bar.dart';
import 'package:newsapp/check.dart';
import 'package:newsapp/screens/favourite.dart';

import 'package:newsapp/screens/home.dart';
import 'package:newsapp/screens/profile.dart';
import 'package:newsapp/screens/search.dart';
// import 'package:newsapp/screens/login.dart';
// import 'package:newsapp/screens/search.dart';
// import 'package:newsapp/screens/signup.dart';
// import 'package:newsapp/screens/profile.dart';
// import 'package:newsapp/screens/favourite.dart';
import 'package:newsapp/userprofile.dart';
import 'package:newsapp/userfavorite.dart';
import 'package:bottom_bars/bottom_bars.dart';

// class Bottombar extends StatefulWidget {
  
//   // const Bottombar({ Key? key }) : super(key: key);


//   @override
//   _BottombarState createState() => _BottombarState();
// }

// class _BottombarState extends State<Bottombar> {
//   int _currentPage = 0;
//   final _pageController = PageController();
//   @override
//   Widget build(BuildContext context) {
    
//     //  return WillPopScope(
//     //     onWillPop: () async {
//     //       // ScaffoldMessenger.of(context).showSnackBar(
//     //       //     SnackBar(content: Text('Please First login to enter the app')));
//     //       return false;
//     //     },
//        return Scaffold(
         
//       body: 
//       PageView(
        
//         controller: _pageController,
//         children: [
//           Home(),
//           Search(),
          
//         Userfavorite(),
//         Userprofile()
        
         
//         ],
//         onPageChanged: (index) {
//           setState(() => _currentPage = index);
//         },
//       ),
//       bottomNavigationBar: 
      
//       BottomBar(

//         selectedIndex: _currentPage,
//         onTap: (int index) {
//           _pageController.jumpToPage(index);
//           setState(() => _currentPage = index);
//         },
//         items: <BottomBarItem>[
//           BottomBarItem(
//             icon: Icon(Icons.home,
//             color: Colors.red,
//             ),
//             title: Text('Home'),
//             activeColor: Colors.red[900],
//           ),
//           BottomBarItem(
//             icon: Icon(Icons.search,color: Colors.red,),
//             title: Text('Search'),
//             activeColor: Colors.red[900],
//              darkActiveColor: Colors.greenAccent.shade400,
//           ),
//           BottomBarItem(
//             icon: Icon(Icons.favorite,color: Colors.red,),
//             title: Text('Favorites'),
//             activeColor: Colors.red[900],
//             darkActiveColor: Colors.red.shade400,
//           ),
          
//           BottomBarItem(
//             icon: Icon(Icons.person,color: Colors.red,),
//             title: Text('Profile'),
//             activeColor: Colors.red[900],
//           ),
//         ],
//       ),
//     );
//     // );
    
  
    
//   }
// }






class Bottombar extends StatefulWidget {
  
  // const Bottombar({ Key? key }) : super(key: key);


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
