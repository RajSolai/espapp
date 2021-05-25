import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EspService {
  Future<void> makeRequest(
      String gpio, String ctrl, BuildContext context) async {
    if (gpio == "test") {
      await http.get("http://192.168.4.1/test" + "/" + ctrl).then((data) {
        print(data.body);
      }).catchError((err) {
        print(err);
        _noEspAlert(context);
      });
    } else {
      await http
          .get("http://192.168.4.1/gpio/" + gpio + "/" + ctrl)
          .then((data) {
        print(data.body);
      }).catchError((err) {
        print(err);
        _noEspAlert(context);
      });
    }
  }

  Future<void> _noEspAlert(context) async {
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
}
