import 'package:firstapp/main.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "About",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "courier new",
            fontSize: 35.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Text(
              "Diabetes Predictor will help you predict weather you will get  diabetes or not",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "courier new",
                fontSize: 26.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Text(
              "We are basically using Machine learning model behind the seen for predicting diabetes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "courier new",
                fontSize: 26.0,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child: Text(
              "Our Results:\nAccuracy 90%",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontFamily: "courier new",
                fontSize: 26.0,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: (){
              Navigator.push(context, MaterialPageRoute(
              builder:(context)=> MyApp(),
            )
              );
              },
                child:Text("Go to main page"),
                style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green))
                ),
          )
        ],
      ),
    );
  }
}