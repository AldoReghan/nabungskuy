class PemasukanModel {
  int idpemasukan;
  int idkategori;
  String title;
  String deskripsi;
  String backgroundColor;
  String textColor;

  PemasukanModel(
      {this.idpemasukan,
      this.idkategori,
      this.title,
      this.deskripsi,
      this.backgroundColor,
      this.textColor});
  
  Map<String, dynamic> toMap () => {
    "idpemasukan" : idpemasukan,
    "idkategori" : idkategori,
    "title" : title,
    "deskripsi" : deskripsi,
    "backgroundColor" : backgroundColor,
    "textColor" : textColor 
  };

}
