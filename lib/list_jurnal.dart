 import 'dart:convert';

import 'package:flutter/material.dart';
    import 'form_jurnal.dart';
    import 'constants.dart';
    import 'model/jurnal.dart';
    import 'package:http/http.dart' as http;
    
    class ListKontakPage extends StatefulWidget {
        const ListKontakPage({ Key? key }) : super(key: key);
    
        @override
        _ListKontakPageState createState() => _ListKontakPageState();
    }
    
    class _ListKontakPageState extends State<ListKontakPage> {
        List<Jurnal> listJurnal = [];
      
    
        @override
        void initState() {
        //menjalankan fungsi getallkontak saat pertama kali dimuat
        _getAllKontak();
        super.initState();
        }
    
        @override
        Widget build(BuildContext context) {
        return Scaffold(
            
            appBar: AppBar(
                title: Center(
                child: Text("Jurnal App"),
                ),
            ),
            body: ListView.builder(
                itemCount: listJurnal.length,
                itemBuilder: (context, index) {
                    Jurnal jurnal = listJurnal[index];
                    return Padding(
                    padding: const EdgeInsets.only(
                        top: 20
                    ),
                    child: ListTile(
                        leading: Icon(
                        Icons.person, 
                        size: 50,
                        ),
                        title: Text(
                        '${jurnal.nisn}'
                        ),
                        subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                            padding: const EdgeInsets.only(
                                top: 8, 
                            ),
                            child: Text("Tanggal: ${jurnal.tanggal}"),
                            ), 
                            Padding(
                            padding: const EdgeInsets.only(
                                top: 8,
                            ),
                            child: Text("Phone: ${jurnal.kegiatan}"),
                            ),
                            // Padding(
                            // padding: const EdgeInsets.only(
                            //     top: 8,
                            // ),
                            // child: Text("Company: ${absen.alasan}"),
                            // )
                        ],
                        ),
                        trailing: 
                        FittedBox(
                        fit: BoxFit.fill,
                        child: Row(
                            children: [
                            // button edit 
                            IconButton(
                                onPressed: () {
                                // _openFormEdit(jurnal);
                                },
                                icon: Icon(Icons.edit)
                            ),
                            // button hapus
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: (){
                                //membuat dialog konfirmasi hapus
                                AlertDialog hapus = AlertDialog(
                                    title: Text("Information"),
                                    content: Container(
                                    height: 100, 
                                    child: Column(
                                        children: [
                                        Text(
                                            "Yakin ingin Menghapus Data ${jurnal.tanggal}"
                                        )
                                        ],
                                    ),
                                    ),
                                    //terdapat 2 button.
                                    //jika ya maka jalankan _deleteKontak() dan tutup dialog
                                    //jika tidak maka tutup dialog
                                    actions: [
                                    TextButton(
                                        onPressed: (){
                                        // _deleteKontak(jurnal, index);
                                        Navigator.pop(context);
                                        }, 
                                        child: Text("Ya")
                                    ), 
                                    TextButton(
                                        child: Text('Tidak'),
                                        onPressed: () {
                                        Navigator.pop(context);
                                        },
                                    ),
                                    ],
                                );
                                showDialog(context: context, builder: (context) => hapus);
                                }, 
                            )
                            ],
                        ),
                        ),
                    ),
                    );
                }),
                //membuat button mengapung di bagian bawah kanan layar
                floatingActionButton: FloatingActionButton(
                    child: Icon(Icons.add), 
                    onPressed: (){
                    _openFormCreate();
                    },
                ),
            
        );
        }
    
        //mengambil semua data Kontak
        Future<void> _getAllKontak() async {
        //list menampung data dari database
        // var list = await db.getAllKontak();
        

Uri url = Uri.parse("http://10.0.2.2:8000/api/detail_jurnal");
var hasilResponse = await http.get(
url,
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




        //ada perubahanan state
        setState(() {
            //hapus data pada listKontak
            listJurnal.clear();
    
            //lakukan perulangan pada variabel list
            result!.forEach((jurnal) {
            
            //masukan data ke listKontak
            listJurnal.add(Jurnal.fromMap(jurnal));
            });
        });
        }
        }
    
        //menghapus data Kontak
        // Future<void> _deleteKontak(Jurnal jurnal, int position) async {
        // await db.deleteKontak(jurnal.id!);
        // setState(() {
        //     listJurnal.removeAt(position);
        // });
        // }
    
        // membuka halaman tambah Kontak
        Future<void> _openFormCreate() async {
        var result = await Navigator.push(
            context, MaterialPageRoute(builder: (context) => JurnalForm()));
        if (result == 'save') {
            await _getAllKontak();
        }
        }
    
        //membuka halaman edit Kontak
        // Future<void> _openFormEdit(Jurnal jurnal) async {
        // var result = await Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => JurnalForm(jurnal: jurnal)));
        // if (result == 'update') {
        //     await _getAllKontak();
        // }
        // }
    }


