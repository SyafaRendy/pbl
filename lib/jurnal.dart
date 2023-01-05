// import 'package:flutter/material.dart';
// import 'constants.dart';
// import 'form_jurnal.dart';
// import 'dasboard.dart';
// import 'constants.dart';
// import 'model/jurnal.dart';
// import 'package:http/http.dart' as http;

// class JurnalPage extends StatelessWidget {
//   const JurnalPage({Key? key, this.nisn, this.tanggal, this.kegiatan})
//       : super(key: key);
//   final String? nisn;
//   final String? tanggal;
//   final String? kegiatan;
//    List<Jurnal> listJurnal = [];

//   void initState() {
//         //menjalankan fungsi getallkontak saat pertama kali dimuat
//         _getAllKontak();
//         super.initState();
//         }
    
//   @override
//   Widget build(BuildContext context) {
//     //membuka halaman edit Kontak
//         Future<void> _openFormEdit(Jurnal jurnal) async {
//         var result = await Navigator.push(context,
//             MaterialPageRoute(builder: (context) => JurnalForm(jurnal: jurnal)));
        
//         if (result == 'update') {
//             await _getAllKontak();
//         }
//         }
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorPalette.primaryColor,
//         title: const Text("JURNAL"),
//         actions: [
//           GestureDetector(
// // menampilkan icon +
//               child: const Icon(Icons.add),
// //pada saat icon + di tap
//               onTap: () async {
// //berpindah ke halaman ProdukForm
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const JurnalForm()));
//               })
//         ],
//       ),
//       body: ListView.builder(
//                 itemCount: listJurnal.length,
//                 itemBuilder: (context, index) {
//                     Jurnal jurnal = listJurnal[index];
//                     return Padding(
//                     padding: const EdgeInsets.only(
//                         top: 20
//                     ),
//                     child: ListTile(
//                         leading: Icon(
//                         Icons.person, 
//                         size: 50,
//                         ),
//                         title: Text(
//                         '${jurnal.nisn}'
//                         ),
//                         subtitle: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                             Padding(
//                             padding: const EdgeInsets.only(
//                                 top: 8, 
//                             ),
//                             child: Text("Tanggal: ${jurnal.tanggal}"),
//                             ), 
//                             Padding(
//                             padding: const EdgeInsets.only(
//                                 top: 8,
//                             ),
//                             child: Text("Kegiatan: ${jurnal.kegiatan}"),
//                             ),
//                             // Padding(
//                             // padding: const EdgeInsets.only(
//                             //     top: 8,
//                             // ),
//                             // child: Text("Dokumentasi: ${jurnal.dokumentasi}"),
//                             // )
//                         ],
//                         ),
//                         trailing: 
//                         FittedBox(
//                         fit: BoxFit.fill,
//                         child: Row(
//                             children: [
//                             // button edit 
//                             IconButton(
//                                 onPressed: () {
//                                 _openFormEdit(jurnal);
//                                 },
//                                 icon: Icon(Icons.edit)
//                             ),
//                             // button hapus
//                             IconButton(
//                                 icon: Icon(Icons.delete),
//                                 onPressed: (){
//                                 //membuat dialog konfirmasi hapus
//                                 AlertDialog hapus = AlertDialog(
//                                     title: Text("Information"),
//                                     content: Container(
//                                     height: 100, 
//                                     child: Column(
//                                         children: [
//                                         Text(
//                                             "Yakin ingin Menghapus Data ${absen.tanggal}"
//                                         )
//                                         ],
//                                     ),
//                                     ),
//                                     //terdapat 2 button.
//                                     //jika ya maka jalankan _deleteKontak() dan tutup dialog
//                                     //jika tidak maka tutup dialog
//                                     actions: [
//                                     TextButton(
//                                         onPressed: (){
//                                         _deleteKontak(jurnal, index);
//                                         Navigator.pop(context);
//                                         }, 
//                                         child: Text("Ya")
//                                     ), 
//                                     TextButton(
//                                         child: Text('Tidak'),
//                                         onPressed: () {
//                                         Navigator.pop(context);
//                                         },
//                                     ),
//                                     ],
//                                 );
//                                 showDialog(context: context, builder: (context) => hapus);
//                                 }, 
//                             )
//                             ],
//                         ),
//                         ),
//                     ),
//                     );
//                 }),
//     );
//   }

//     //mengambil semua data Kontak
//         Future<void> _getAllKontak() async {
//         //list menampung data dari database
//         Uri url = Uri.parse("http://10.0.2.2:8000/api/create_absen");
// var hasilResponse = await http.post(
// url,
// body: {
//   "nisn": nisn,
// "tanggal": tanggal,
// "kegiatan": kegiatan,
// // "dokumentasi": dokumentasi,

// },
// headers: {
// "Acceept": "application/json",
// },
// );
//         //ada perubahanan state
//         setState(() {
//             //hapus data pada listKontak
//             listJurnal.clear();
    
//             //lakukan perulangan pada variabel list
//             list!.forEach((jurnal) {
            
//             //masukan data ke listKontak
//             listJurnal.add(Jurnal.fromMap(jurnal));
//             });
//         });
//         }

//           getProcess() async {

// Uri url = Uri.parse("http://10.0.2.2:8000/api/get_absen");
// var hasilResponse = await http.post(
// url,
// body: {

// },
// headers: {
// "Acceept": "application/json",
// },
// );
// print(hasilResponse.statusCode);
// if (hasilResponse.statusCode == 200) {
// /**
// * hasilnya adalah {"token":"QpwL5tke4Pnpja7X4"}
// */
// print(hasilResponse.body);
// /**
// * dilakukan proses decode untuk
// * mendapatkan nilai dari variabel token
// */
// var result = json.decode(hasilResponse.body);
// var nisn = result['nisn'];
// var tanggal = result['tanggal'];
// var kegiatan = result['keterangan'];
// var alasan = result['alasan'];


// setState(() {
//             //hapus data pada listKontak
//             listJurnal.clear();
    
//             //lakukan perulangan pada variabel list
//             list!.forEach(($result) {
            
//             //masukan data ke listKontak
//             listJurnal.add(Jurnal.fromMap($result));
//             });
//         });


// } 
// }




// }
