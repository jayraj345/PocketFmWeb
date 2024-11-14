import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SmoothLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.transparent,
          lineBarsData: [
            LineChartBarData(
              isCurved: true, // Enable curve
              color: Colors.green, // Line color
              barWidth: 2,
              dotData: FlDotData(
                show: true,

                // checkToShowDot: 5,
                // dotColor: Colors.grey, // Dot color
              ),
              spots: [
                FlSpot(0, 1),
                FlSpot(1, 1.5),
                FlSpot(2, 1.2),
                FlSpot(3, 1.9),
                FlSpot(4, 1.8),
              ],
            ),
          ],
          titlesData: FlTitlesData(
            show: false,
          ),
          gridData: FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
        ),
      ),
    );
  }
}
