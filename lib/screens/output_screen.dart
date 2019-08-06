import 'package:flutter/material.dart';
import 'dart:async';
import 'package:good_food_society/screens/home_screen.dart';
import 'package:good_food_society/services/API.dart' as foodAPI;
import 'package:good_food_society/utils/custom_card_list.dart';

class OutputScreen extends StatefulWidget {
  final String foodName;

  OutputScreen({@required this.foodName});

  @override
  _OutputScreenState createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  dynamic data;
  bool isLoading = true;

  Future<void> getData() async {
    final decoded = await foodAPI.getData(widget.foodName);
    setState(() {
      isLoading = false;
      data = decoded;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : Container(
                      child:
                      !(data?.containsKey('_links') ?? true && data['error'] == "bad_request")
                            ? CustomCardList(text: 'Invalid Input')
                            : Container(
                          child: Column(
                            children: <Widget>[
                              CustomCardList(
                                  text:
                                  "Energy: ${data['parsed'][0]['food']['nutrients']['ENERC_KCAL']} kCal"),
                              CustomCardList(
                                  text:
                                  "Protien: ${data['parsed'][0]['food']['nutrients']['PROCNT']} g"),
                              CustomCardList(
                                  text:
                                  "Fat: ${data['parsed'][0]['food']['nutrients']['FAT']} g"),
                              CustomCardList(
                                  text:
                                  "Carbs: ${data['parsed'][0]['food']['nutrients']['CHOCDF']} g"),
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
                          )
                      ),
                    ),
            ),
          ),
        ));
  }
}



