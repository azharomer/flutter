import 'package:flutter/material.dart';

class TripDetail extends StatelessWidget {
  static const routeName = 'TripDetailWidget';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.red,
        title: Text('My Trip', style: TextStyle(color: Colors.red)),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Source :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Expanded(flex: 3, child: Text("Egypt,Assiut")),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text("Destination :",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(flex: 3, child: Text("Egypt,Cairo")),
                ],
              ),
            ),
            // 2

            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text("Qty :",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(flex: 3, child: Text("123 KG")),
                ],
              ),
            ),
            // 3

            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text("Product Type :",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(flex: 3, child: Text("glasses")),
                ],
              ),
            ),
            // 4

            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text("Product :",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(flex: 3, child: Text("####")),
                ],
              ),
            ),
            // 5

            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: new RaisedButton(
                  elevation: 5.0,
                  color: Colors.blue[700],
                  child: new Text("Start the Trip",
                      style: new TextStyle(
                          fontFamily: 'Manjari',
                          fontSize: 15.0,
                          color: Colors.white)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/tabs',
                        arguments: {"id": 1});
                    // Navigator.pushReplacementNamed(context, '/tabs');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
