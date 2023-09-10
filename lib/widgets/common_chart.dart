import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';

class CommonChart extends StatelessWidget {
  const CommonChart(
      {super.key, required this.spots, this.color = StockAppColors.green});

  final List<FlSpot> spots;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 10,
        minY: 0,
        maxY: 10,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: false,
            // colors: [Colors.blue],
            color: color,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green.withOpacity(0.2), Colors.transparent],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
