import 'package:flutter/material.dart';
import './home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/home': (context) => home(),
          '/login': (context) => MyLoginPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'loginUi',
        theme: ThemeData(primarySwatch: Colors.red),
        home: MyLoginPage());
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String textToDisplay;
  String textInputted;

  void changetext() {
    setState(() {
      textToDisplay = textInputted;
    });
  }

  void loginCheck() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 120.0,
                  width: 120,
                ),
              ),
              Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      height: 300.0,
                      width: 380.0,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 25.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 25.0),
                            child: TextField(
                              autocorrect: false,
                              autofocus: false,
                              style: TextStyle(fontSize: 20.0),
                              decoration: InputDecoration(
                                  hintText: "Username",
                                  border: InputBorder.none,
                                  fillColor: Colors.grey[200],
                                  contentPadding: EdgeInsets.all(15.0)),
                            ),
                          ),
                          TextField(
                            autocorrect: false,
                            autofocus: false,
                            obscureText: true,
                            style: TextStyle(fontSize: 20.0),
                            decoration: InputDecoration(
                                hintText: "Password",
                                border: InputBorder.none,
                                fillColor: Colors.grey[200],
                                contentPadding: EdgeInsets.all(15.0)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text("Forgot Password ?",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                          MaterialButton(
                              onPressed: () {
                                // make an authenticator here
                                Navigator.pushNamed(context, '/home');
                              },
                              minWidth: 250.0,
                              color: Colors.red,
                              splashColor: Colors.red[800],
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text("Login",
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
