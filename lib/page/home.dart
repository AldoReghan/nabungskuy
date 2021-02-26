import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nabungskuy/components/FabMenu.dart';
import 'package:nabungskuy/components/cardItems.dart';
import 'package:nabungskuy/components/stackHeaderList.dart';
import 'package:nabungskuy/page/show_all.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {

    var now = DateTime.now();
    var myFormat = DateFormat('yyyy-MM-dd');
    DateTime startDate = now.subtract(Duration(days: 60));
    DateTime endDate = now;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Welcome Aldo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            stackHeaderList(context, 5000000),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Activity",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ShowAll()));
                      },
                      child: Text(
                        "Show All",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Text('${myFormat.format(_selectedValue)}'),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10.0, bottom: 8),
              child: Container(
                child: HorizontalDatePickerWidget(
                  startDate: startDate,
                  endDate: endDate,
                  selectedDate: now,
                  selectedColor: Colors.blue,
                  normalTextColor: Colors.black,
                  widgetWidth: MediaQuery.of(context).size.width,
                  datePickerController: DatePickerController(),
                  onValueSelected: (date) {
                    print('selected = ${myFormat.format(date)}');
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView(
                  children: [
                    CardItems(
                      judul: 'uang Pendidikan',
                      deskripsi: 'Uang kuliah bulan februari',
                      nominal: 50000,
                      colors: Colors.red,
                    ),
                    CardItems(
                      judul: 'uang Pendidikan',
                      deskripsi: 'Uang kuliah bulan februari',
                      nominal: 50000,
                      colors: Colors.blue,
                    ),
                    CardItems(
                      judul: 'uang Pendidikan',
                      deskripsi: 'Uang kuliah bulan februari',
                      nominal: 50000,
                      colors: Colors.orange,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FancyFab()
    );
  }
}
