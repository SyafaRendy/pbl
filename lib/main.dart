import 'dart:convert';

import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dasboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "JURNAL PKL",
              style: TextStyle(color: ColorPalette.primaryColor),
            ),
          ),
        ),
        body: Container(
          color: ColorPalette.primaryColor,
          padding: EdgeInsets.all(20.0),
          child: Form(
            child: ListView(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      _titleDescription(),
                      _textField(),
                      _buildButton(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _titleDescription() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 16.0),
      ),
      Text(
        "Login",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      Text(
        "Silahkan login sebagai siswa atau guru pembimbing",
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
Widget _textField() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      TextFormField(
        controller: usernameController,
        onSaved: (String? val) {
          usernameController.text = val!;
        },
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.underlineTextField,
              width: 1.5,
            ),
          ),
          hintText: "Username",
          hintStyle: TextStyle(color: ColorPalette.hintColor),
        ),
        style: TextStyle(color: Colors.white),
        autofocus: false,
      ),
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      TextFormField(
        controller: passwordController,
        onSaved: (String? val) {
          passwordController.text = val!;
        },
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.underlineTextField,
              width: 1.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
          hintText: "Password",
          hintStyle: TextStyle(color: ColorPalette.hintColor),
        ),
        style: TextStyle(color: Colors.white),
        obscureText: true,
        autofocus: false,
      ),
    ],
  );
}

Widget _buildButton(BuildContext context) {
  loginProcess() async {
String username = usernameController.text;
String password = passwordController.text;
Uri url = Uri.parse("http://10.0.2.2:8000/api/login");
var hasilResponse = await http.post(
url,
body: {
"username": username,
"password": password,
},
headers: {
"Acceept": "application/json",
},
);
print(hasilResponse.statusCode);
if (hasilResponse.statusCode == 200) {
/**
* hasilnya adalah {"token":"QpwL5tke4Pnpja7X4"}
*/
print(hasilResponse.body);
/**
* dilakukan proses decode untuk
* mendapatkan nilai dari variabel token
*/
var result = json.decode(hasilResponse.body);
var token = result['token'];
var username = result['username'];
var level = result['level'];
print(token);
print(username);
print(level);
 Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DasboardPage(
                      username: username,
                      password: password,
                    )));
} else {
AlertDialog alert = AlertDialog(
      title: Text("Login Gagal"),
      content: Container(
        child: Text("Cek detail login anda"),
      ),
      actions: [
        TextButton(
          child: Text('Ok', style: TextStyle(color: ColorPalette.primaryColor ),),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  
}
}
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 20.0),
      ),
      Container(
        width: 200,
        height: 45,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {
            
          loginProcess();
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => DasboardPage(
            //           username: username,
            //           password: password,
            //         )));
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: ColorPalette.primaryColor,
            ),
          ),
        ),
      ),
    ],
  );
}
