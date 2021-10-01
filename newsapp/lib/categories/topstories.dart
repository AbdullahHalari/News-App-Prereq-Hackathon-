import 'package:newsapp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/components/customListTile.dart';
import 'package:newsapp/model/article_model.dart';

class Topstories extends StatefulWidget {
  @override
  _TopstoriesState createState() => _TopstoriesState();
}

class _TopstoriesState extends State<Topstories> {
  TopstoriesApi client = TopstoriesApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("News App", style: TextStyle(color: Colors.black)),
      //   backgroundColor: Colors.white,
      // ),

      //Now let's call the APi services with futurebuilder wiget
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<Article> articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}