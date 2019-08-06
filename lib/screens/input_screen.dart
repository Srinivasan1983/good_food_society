import 'package:flutter/material.dart';
import 'package:good_food_society/screens/output_screen.dart';
import 'package:good_food_society/utils/consts.dart';
import 'package:good_food_society/screens/home_screen.dart';


class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String foodName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 50, right: 50, bottom: 10),
          child: Container(
            child: ListView(
              children: <Widget>[

                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),

                  decoration: kTextFieldInputDecoration,

                  onChanged: (value) {
                    foodName = value;
                  },
                ),

                SizedBox(
                  height: 150,
                ),

                FlatButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => OutputScreen(foodName: foodName)),
                  );

                },
                    child: Image.asset('images/result.png')),
                SizedBox(
                  height: 100,
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
            ),
          ),
        ),
      ),
    );
  }

}
