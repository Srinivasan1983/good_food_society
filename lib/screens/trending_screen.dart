import 'package:flutter/material.dart';
import 'package:good_food_society/utils/custom_card_list.dart';
import 'package:good_food_society/screens/home_screen.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trending Foods"
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
          child: Column(
            children: <Widget>[
              CustomCardList(text: "Apple"),
              CustomCardList(text: "Yogurt"),
              CustomCardList(text: "Nuts"),
              CustomCardList(text: "Bitter Lemon"),
              CustomCardList(text: "Granola"),
              CustomCardList(text: "Sweet Potatoes"),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()),
                    );
                  },
                  child: Image.asset('images/home.png')
              ),
            ],
          )
      ),
    );
  }
}

