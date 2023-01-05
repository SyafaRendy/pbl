import 'package:flutter/material.dart';

class SiswaDetail extends StatefulWidget {
  final String? nama;
  final String? alasan;

  const SiswaDetail({
    Key? key,
    this.nama,
    this.alasan,
  }) : super(key: key);

  @override
  _SiswaDetailState createState() => _SiswaDetailState();
}

class _SiswaDetailState extends State<SiswaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Column(
        children: [
          Text("Nama : " + widget.nama.toString()),
          Text("Alasan : " + widget.alasan.toString()),
          // menampilkan nama dan alasan
        ],
      ),
    );
  }
}
