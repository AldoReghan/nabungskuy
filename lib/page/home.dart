import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Welcome Aldo'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay),
        onPressed: () {
          _controller.animateToSelection();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Total uang keseluruhan : ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Rp. 50.000.000',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    margin: EdgeInsets.only(top: 100),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    'Pemasukan',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Rp. 10.000.000',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 40, top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_upward,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    'Pengeluaran',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Rp. 11.000.000',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                    Text(
                      "Show All",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            Text(_selectedValue.toString()),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 8),
              child: Container(
                child: DatePicker(
                  DateTime.now(),
                  width: 60,
                  height: 80,
                  controller: _controller,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  inactiveDates: [
                    DateTime.now().add(Duration(days: -1))
                    // DateTime.now().add(Duration(days: 3)),
                    // DateTime.now().add(Duration(days: 4)),
                    // DateTime.now().add(Duration(days: 7))
                  ],
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
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Container(
                height: 430,
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () => print("object"),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Uang kuliah",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text("pendidikan"),
                                  SizedBox(height: 5),
                                  Text(
                                    "uang kuliah bulan oktober",
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Rp.5.600.0000",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black,
                      height: 1,
                      thickness: 0.5,
                    ),
                    GestureDetector(
                      onTap: () => print("object"),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Uang kuliah",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text("pendidikan"),
                                  SizedBox(height: 5),
                                  Text(
                                    "uang kuliah bulan oktober",
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Rp.5.600.0000",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black,
                      height: 1,
                      thickness: 0.5,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
