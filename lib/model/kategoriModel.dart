class KategoriModel{
  int idkategori;
  String title;
  String backgroundColor;
  String textColor;

  KategoriModel({this.idkategori, this.title, this.backgroundColor, this.textColor});

  factory KategoriModel.fromMap(Map<String, dynamic> data) => KategoriModel(
    idkategori: data['idkategori'],
    title : data['title'],
    backgroundColor: data['backgroundColor'],
    textColor: data['textColor']
  );

  Map<String, dynamic> toMap() => {
    "idkategori" : idkategori,
    "title" : title,
    "backgroundColor" : backgroundColor,
    "textColor" : textColor
  };

}