import 'package:flutter/material.dart';
// import 'package:newsapp/screens/login.dart';
// import 'package:newsapp/screens/signup.dart';
import 'package:newsapp/categories/topstories.dart';
import 'package:newsapp/categories/technology.dart';
import 'package:newsapp/categories/health.dart';
import 'package:newsapp/categories/sport.dart';
import 'package:newsapp/categories/headlines.dart';
import 'package:newsapp/categories/entertainment.dart';
import 'package:newsapp/categories/business.dart';
import 'package:newsapp/categories/travel.dart';
import 'package:newsapp/categories/popular.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(  
        length: 9,  
        child: Scaffold(  
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(95),
            child: AppBar(  
            flexibleSpace: Container(
              height: 40,
              // width: 30,
    // decoration: 
    //   BoxDecoration(
    //     image: DecorationImage(
        
    //       image: AssetImage("images/logo.png",
    //       ),
          
    //       fit: BoxFit.fitWidth,
    //     ),
        
    //   ),
    child: Image.asset("images/logo.png",width: 30,),
  ),
            backgroundColor: Colors.red[900],
            // title: Text('Flutter Tabs Demo'),  
            bottom: TabBar(  
              isScrollable: true,
              labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
              tabs: [  
                Tab(text: "Top \n Stories"),  
                Tab(text: "Headlines"),  
                Tab(text: "Popular"),
                Tab(text: "Sports"),
                Tab(text: "Business"),
                Tab(text: "Technology"), 
                Tab(text: "Entertainment"),
                Tab(text: "Health"),
                Tab(text: "Travel"),
              ],  
            ),  
          ), 
          ), 
          body: TabBarView(  
            children: [  
               Topstories(),
               Headlines(),
               Popular(),
               Sports(),
               Business(),
               Technology(),
               Entertainment(),
               Health(),
               Travel(),
            ],  

          ),  
          
        ),  
      ),  
    );  
  }
}
