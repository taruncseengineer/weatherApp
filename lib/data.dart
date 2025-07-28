import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherApp/widget.dart';
import 'package:time_machine/time_machine.dart';
import 'Signup.dart';


class Example extends StatefulWidget {
  final User user;

  const Example({Key key, this.user}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List weatherdata;
  bool loading = false;
  Map<String, dynamic> apidata;
  Future fetchdata(String input) async {
    String url = "";
    try {
      var res = await http.get(url);
      if (res.statusCode == 200) {
        var jsonData = json.decode(res.body);
        setState(() {
          weatherdata = jsonData['data'];
          print(weatherdata);
        });
      } else {
        return Text("Somethings went wrong");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void onsummitfuntion(String input) {
    fetchdata(input);
  }

  List lucknowdata;
  Future lucknowfetchdata() async {
    String lucknowurl =
        "";
    var lucknowres = await http.get(lucknowurl);
    if (lucknowres.statusCode == 200) {
      var jsondata = json.decode(lucknowres.body);
      setState(() {
        lucknowdata = jsondata['data'];
        print(lucknowdata);
      });
    }
  }

  List delhidata;
  Future delhifetchdata() async {
    String lucknowurl =
        "";
    var lucknowres = await http.get(lucknowurl);
    if (lucknowres.statusCode == 200) {
      var jsondata = json.decode(lucknowres.body);
      setState(() {
        delhidata = jsondata['data'];
      });
    }
  }

  List kolkatadata;
  Future kolkatafetchdata() async {
    String lucknowurl =
        "";
    var lucknowres = await http.get(lucknowurl);
    if (lucknowres.statusCode == 200) {
      var jsondata = json.decode(lucknowres.body);
      setState(() {
        kolkatadata = jsondata['data'];
      });
    }
  }

  List bihardata;
  Future biharfetchdata() async {
    String lucknowurl =
        "=";
    var lucknowres = await http.get(lucknowurl);
    if (lucknowres.statusCode == 200) {
      var jsondata = json.decode(lucknowres.body);
      setState(() {
        bihardata = jsondata['data'];
      });
    }
  }

  List chandigarhdata;
  Future chandigarhfetchdata() async {
    String lucknowurl =
        "";
    var lucknowres = await http.get(lucknowurl);
    if (lucknowres.statusCode == 200) {
      var jsondata = json.decode(lucknowres.body);
      setState(() {
        chandigarhdata = jsondata['data'];
      });
    }
  }

  List bengalurudata;
  Future bengalurufetchdata() async {
    String lucknowurl =
        "";
    var lucknowres = await http.get(lucknowurl);
    if (lucknowres.statusCode == 200) {
      var jsondata = json.decode(lucknowres.body);
      setState(() {
        bengalurudata = jsondata['data'];
      });
    }
  }

  List mumbaidata;
  Future mumbaifetchdata() async {
    String lucknowurl =
        "";
    var lucknowres = await http.get(lucknowurl);
    if (lucknowres.statusCode == 200) {
      var jsondata = json.decode(lucknowres.body);
      setState(() {
        mumbaidata = jsondata['data'];
      });
    }
  }

  List jaipurdata;
  Future jaipurfetchdata() async {
    String lucknowurl =
        "";
    var lucknowres = await http.get(lucknowurl);
    if (lucknowres.statusCode == 200) {
      var jsondata = json.decode(lucknowres.body);
      setState(() {
        jaipurdata = jsondata['data'];
      });
    }
  }

  List chennaidata;
  Future chennaifetchdata() async {
    String lucknowurl =
        "";
    var lucknowres = await http.get(lucknowurl);
    if (lucknowres.statusCode == 200) {
      var jsondata = json.decode(lucknowres.body);
      setState(() {
        chennaidata = jsondata['data'];
      });
    }
  }

  List bhopaldata;
  Future bhopalfetchdata() async {
    String lucknowurl =
        "";
    var lucknowres = await http.get(lucknowurl);
    if (lucknowres.statusCode == 200) {
      var jsondata = json.decode(lucknowres.body);
      setState(() {
        bhopaldata = jsondata['data'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    lucknowfetchdata();
    delhifetchdata();
    mumbaifetchdata();
    chennaifetchdata();
    biharfetchdata();
    kolkatafetchdata();
    bengalurufetchdata();
    chandigarhfetchdata();
    jaipurfetchdata();
    bhopalfetchdata();
  }

  // print('Local Time: ${now.inLocalZone().toString('dddd yyyy-MM-dd HH:mm')}\n');
  var now = Instant.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgc,
      // Color(0xff96fffc),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GoodMorning(
              size: size,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  now.inLocalZone().toString('dd-MM-yyyy dddd'),
                  style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      color: color,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(left: 5, top: 5),
              height: 50,
              width: size.width * 0.90,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black.withOpacity(0.6), width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Enter Your Location. eg: Lucknow",
                    border: InputBorder.none),
                onSubmitted: (String input) {
                  setState(() {
                    onsummitfuntion(input);
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Searchresult(weatherdata: weatherdata)));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Lucknow(lucknowdata: lucknowdata),
            SizedBox(
              height: 10,
            ),
            Lucknow(lucknowdata: delhidata),
            SizedBox(
              height: 10,
            ),
            Lucknow(lucknowdata: mumbaidata),
            SizedBox(
              height: 10,
            ),
            Lucknow(lucknowdata: chennaidata),
            SizedBox(
              height: 10,
            ),
            Lucknow(lucknowdata: bihardata),
            SizedBox(
              height: 10,
            ),
            Lucknow(lucknowdata: kolkatadata),
            SizedBox(
              height: 10,
            ),
            Lucknow(lucknowdata: bengalurudata),
            SizedBox(
              height: 10,
            ),
            Lucknow(lucknowdata: chandigarhdata),
            SizedBox(
              height: 10,
            ),
            Lucknow(lucknowdata: jaipurdata),
            SizedBox(
              height: 10,
            ),
            Lucknow(lucknowdata: bhopaldata),
            SizedBox(
              height: 10,
            ),
          ],
        )),
      ),
    );
  }
}
