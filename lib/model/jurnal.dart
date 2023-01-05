class Jurnal{
    int? id;
    String? nisn;
    String? tanggal;
    String? kegiatan;
    // String? dokumentasi;
    
    Jurnal({this.id,this.nisn, this.tanggal, this.kegiatan});
    
    Map<String, dynamic> toMap() {
        var map = Map<String, dynamic>();
    
        if (id != null) {
          map['id'] = id;
        }
        map['nisn'] = nisn;
        map['tanggal'] = tanggal;
        map['keterangan'] = tanggal;
        // map['dokumentasi'] = dokumentasi;
        
        return map;
    }
    
    Jurnal.fromMap(Map<String, dynamic> map) {
        this.id = map['id'];
        this.nisn = map['nisn'];
        this.tanggal = map['tanggal'];
        this. kegiatan= map['kegiatan'];
        // this.dokumentasi = map['dokumentasi'];
    }
}
