import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/bottombar.dart';
import 'package:newsapp/pages/articles_details_page.dart';
import 'package:newsapp/screens/home.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  String collectionName = "favorites";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
    //          leading: IconButton(
    // icon: Icon(Icons.arrow_back, color: Colors.white),
    // onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bottombar())),
  // ),
            title: Center(child: Text("YOUR FAVORITES")),
            automaticallyImplyLeading: false,

            backgroundColor: Colors.black,
            // leading: IconButton(
            //   onPressed: () {
            //     Navigator.of(context).pushReplacement(
            //       MaterialPageRoute(
            //         builder: (ctx) => Home(),
            //       ),
            //     );
            //   },
            //   icon: Icon(Icons.close),
            // ),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(collectionName)
              .doc(FirebaseAuth.instance.currentUser.email)
              .collection("items")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Something is wrong"),
              );
            }

            return ListView.builder(
                itemCount:
                    snapshot.data == null ? 0 : snapshot.data.docs.length,
                itemBuilder: (_, index) {
                  DocumentSnapshot _documentSnapshot =
                      snapshot.data.docs[index];
                  void deleteitem() {
                    FirebaseFirestore.instance
                        .collection(collectionName)
                        .doc(FirebaseAuth.instance.currentUser.email)
                        .collection("items")
                        .doc(_documentSnapshot.id)
                        .delete();
                  }

                  return 
                  // Column(
                  //   children: [
                  //     Container(
                  //       color: Colors.grey[100],
                  //       child: Row(
                  //         children: [
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Container(
                  //               height: 70,
                  //               width: 70,
                  //               child: Container(
                  //                 decoration: new BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(5),
                  //                   image: new DecorationImage(
                  //                       fit: BoxFit.fill,
                  //                       image:(_documentSnapshot['images'] == null)
                  //                     ? AssetImage('images/back1.jpg')
                  //                     : NetworkImage(_documentSnapshot['images']) 
                  //                       // NetworkImage(
                  //                       //     _documentSnapshot['images'])
                  //                       ),
                  //                 ),
                  //               )),
                  //           SizedBox(
                  //             width: 40,
                  //           ),
                  //           Container(
                  //             child: Column(
                  //               children: [
                  //                 Container(
                  //                   width: 140,
                  //                   child: Text(_documentSnapshot['title']),
                  //                 ),
                  //                 SizedBox(
                  //                   height: 10,
                  //                 ),
                  //                 // Container(
                  //                 //   width: 140,
                  //                 //   child: Text(
                  //                 //     "\$ ${_documentSnapshot['price']}",
                  //                 //     style: TextStyle(
                  //                 //         fontWeight: FontWeight.bold,
                  //                 //         color: Colors.red),
                  //                 //   ),
                  //                 // ),
                  //                 // Container(
                  //                 //   child:counter().
                  //                 // )
                  //               ],
                  //             ),
                  //           ),
                  //           // SizedBox(
                  //           //   width: 60,
                  //           // ),
                  //           Expanded(
                  //             child: Align(
                  //                 //  alignment: Alignment.topRight,
                  //                 child: IconButton(
                  //               icon: Icon(
                  //                 Icons.delete,
                  //                 size: 30,
                  //               ),
                  //               alignment: Alignment(20, 0),
                  //               onPressed: () {
                  //                 deleteitem();

                  //                 Fluttertoast.showToast(msg: "item removed");
                  //               },
                  //             )),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Divider(
                  //       height: 10,
                  //       thickness: 2,
                  //     ),
                  //   ],
                  // );
                  InkWell(
    onTap: () {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ArticlePage(
      //               article: article,
      //             )));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.red[100],
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height

              image: DecorationImage(
                  image: (_documentSnapshot['images'] == null)
                      ? AssetImage('images/back1.jpg')
                      : NetworkImage(_documentSnapshot['images']),
                  // NetworkImage(article.urlToImage),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20.0),
            ),
            // child: Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //         decoration: new BoxDecoration(
            //             color: Colors.black,
            //             borderRadius: new BorderRadius.circular(60)),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             article.source.name,
            //             style: TextStyle(
            //               color: Colors.red,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 20,
            //             ),
            //           ),
            //         )),
            //   ),
            // ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _documentSnapshot['title'] != null ? _documentSnapshot['title'] : 'Breaking News',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(children: [
            Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteitem();
                    })),
            SizedBox(
              width: 150,
            ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Text(
            //     article.publishedAt != null
            //         ? article.publishedAt
            //         : '1 hour ago',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 10.0,
            //     ),
            //   ),
            // ),
          ])
        ],
      ),
    ),
  );
                });
          },
        ),
        // bottomNavigationBar: Container(
          
        //   child: StreamBuilder(
        //     stream: FirebaseFirestore.instance
        //         .collection(collectionName)
        //         .doc(FirebaseAuth.instance.currentUser.email)
        //         .collection("items")
        //         .snapshots(),
        //     builder: (BuildContext context, snapshot) {
        //       if (snapshot.hasError) return Text('Something went wrong');
        //       if (snapshot.connectionState == ConnectionState.waiting)
        //         return Text("wait..");

        //       // NB: I set the value of total = 0; so that anytime the stream
        //       // builder is called, total starts from 0.
        //       total = 0;
        //       snapshot.data.docs.forEach((result) {
        //         total += result.data()['price'];
        //       });
        //       print(total);
        //       print('done');
        //       return ListTile(
        //         title: Text("Total Amount"),
        //         subtitle: Text(
        //           "$total",
        //           style: TextStyle(
        //             color: Colors.green[900],
        //           ),
        //         ),
        //         trailing: Container(
        //           width: 160,
        //           child: ElevatedButton(
        //             child: Text("CHECK OUT"),
        //               style: ElevatedButton.styleFrom(
        //                   shape: new RoundedRectangleBorder(
        //                     borderRadius:
        //                         new BorderRadius.circular(30.0),
        //                   ),
        //                   primary: Colors.amber,
        //                   // padding: EdgeInsets.fromLTRB(
        //                   //     100, 10, 100, 10)
        //                   ),
        //               onPressed: () {
        //               },
        //               )
        //         ),
        //       );
        //     },
        //   ),
        // )
     
        );
  }
}
