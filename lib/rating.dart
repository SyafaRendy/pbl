import 'package:flutter/material.dart';
import 'rating_view.dart';

void main() => runApp(RatingDetail());

class RatingDetail extends StatefulWidget {
  final String? pesan;
  final String? kesan;
  final double? rating;

  const RatingDetail({Key? key, this.pesan, this.kesan, this.rating})
      : super(key: key);

  @override
  _RatingDetailState createState() => _RatingDetailState();
}

class _RatingDetailState extends State<RatingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Rating',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text("Pesan : " + widget.pesan.toString()),
          Text("Kesan : " + widget.kesan.toString()),
          Text("Rating : " + widget.rating.toString()),

          // menampilkan data
        ],
      ),
    );
  }
}
