class PemasukanModel {
  int idpemasukan;
  int idkategori;
  String title;
  String nominal;
  String deskripsi;

  PemasukanModel({
    this.idpemasukan,
    this.idkategori,
    this.title,
    this.nominal,
    this.deskripsi,
  });

  Map<String, dynamic> toMap() => {
        "idpemasukan": idpemasukan,
        "idkategori": idkategori,
        "title": title,
        "nominal": nominal,
        "deskripsi": deskripsi,
      };
}
