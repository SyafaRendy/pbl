import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbl/list_jurnal.dart';
import 'jurnal.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main() => runApp(const JurnalForm());

class JurnalForm extends StatefulWidget {
  const JurnalForm({Key? key}) : super(key: key);

  _JurnalFormState createState() => _JurnalFormState();
}

class _JurnalFormState extends State<JurnalForm> {
   XFile? image;
    
      List _images = [];
    
      final ImagePicker picker = ImagePicker();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController kegiatanController = TextEditingController();
  TextEditingController nisnController = TextEditingController();
  final _minimumPadding = 5.0;
  void _reset() {
    nisnController.text = '';
    tanggalController.text = '';
    kegiatanController.text = '';
  }

  @override

   Future simpanProcess(ImageSource media) async {
String nisn = nisnController.text;
String tanggal = tanggalController.text;
String kegiatan = kegiatanController.text;
 var img = await picker.pickImage(source: media);
Uri url = Uri.parse("http://10.0.2.2:8000/api/create_jurnal");
var hasilResponse = await http.post(
url,
body: {
  "nisn": nisn,
"tanggal": tanggal,
"kegiatan": kegiatan,
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
var nisn = result['nisn'];
var tanggal = result['tanggal'];
var kegiatan = result['kegiatan'];
print(nisn);
print(tanggal);
print(kegiatan);
 Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => ListKontakPage(
  )));
} else {
AlertDialog alert = AlertDialog(
      title: Text("Data Gagal Disimpan"),
      content: Container(
        child: Text("Cek kembali koneksi anda!"),
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
 void myAlert() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                title: Text('Please choose media to select'),
                content: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(
                    children: [
                      ElevatedButton(
                        //if user click this button, user can upload image from gallery
                        onPressed: () {
                          Navigator.pop(context);
                          simpanProcess(ImageSource.gallery);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.image),
                            Text('From Gallery'),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        //if user click this button. user can upload image from camera
                        onPressed: () {
                          Navigator.pop(context);
                          simpanProcess(ImageSource.camera);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera),
                            Text('From Camera'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: Text(
          "JURNAL PKL",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(_minimumPadding * 4),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: nisnController,
                      decoration: InputDecoration(
                        labelText: 'NISN',
                        hintText: 'NISN',
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
                      controller: tanggalController,
                      decoration: InputDecoration(
                        labelText: 'Tanggal',
                        hintText: 'Tanggal',
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
                      controller: kegiatanController,
                      decoration: InputDecoration(
                        labelText: 'Kegiatan PKL',
                        hintText: 'Kegiatan PKL',
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom( backgroundColor: Color(0xff45bf97),),
                         
                          
                          child: Text(
                            "Simpan",
                            textScaleFactor: 1.5,
                            style: TextStyle(color: Theme.of(context).primaryColorLight,),
                          ),
                          onPressed: () {
                            String nisn = nisnController.text;
                            String tanggal = tanggalController.text;
                            String kegiatan = kegiatanController.text;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>ListKontakPage (
                                      
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
}
