import 'dart:convert';

import 'package:flutter/material.dart';
import 'main.dart';
import 'objects/navigation_menu.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Icon custIcon = Icon(Icons.search);
  Widget custSearchBar = Text("IMPRV");

  //portrait
  Widget portrait() {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString("assets/data/data.json"),
        builder: (context, snapshot) {
          var myData = json.decode(snapshot.data.toString());
          if (myData == null) {
            return Center(
              child: Text(
                "Loading",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            );
          } else {
            return Center(
              child: Text(
                myData["items"][0]["name"],
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }

  //landscape
  Widget landscape() {
    return Row(
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.red)),
        Container(
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.blue)),
      ],
    );
  }

  // builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.custIcon.icon == Icons.search) {
                  this.custIcon = Icon(Icons.cancel);
                  this.custSearchBar = TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search"),
                      style: TextStyle(color: Colors.white, fontSize: 16.0));
                } else {
                  this.custIcon = Icon(Icons.search);
                  this.custSearchBar = Text("IMPRV");
                }
              });
            },
            icon: custIcon,
          ),
        ],
        elevation: 20.0,
        title: custSearchBar,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.red[400], Colors.red[800]])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/logo.png",
                          height: 80.0,
                          width: 80,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("IMPRV",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                    ),
                  ],
                ),
              ),
            ),
            CustomListTile(Icons.person, "Personal Progression", () => {}),
            CustomListTile(Icons.list, "To Do", () => {}),
            CustomListTile(Icons.book, "Courses", () => {}),
            CustomListTile(Icons.settings, "Settings", () => {}),
            CustomListTile(Icons.logout, "Logout", () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (MyLoginPage())));
            }),
          ],
        ),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return portrait();
        } else {
          return landscape();
        }
      }),
    );
  }
}
