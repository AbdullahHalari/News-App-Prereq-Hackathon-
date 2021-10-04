import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:newsapp/model/article_model.dart';
class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
               preferredSize:Size.fromHeight(40),
        child: 
      AppBar(
        backgroundColor: Colors.black,
        title: Center(child:Text("Search News")),
       ) 
      ),
      body: Container(
      child: Column(
        children: [
         Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // width: 100,
                  height: 40,
                  child: TextField(
                      // onTap: () {
                      //   // showSearch(context: context, delegate: DataSearch());
                      // },
                      onSubmitted: (submittedText) {
                        showSearch(context: context, delegate: DataSearch());
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[300],
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black38,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(25)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(30)),
                          labelText: 'Seach')),
                ),
              ),
        ],
      ),
    ),
    );
  }
}
class DataSearch extends SearchDelegate<String> {
  final cities = [
    "dfghfd",
    "Zinger Burger",
    "Pepperoni Pizza",
    "hello",
    "fgdg",
    "Dfgdfgd",
    "dfgfdg",
    "tyry",
    "yerty",
  ];
  final recent = [
    "Dfgdfgd",
    "dfgfdg",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Column(
        children: [
 
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggest = query.isEmpty
        ? recent
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (contex, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggest[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggest[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggest.length,
    );
  }
}
