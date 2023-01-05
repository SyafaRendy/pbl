import 'package:flutter/material.dart';
import 'package:pbl/list_jurnal.dart';
import 'jurnal.dart';
import 'absen_view.dart';
import 'constants.dart';
import 'profile_view.dart';
import 'rating_view.dart';

class DasboardPage extends StatefulWidget {
  final String? username;
  final String? password;
  const DasboardPage({Key? key, this.username, this.password})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DasboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: const Text("JURNAL PKL"),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              splashColor: ColorPalette.primaryColor,
              child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(Icons.account_circle,
                          size: 70, color: ColorPalette.primaryColor),
                      Text("Profile", style: TextStyle(fontSize: 17.0)),
                    ]),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAppAbsensi()));
              },
              splashColor: ColorPalette.primaryColor,
              child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(Icons.calendar_month,
                          size: 70, color: ColorPalette.primaryColor),
                      Text("Absensi", style: TextStyle(fontSize: 17.0)),
                    ]),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListKontakPage()));
              },
              splashColor: ColorPalette.primaryColor,
              child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(Icons.auto_stories,
                          size: 70, color: ColorPalette.primaryColor),
                      Text("Jurnal", style: TextStyle(fontSize: 17.0)),
                    ]),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () async {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Rating()));
              },
              splashColor: ColorPalette.primaryColor,
              child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Icon(Icons.star,
                          size: 70, color: ColorPalette.primaryColor),
                      Text("Rating", style: TextStyle(fontSize: 17.0)),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
