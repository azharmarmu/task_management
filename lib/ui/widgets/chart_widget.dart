import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(color: Colors.red, radius: 12),
                  PieChartSectionData(color: Colors.blue, radius: 14),
                  PieChartSectionData(color: Colors.amber, radius: 16),
                  PieChartSectionData(color: Colors.blueGrey, radius: 18),
                  PieChartSectionData(color: Colors.greenAccent, radius: 20),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '29.1',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'of 128GB',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
