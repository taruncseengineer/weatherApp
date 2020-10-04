import 'package:flutter/material.dart';
import 'package:weatherApp/data.dart';
import 'package:weatherApp/login.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weatherApp/widget.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email;
  String password;
  String username;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String name;
  void signup() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
            email: email.trim(), password: password))
        .user;
    final user1 = _auth.currentUser;

    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
    assert(user1.uid == user.uid);
  }

  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // String name;
  // String emailgoogle;
  // String photoUrl;
  // Future<String> googlesignin() async {
  //   final GoogleSignInAccount googleSignInAccount =
  //       await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount.authentication;
  //   final AuthCredential authCredential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken);
  //   final UserCredential userCredential =
  //       await _firebaseAuth.signInWithCredential(authCredential);
  //   final User user = userCredential.user;
  //   assert(user.displayName != null);
  //   assert(user.email != null);
  //   assert(user.photoURL != null);
  //   if (userCredential != null) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => Example()));
  //   }
  //   setState(() {
  //     name = user.displayName;
  //     emailgoogle = user.email;
  //     photoUrl = user.photoURL;
  //   });
  //   final User currentUser = await _firebaseAuth.currentUser;
  //   assert(currentUser.uid == user.uid);
  //   return "Login";
  // }

  // final FacebookAuth _facebookAuth = FacebookAuth.instance;
  // Future<String> _facebooklogin() async {
  //   final LoginResult result = await _facebookAuth.login();
  //   final FacebookAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(result.accessToken.token);
  //   final UserCredential userCredential =
  //       await _auth.signInWithCredential(facebookAuthCredential);
  //   if (userCredential != null) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => Example()));
  //   }
  //   return "Log In";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg2.jpeg"),
                        fit: BoxFit.cover)),
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width,
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
                        top: MediaQuery.of(context).size.height * 0.30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "WeatherHub",
                                style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.5,
                                    // fontStyle: FontStyle.italic,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text("Register",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ))
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: color,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                height: 60,
                width: MediaQuery.of(context).size.width * 0.90,
                child: TextField(
                  autocorrect: true,
                  onChanged: (val) {
                    username = val;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: color,
                      ),
                      hintText: "Username",
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: color,
                    ),
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
                    border: Border.all(
                      width: 2,
                      color: color,
                    ),
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
                height: 10,
              ),
              InkWell(
                onTap: () => signup(),
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color,
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up!",
                      style: TextStyle(
                          fontSize: 30,
                          color: txc,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color,
                  ),
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
              // Container(
              //   height: 80,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       InkWell(
              //         onTap: () => googlesignin(),
              //         child: CircleAvatar(
              //           radius: 27,
              //           backgroundColor: Colors.white,
              //           backgroundImage:
              //               AssetImage("assets/images/social1.png"),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 20,
              //       ),
              //       // InkWell(
              //       //   onTap: () => _facebooklogin(),
              //       //   child: CircleAvatar(
              //       //     radius: 27,
              //       //     backgroundColor: Colors.white,
              //       //     backgroundImage:
              //       //         AssetImage("assets/images/social2.png"),
              //       //   ),
              //       // )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
