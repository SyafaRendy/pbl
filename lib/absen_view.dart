import 'dart:convert';

import 'package:flutter/material.dart';
import 'absen.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
void main() => runApp(const MyAppAbsensi());

enum SingingCharacter { hadir, tidak }

class MyAppAbsensi extends StatefulWidget {
  const MyAppAbsensi({Key? key});

  @override
  State<MyAppAbsensi> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyAppAbsensi> {
  // DateTime selectedDate = DateTime.now();
  SingingCharacter? _character = SingingCharacter.hadir;
  final _minimumPadding = 5.0;
  final _formKey = GlobalKey<FormState>();
  

  // Future<Null> _selectedDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: selectedDate.subtract(Duration(days: 30)),
  //       lastDate: DateTime(selectedDate.year + 10));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

  @override
  TextEditingController nisnController = TextEditingController();
  TextEditingController alasanController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
 String _value = "Hadir";

  simpanProcess() async {
String nisn = nisnController.text;
String tanggal = tanggalController.text;
String alasan = alasanController.text; 
String keterangan = _value;
Uri url = Uri.parse("http://10.0.2.2:8000/api/create_absen");
var hasilResponse = await http.post(
url,
body: {
  "nisn": nisn,
"tanggal": tanggal,
"keterangan": keterangan,
"alasan": alasan,

},
headers: {
"Acceept": "application/json",
},
);
print(hasilResponse.statusCode);
if (hasilResponse.statusCode == 200) {
print(hasilResponse.body);

var result = json.decode(hasilResponse.body);
var nisn = result['nisn'];
var tanggal = result['tanggal'];
var kegiatan = result['keterangan'];
var alasan = result['alasan'];
print(nisn);
print(tanggal);
print(kegiatan);
print(alasan);

AlertDialog alert = AlertDialog(
      title: Text("Data Berhasil Disimpan"),
      content: Container(
        child: Text("Selamat, data absensi berhasil diinputkan!"),
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: Text(
          "ABSENSI PKL",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(_minimumPadding * 15),
          child: Column(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: tanggalController,
                    decoration: InputDecoration(
                      labelText: 'Tanggal',
                    ))),
                     Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: nisnController,
                    decoration: InputDecoration(
                      labelText: 'Nisn',
                    ))),
            Text(
              "Keterangan",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  
                  Radio(
                      value: "Hadir",
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value as String;
                        });
                      },
                    ),Text("Hadir"),
                    
                  Radio(
                      value: "Sakit",
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value as String;
                        });
                      },
                    ),Text("Sakit"),
                   
                  Radio(
                      value: "Izin",
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value as String;
                        });
                      },
                    ), Text("Izin"),

                ],
              ),
            ),
            // ListTile(
            //   title: const Text('Tidak Hadir'),
            //   leading: Radio<SingingCharacter>(
            //     value: SingingCharacter.hadir,
            //     groupValue: _character,
            //     onChanged: (SingingCharacter? value) {
            //       setState(() {
            //         _character = value;
            //       });
            //     },
            //   ),
            // ),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: alasanController,
                    decoration: InputDecoration(
                      labelText: 'Alasan',
                    ))),
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: _minimumPadding, bottom: _minimumPadding),
            //   child: Text(
            //     "Tanggal Absensi",
            //     style: TextStyle(
            //       letterSpacing: 3,
            //       wordSpacing: 4,
            //       height: 2,
            //     ),
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: <Widget>[
            //     Text(
            //       "${selectedDate.toLocal()}".split(' ')[0],
            //       style: TextStyle(
            //         fontSize: 15,
            //         foreground: Paint()
            //           ..style = PaintingStyle.stroke
            //           ..strokeWidth = 1
            //           ..color = Color(0xff45bf97),
            //       ),
            //     ),
            //   ],
            // ),
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
                            simpanProcess();
                            // String nisn = nisnController.text;
                            // String tanggal = tanggalController.text;
                            // String alasan = alasanController.text;

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => JurnalPage(
                            //           nisn: nisn,
                            //           tanggal: tanggal,
                            //           kegiatan: kegiatan,
                            //         )));
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
            
          ]),
        ),
      ),
    );
  }

  void _reset() {
    nisnController.text = '';
    alasanController.text = '';
  }
}
