class KategoriModel {
  final int idkategori;
  final String title;
  final String backgroundColor;
  final String textColor;

  KategoriModel({
      this.idkategori, this.title, this.backgroundColor, this.textColor});
  
  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "idkategori": idkategori,
      "title": title,
      "backgroundColor" : backgroundColor,
      "textColor" : textColor
    };
  }
}
