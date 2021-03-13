import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:nabungskuy/components/cardItems.dart';
import 'package:nabungskuy/db/dbprovider.dart';
import 'package:nabungskuy/model/kategoriModel.dart';
import 'package:flushbar/flushbar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kategori Form',
      home: KategoriForm(),
    );
  }
}

class KategoriForm extends StatefulWidget {
  final VoidCallback reload;

  const KategoriForm({Key key, this.reload}) : super(key: key);

  @override
  _KategoriFormState createState() => _KategoriFormState();
}

class _KategoriFormState extends State<KategoriForm> {
  bool lightTheme = true;

  Color currentBackgroundColor = Colors.white;
  Color currentTextColor = Colors.white;

  List<Color> currentBackgroundColors = [Colors.limeAccent, Colors.green];
  List<Color> currentTextColors = [Colors.limeAccent, Colors.green];

  void changeColor(Color color) =>
      setState(() => currentBackgroundColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentBackgroundColors = colors);

  void changeTextColor(Color color) => setState(() => currentTextColor = color);
  void changeTextColors(List<Color> colors) =>
      setState(() => currentTextColors = colors);

  @override
  Widget build(BuildContext context) {
    String colorBackgroundString = currentBackgroundColor.toString();
    String valueBackgroundString =
        colorBackgroundString.split('Color(')[1].split(')')[0];

    String colorTextString = currentTextColor.toString();
    String valueTextColorString = colorTextString.split('(')[1].split(')')[0];

    setState(() {
      valueBackgroundString = currentBackgroundColor.toString();
      valueTextColorString = currentTextColor.toString();
    });

    TextEditingController titleController = new TextEditingController();

    formExecute() async {
      final kategoriList = KategoriModel(
        title: titleController.text,
        backgroundColor: valueBackgroundString.split('(')[1].split(')')[0],
        textColor: valueTextColorString.split('(')[1].split(')')[0],
      );

      if (titleController.text == "") {
        // print('title kosong');
        Flushbar(
          title: 'Title kosong',
          message: 'Mohon isi title',
          duration: Duration(seconds: 3),
          margin: EdgeInsets.all(8),
          borderRadius: 8,
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.blue[300],
          ),
          leftBarIndicatorColor: Colors.blue[300],
        )..show(context);
      } else {
        print(kategoriList.title);
        await NabungskuyDB.db.insertKategori(kategoriList);
        setState(() {
          widget.reload();
          Navigator.pop(context);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Add Kategori'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: 'Title',
                    fillColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text(
                      'Warna Background',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 150,
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: const EdgeInsets.all(0.0),
                                contentPadding: const EdgeInsets.all(0.0),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: currentBackgroundColor,
                                    onColorChanged: changeColor,
                                    colorPickerWidth: 300.0,
                                    pickerAreaHeightPercent: 0.7,
                                    enableAlpha: true,
                                    displayThumbColor: true,
                                    showLabel: true,
                                    paletteType: PaletteType.hsv,
                                    pickerAreaBorderRadius:
                                        const BorderRadius.only(
                                      topLeft: const Radius.circular(2.0),
                                      topRight: const Radius.circular(2.0),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Center(child: Text('Pilih Warna')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text(
                      'Warna Text',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 150,
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: const EdgeInsets.all(0.0),
                                contentPadding: const EdgeInsets.all(0.0),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: currentTextColor,
                                    onColorChanged: changeTextColor,
                                    colorPickerWidth: 300.0,
                                    pickerAreaHeightPercent: 0.7,
                                    enableAlpha: true,
                                    displayThumbColor: true,
                                    showLabel: true,
                                    paletteType: PaletteType.hsv,
                                    pickerAreaBorderRadius:
                                        const BorderRadius.only(
                                      topLeft: const Radius.circular(2.0),
                                      topRight: const Radius.circular(2.0),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Center(child: Text('Pilih Warna')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Preview',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: CardItems(
                backgroundcolor: currentBackgroundColor,
                textcolor: currentTextColor,
                judul: 'Preview',
                deskripsi: 'Preview',
                nominal: 40000,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  formExecute();
                  // print(titleController.text);
                  // print('bgcolor ' +
                  //     valueBackgroundString.split('(')[1].split(')')[0]);
                  // print('textcolor ' +
                  //     valueTextColorString.split('(')[1].split(')')[0]);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.send, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
