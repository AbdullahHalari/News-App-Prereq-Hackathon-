import 'package:newsapp/bottombar.dart';
// import 'package:newsapp/screens/login.dart';
// import 'package:demo/provider/my_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final storage = new FlutterSecureStorage();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // Future<bool> checklogin() async {
  //   String? value = await storage.read(key: "uid");
  //   if (value == null) {
  //     return false;
  //   }
  //   return true;
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => MyProvider()),
    //   ],
    //   child:
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: new ThemeData(
          // primaryColor: const Color(0xFF43a047),
          // accentColor: const Color(0xFFffcc00),
          primaryColorBrightness: Brightness.dark,
        ),
        home: Bottombar()
        // FutureBuilder(
        //     future: _initialization,
        //     builder: (context, snapshot) {
        //       // Check for Errors
        //       if (snapshot.hasError) {
        //         print("Something Went Wrong");
        //       }
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Center(child: CircularProgressIndicator());
        //       }
        //       return MaterialApp(
        //         title: 'Flutter Firebase EMail Password Auth',
        //         theme: ThemeData(
        //           primarySwatch: Colors.deepPurple,
        //         ),
        //         debugShowCheckedModeBanner: false,
        //         home: Bottombar(),
        //       );
        //     })
        );
  }
}
