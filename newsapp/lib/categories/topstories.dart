import 'package:newsapp/api_data/api_service.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/cards/newscard.dart';
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
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  newscard(articles[index], context),
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
