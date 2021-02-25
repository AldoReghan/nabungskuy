import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:nabungskuy/components/cardItems.dart';
// import 'package:nabungskuy/components/cardList.dart';
import 'package:nabungskuy/components/drawer.dart';
import 'package:nabungskuy/components/stackHeaderList.dart';
import 'package:nabungskuy/page/show_all.dart';

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

class _HomePageState extends State<HomePage> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();

  var myFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: drawer(context),
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
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 80,
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.blue,
                  selectedTextColor: Colors.white,
                  inactiveDates: [DateTime.now().add(Duration(days: -1))],
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                      _selectedValue = date;
                    });
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
                    GestureDetector(
                      onTap: () => {print('yuhuu')},
                      child: cardItems(context, 'Uang Pendidikan',
                          'Uang kuliah bulan februari', 5000000, Colors.red),
                    ),
                    cardItems(context, 'Uang Tabungan',
                        'Uang tabungan atau darurat', 5000000, Colors.blue),
                    cardItems(context, 'Uang Harian',
                        'Uang buat ngopi dan kebutuhan pokok lainnya', 5000000, Colors.orange),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _controller.animateToSelection();
        },
      ),
    );
  }
}
