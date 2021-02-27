import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:nabungskuy/components/chart/showingSection.dart';
// import 'package:nabungskuy/components/chart/indicator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'show all',
      home: ShowAll(),
    );
  }
}

class ShowAll extends StatefulWidget {
  @override
  _ShowAllState createState() => _ShowAllState();
}

class _ShowAllState extends State<ShowAll> {
  int touchedIndex;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Show All'),
        ),
        body: AspectRatio(
          aspectRatio: 1.3,
          child: Card(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                          pieTouchData:
                              PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              if (pieTouchResponse.touchInput
                                      is FlLongPressEnd ||
                                  pieTouchResponse.touchInput is FlPanEnd) {
                                touchedIndex = -1;
                              } else {
                                touchedIndex =
                                    pieTouchResponse.touchedSectionIndex;
                              }
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections(touchedIndex)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 28,
                ),
              ],
            ),
          ),
        ));
  }
}
