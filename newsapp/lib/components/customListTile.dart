import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/pages/articles_details_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/screens/favourite.dart';
import 'package:newsapp/screens/login.dart';

Widget customListTile(Article article, BuildContext context) {
  Future addTofav() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("favorites");
    return _collectionRef.doc(currentUser.email).collection("items").doc().set({
      "title": article.title,
      "images": article.urlToImage,
      "author": article.author,
    }).then((value) => Fluttertoast.showToast(msg: "item added"));
  }
// void check() {
//       if (FirebaseAuth.instance.currentUser == null) {
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
//       } else {
//         Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
//       }
//     }

  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
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
                  image: (article.urlToImage == null)
                      ? AssetImage('images/back1.jpg')
                      : NetworkImage(article.urlToImage),
                  // NetworkImage(article.urlToImage),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.black,
                        borderRadius: new BorderRadius.circular(60)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        article.source.name,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            article.title != null ? article.title : 'Breaking News',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(children: [
            // StreamBuilder(
            //   stream: FirebaseFirestore.instance
            //       .collection("favorites")
            //       .doc(FirebaseAuth.instance.currentUser.email)
            //       .collection("items")
            //       .where("title", isEqualTo: article.title)
            //       .snapshots(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.hasData) {
            //       return Padding(
            //         padding: const EdgeInsets.only(right: 8),
            //         child: IconButton(
            //           iconSize: 30,
            //           onPressed: () => snapshot.data.docs.length == 0
            //               ? addTofav()
            //               : Fluttertoast.showToast(msg: "Already Added"),
            //           icon: snapshot.data.docs.length == 0
            //               ? Icon(
            //                   Icons.favorite_outline,
            //                   color: Colors.black,
            //                 )
            //               : Icon(
            //                   Icons.favorite,
            //                   color: Colors.red,
            //                 ),
            //         ),
            //       );
            //     }
            //     return Login();
            //   },
            // ),
            SizedBox(
              width: 150,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                article.publishedAt != null
                    ? article.publishedAt
                    : '1 hour ago',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                ),
              ),
            ),
          ])
        ],
      ),
    ),
  );
}
