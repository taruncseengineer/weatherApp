import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:weatherApp/Signup.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:weatherApp/data.dart';
import 'package:weatherApp/widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String name;
  Future _singin() async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      ))
          .user;
      if (user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Example(user: user)));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            // image: DecorationImage(
            //     image: AssetImage("assets/images/bg1.jpeg"),
            //     fit: BoxFit.cover)
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg1.jpeg"),
                        fit: BoxFit.cover)),
                height: MediaQuery.of(context).size.height * 0.50,
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(29),
                                  topRight: Radius.circular(29))),
                          width: MediaQuery.of(context).size.width,
                          // child: Placeholder(),
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome",
                                style: TextStyle(
                                    color: color,
                                    letterSpacing: 1.5,
                                    // fontStyle: FontStyle.italic,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text("Weather Hub",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: color,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "It is provide the current weather\nreport in all city in India.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ))
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
             
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: color),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                height: 60,
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextField(
                  onChanged: (val) {
                    email = val;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
                        color: color,
                      ),
                      hintText: "E-mail",
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: color),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                height: 60,
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextField(
                  obscureText: true,
                  onChanged: (val) {
                    password = val;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: color,
                      ),
                      hintText: "Password",
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => _singin(),
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: color),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 30,
                          color: txc,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Are You Resigter?",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        " SignUp!",
                        style: TextStyle(
                            fontSize: 20,
                            color: txc,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
