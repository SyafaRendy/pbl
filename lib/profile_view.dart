import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: const Text("JURNAL PKL"),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          profile(context),
        ],
      ),
    );
  }
}

Widget profile(BuildContext context) => Positioned(
      left: 0,
      right: 0,
      height: 300.0,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Paul Anderson",
                                style: TextStyle(
                                    color: ColorPalette.primaryColor,
                                    fontSize: 30.0,
                                    fontFamily: 'ralewaymedium'),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "362155401049",
                                style: TextStyle(
                                    color: Color(0xff69ffb9),
                                    fontSize: 20.0,
                                    fontFamily: 'ralewaymedium'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
