import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/categoryproduct.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/utils/config.dart';


class ApiService {
  dynamic getresponbody;
  

  static Future<dynamic> get(String url) async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  postLogin(String username, String password, BuildContext context) async {
    var url = '${Urls.BASE_API_LOGIN}';
    await http.post(url,
            body: {'username': username, 'password': password},
            headers: {'Accept': 'application/json', 'Charset': 'utf-8'},
            encoding: Encoding.getByName("utf-8"))
        .then((response) async {
           Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) => CategoryProduct()));


        }
        );

  }

  void _errorLogin(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
        "$getresponbody",
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      ),
      actions: <Widget>[
        RaisedButton(
            color: Colors.orange[600],
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              print(getresponbody.toString());
              Navigator.pop(context);
            })
      ],
    );
    showDialog(context: context, child: alertDialog);
  }
}