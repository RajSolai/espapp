import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Future<void> makeRequest(String gpio, String ctrl) async {
    if (gpio == "test") {
      await http
          .get("http://192.168.4.1/test" + "/" + ctrl)
          .then((data) => {print(data.body)})
          .catchError((err) => {print(err), _noEspAlert()});
    } else {
      await http
          .get("http://192.168.4.1/gpio/" + gpio + "/" + ctrl)
          .then((data) => {print(data.body)})
          .catchError((err) => {print(err), _noEspAlert()});
    }
  }

  Future<void> _noEspAlert() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Text("ESP not found"),
            content: Text(
                "Hey, It seems You are not connected to ESP's Wifi AP(Hotspot)"),
            actions: <Widget>[
              CupertinoButton(
                  child: Text("Okay"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  Future<void> _espRouterAlert() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Text("ESP AP Details"),
            content: Container(
              height: 105.0,
              child: Column(children: <Widget>[
                Text(
                  "SSID (WiFi Name) :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  "ESPap",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  "PASSWORD :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5.0),
                Text(
                  "thereisnospoon",
                  style: TextStyle(fontSize: 18.0),
                )
              ]),
            ),
            actions: <Widget>[
              CupertinoButton(
                  child: Text("Okay"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Esp Control"), actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 22.0),
              child: GestureDetector(
                  onTap: () => _espRouterAlert(), child: Icon(Icons.router)))
        ]),
        body: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Container(height: 260.0, child: Image.asset("assets/esp.png")),
            // SizedBox(
            // 	height:20
            // ),
            // Container(
            // 	child: Row(
            // 		mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // 		children:<Widget>[
            // 			CupertinoButton(
            // 				color: Color(0xFFff0800),
            // 				child: Text("2 off"),
            // 				onPressed: ()=>makeRequest('test','off')
            // 			),
            // 			CupertinoButton(
            // 				color: Color(0xFF53d769),
            // 				child: Text("2 on"),
            // 				onPressed: ()=>makeRequest('test','on')
            // 			),
            // 		]
            // 	)
            // ),
            SizedBox(height: 20),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  CupertinoButton(
                      color: Color(0xFFff0800),
                      child: Text("3 off"),
                      onPressed: () => makeRequest('3', 'off')),
                  CupertinoButton(
                      color: Color(0xFF53d769),
                      child: Text("3 on"),
                      onPressed: () => makeRequest('3', 'on')),
                ])),
            // SizedBox(
            // 	height:20
            // ),
            // Container(
            // 	child: Row(
            // 		mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // 		children:<Widget>[
            // 			CupertinoButton(
            // 				color: Color(0xFFff0800),
            // 				child: Text("4 off"),
            // 				onPressed: ()=>makeRequest('4','off')
            // 			),
            // 			CupertinoButton(
            // 				color: Color(0xFF53d769),
            // 				child: Text("4 on"),
            // 				onPressed: ()=>makeRequest('4','on')
            // 			),
            // 		]
            // 	)
            // ),
            SizedBox(height: 20),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  CupertinoButton(
                      color: Color(0xFFff0800),
                      child: Text("5 off"),
                      onPressed: () => makeRequest('5', 'off')),
                  CupertinoButton(
                      color: Color(0xFF53d769),
                      child: Text("5 on"),
                      onPressed: () => makeRequest('5', 'on')),
                ])),
          ]),
        ));
  }
}
