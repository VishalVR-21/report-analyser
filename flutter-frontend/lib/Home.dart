import 'dart:html';

import 'package:flutter/material.dart';
import 'about.dart';
import 'main.dart';

class Homepage extends StatelessWidget {

  String url = "data:image/jpeg;base64,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";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      alignment: Alignment.center,
      color: Colors.lightGreen,
        child:Column(
        children:[
                Container(
                  alignment: Alignment.center,
                    child:Text("This is the app for diabetes predictor")),
          ClipRect(
            child: Image.network(url,width:500,height: 500,fit: BoxFit.cover,)
          ),
    SizedBox(
      height:100, width: 100,
    ),
    Container(
      alignment: Alignment.bottomCenter,
      child: Center(
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
      ),
    )
        ],
            ),
          );
  }
}
