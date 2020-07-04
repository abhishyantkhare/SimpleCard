import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simplecard/deck.dart';


class FlashCardWidget extends StatefulWidget {
  @override
  _FlashCardWidgetState createState() => _FlashCardWidgetState();
}

class _FlashCardWidgetState extends State<FlashCardWidget> {
  Future<Deck> futureDeck;
  var url = 'http://localhost:5000/deck';

  Future<Deck> fetchDeck() async {
    final response = await http.get(url);
    return Deck.fromJson(json.decode(response.body));
  }

  @override
  void initState() {
    super.initState();
    futureDeck = fetchDeck();
  }
   
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child:Container(
          child: Center(
            child: FutureBuilder<Deck>(future: futureDeck, builder: (context, snapshot) {
              if (snapshot.hasData) {
                var firstCard = snapshot.data.cards[0];
                return Text(firstCard.content);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
              })
            ),
            width: 300,
            height: 100,
        )
      )
    );
  }
}


