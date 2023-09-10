import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonCircularChart extends StatelessWidget {
  CommonCircularChart({super.key, this.graphData});

  final List<double>? graphData;

  List<CircularStackEntry> data = <CircularStackEntry>[
    const CircularStackEntry(
      <CircularSegmentEntry>[
        CircularSegmentEntry(16 / 2 - 1, Color(0xffE6584E), rankKey: '1'),
        CircularSegmentEntry(1, Colors.white, rankKey: '1'),
        CircularSegmentEntry(17 / 2 - 1, Color(0xffFFBB56), rankKey: '2'),
        CircularSegmentEntry(1.0, Colors.white, rankKey: '1'),
        CircularSegmentEntry(26 / 2 - 1, Color(0xff259678), rankKey: '3'),
        CircularSegmentEntry(1.0, Colors.white, rankKey: '1'),
        CircularSegmentEntry(41 / 2, Color(0xff007AFF), rankKey: '4'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedCircularChart(
      size: const Size(400, 400),
      initialChartData: data,
      startAngle: 180,
      percentageValues: true,
      chartType: CircularChartType.Radial,
      edgeStyle: SegmentEdgeStyle.flat,
      holeRadius: 80,
    );
  }
}
