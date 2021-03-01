import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:nabungskuy/components/cardItems.dart';
import 'package:nabungskuy/components/chart/showingSection.dart';

class PengeluaranPage extends StatefulWidget {
  @override
  _PengeluaranPageState createState() => _PengeluaranPageState();
}

class _PengeluaranPageState extends State<PengeluaranPage> {
  @override
  Widget build(BuildContext context) {
    int touchedIndex;
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.7,
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
          ),
          Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView(
                  children: [
                    CardItems(
                      judul: 'uang Pendidikan',
                      deskripsi: 'Uang kuliah bulan februari',
                      nominal: 50000,
                      backgroundcolor: Colors.red,
                      textcolor: Colors.white,
                    ),
                    CardItems(
                      judul: 'uang Pendidikan',
                      deskripsi: 'Uang kuliah bulan februari',
                      nominal: 50000,
                      backgroundcolor: Colors.blue,
                      textcolor: Colors.white,
                    ),
                    CardItems(
                      judul: 'uang Pendidikan',
                      deskripsi: 'Uang kuliah bulan februari',
                      nominal: 50000,
                      backgroundcolor: Colors.orange,
                      textcolor: Colors.white,
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
