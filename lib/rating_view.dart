import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'constants.dart';
import 'rating.dart';

class Rating extends StatefulWidget {
  @override
  _RatingState createState() => _RatingState();
  const Rating({Key? key}) : super(key: key);
}

void main() {
  runApp(Rating());
}

class _RatingState extends State<Rating> {
  @override
  final _minimumPadding = 5.0;
  void _reset() {
    pesanController.text = '';
    kesanController.text = '';
  }

  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isVertical = false;
  IconData? _selectedIcon;

  late double _rating;
  void initState() {
    super.initState();
    _rating = _initialRating;
  }

  TextEditingController pesanController = TextEditingController();
  TextEditingController kesanController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: Text(
          "RATING PKL",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(_minimumPadding * 4),
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                      controller: pesanController,
                      decoration: InputDecoration(
                        labelText: 'Pesan',
                        hintText: 'Pesan',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ))),
              Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                      controller: kesanController,
                      decoration: InputDecoration(
                        labelText: 'Kesan',
                        hintText: 'Kesan',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ))),
              Text(
                'Rating',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              _ratingBar(_ratingBarMode),
              SizedBox(height: 20.0),
              Text(
                'Rating: $_rating',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: Color(0xff45bf97),),
                          
                          child: Text(
                            "Simpan",
                            textScaleFactor: 1.5,
                            style: TextStyle(color: Theme.of(context).primaryColorLight,),
                          ),
                          onPressed: () {
                            String pesan = pesanController.text;
                            String kesan = kesanController.text;
                            double rating = _rating;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RatingDetail(
                                      pesan: pesan,
                                      kesan: kesan,
                                      rating: rating,
                                    )));
                          }),
                    ),
                    Expanded(
                        child: TextButton(
                            
                            style: TextButton.styleFrom(backgroundColor: Color(0xff45bf97),),
                            child: Text(
                              "Cancel",
                              textScaleFactor: 1.5,
                              style: TextStyle(color: Theme.of(context).primaryColorLight,),
                            ),
                            onPressed: () {
                              setState(() {
                                _reset();
                              });
                            })),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  @override
  Widget buils(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan, Kesan dan Rating'),
        backgroundColor: Color(0xff45bf97),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Rating',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              _ratingBar(_ratingBarMode),
              SizedBox(height: 20.0),
              Text(
                'Rating: $_rating',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ratingBar(int mode) {
    return RatingBar.builder(
      initialRating: _initialRating,
      minRating: 1,
      direction: _isVertical ? Axis.vertical : Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.amber.withAlpha(50),
      itemCount: 5,
      itemSize: 50.0,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        _selectedIcon ?? Icons.star,
        color: Color(0xff45bf97),
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      updateOnDrag: true,
    );
  }
}
