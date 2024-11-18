import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:pocket_fm_web/view/dashboard_screen.dart/controller/theam_controller.dart';

class BarChartSample extends StatelessWidget {
  final List<double> data = [50, 39, 45, 67, 58, 36, 82];

  ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 100,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const days = [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun'
                  ];
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      // days[value.toInt()],
                      "",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
                reservedSize: 28,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      // value.toInt().toString(),
                      "",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
                reservedSize: 28,
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: data
              .asMap()
              .entries
              .map((entry) => BarChartGroupData(
                    x: entry.key,
                    barRods: [
                      BarChartRodData(
                        toY: entry.value,
                        // color: Colors.green,
                        width: 22,
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                          colors: [
                            Colors.green,
                            themeController.isDarkMode.value
                                ? Colors.green.withOpacity(0.3)
                                : Colors.black
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      );
    });
  }
}
