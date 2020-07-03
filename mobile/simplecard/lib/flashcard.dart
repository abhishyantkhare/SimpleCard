import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardContent {
  final String content;

  CardContent({this.content});

  factory CardContent.fromJson(Map<String, dynamic> json) {
    return CardContent(content: json['content']);
  }
}

class FlashCard extends StatefulWidget {


  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  Future<CardContent> futureCardContent;
  var url = 'http://localhost:5000/card';

  Future<CardContent> fetchFlashcardResponse() async {
    final response = await http.get(url);
    return CardContent.fromJson(json.decode(response.body));
  }

  @override
  void initState() {
    super.initState();
    futureCardContent = fetchFlashcardResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          child: Center(
            child: FutureBuilder<CardContent>(future: futureCardContent, builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.content);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
          ),
          width: 300,
          height: 100,
        ),
      ),
    );
  }
}

