class KategoriModel {
  int _idkategori;
  String _title;
  String _backgroundColor;
  String _textColor;

  KategoriModel(this._idkategori, this._title, this._backgroundColor, this._textColor);

  KategoriModel.fromMap(Map<String, dynamic> map){
    this._idkategori = map['idkategori'];
    this._title = map['title'];
    this._backgroundColor = map['backgroundColor'];
    this._textColor = map['textColor'];
  }

  int get idkategori => _idkategori;
  String get title => _title;
  String get backgroundColor => _backgroundColor;
  String get textColor => _textColor;

  set title(String value){
    _title = value;
  }

  set backgroundColor(String value){
    _backgroundColor = value;
  }

  set textColor(String value){
    _textColor = value;
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = Map<String, dynamic>();
    map['idkategori'] = this._idkategori;
    map['title'] = this._title;
    map['backgroundColor'] = this._backgroundColor;
    map['textColor'] = this._textColor;
  }

}
