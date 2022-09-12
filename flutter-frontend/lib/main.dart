
import 'dart:convert';

import 'package:flutter/material.dart';
import 'about.dart';
import 'package:http/http.dart' as http;
import 'package:firstapp/Home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    )
  );
}


String gl,pl,bp,sk,di,ag,il;
var result ;
var pregnant;
var glucose;
var bloodpressure;
var skin;
var insulin;
var mass;
var diabetes;
var age;
var rvalue;



class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  ag()  async {
    var r = await http.post(
      Uri.http(
        "http://127.0.0.1:5000/",
        "cgi-bin/diabetes.py",
        {
          "pregnant": pregnant,
          "glucose": glucose,
          "bloodpressure": bloodpressure,
          "skin": skin,
          "insulin": insulin,
          "mass": mass,
          "diabetes": diabetes,
          "age": age,
        },
      ),
    );
  }
 Future res() async {
    var result= await http.get(
        Uri.http("//127.0.0.1:5000/", "cgi-bin/diabetes.py"));
       var  new_result = jsonDecode(result.body);
    print(new_result);
  }

void init()
{
  super.initState();
  ag();
  res();
}

Card textinput(var label,String variable)
{
  return  Card(
    color: Colors.blueGrey,
    child: TextField(
      keyboardType:
      TextInputType.numberWithOptions(decimal: true),
      onChanged: (variable) => label = variable,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: "courier new",
        fontSize: 24.0,
      ),
      decoration:
      InputDecoration(hintText: "PLease enter"+variable ),
    ),
  );
}


  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        child: Center(
          child: IconButton(
            mouseCursor:MouseCursor.defer,
            iconSize: 29.0,
            onPressed: res,
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30.0,
            ), 
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            alignment: Alignment.topLeft,
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                backgroundColor: Colors.white,
                title: Text(
                  "Diabetes Predictor",
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    fontFamily: "courier new",

                  ),
                ),
                //                        About 
                children: [  
                  Column(
                    children: [
                      Card(
                        color: Colors.green,
                        shadowColor:Colors.white,
                        borderOnForeground: true,
                        child:ListTile(
                          trailing:IconButton(
                            onPressed: ()=> Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:(context)=> About(),
                              ),
                            ),
                            icon: Icon(Icons.apps_rounded),
                          ),
                          title: Text(
                            "About App",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontFamily: "courier new,"
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            icon: Icon(
              Icons.contacts,
              color: Colors.black,
              size: 35.0,
            ),
          ),
        ),
        title: Center(
          child: Text(
            "Diabetes predictor",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "courier new",
              fontSize: 35.0,
            ),
          ),
        ),
      ),

        //                     BODY 
      body: Container(
        color: Colors.white30,
        child: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                    //                               RESULT(output)
                  Text(
                      // ignore: unnecessary_brace_in_string_interps
                    "Result:$rvalue",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontFamily: "courier new",
                        fontSize:20.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: SafeArea(
                        child: ListView(
                          children: [
                           // textinput(pregnant, pl),
                            Card(
                              color: Colors.white,
                              child: TextField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal:true ) ,
                                onChanged: (pg) => pregnant = pg ,
                                style: TextStyle(
                                  fontFamily: "courier new",
                                  fontSize:24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(hintText: "Number of time pregnant"),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (gl) => glucose = gl,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "Glucose Concentration" ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (bp) => bloodpressure = bp,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "Diastolic Blood Pressure(mm Hg)" ),
                              ),
                            ),
                              Card(
                              color: Colors.white,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (sk) => skin = sk,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "Tricep skin fold thickness (mm)" ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (il) => insulin = il,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "2-Hour Serum insulin(mu U/ml)" ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (ma) => mass = ma,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "Body mass index" ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (db) => diabetes = db,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:
                                InputDecoration(hintText: "Body mass index" ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              child: TextField(
                                keyboardType: 
                                TextInputType.numberWithOptions(decimal: true),
                                onChanged: (ag) => age = ag,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "courier new",
                                  fontSize: 24.0,
                                ),
                                decoration:InputDecoration(hintText: "Age" ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder:(context)=> About(),
                    ));
                  }, child:
                  Text("Click to go to the home button",style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                      style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green))
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder:(context)=> Homepage(),
                        ));
                  }, child:
                  Text("Click to go to the home button",style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                      style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green))
                  )
                  ],
                ),
            );
          }
        ),
        ),
      );
  }
}
 