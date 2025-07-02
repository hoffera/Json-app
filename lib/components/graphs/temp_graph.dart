import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:json_app/app/enum/enum.dart';

class TempGraph extends StatefulWidget {
  const TempGraph({super.key});

  @override
  State<TempGraph> createState() => _TempGraphState();
}

class _TempGraphState extends State<TempGraph> {
  List<Color> gradientColors = [Color(0xFF416bdf), AppColors.contentColorWhite];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(mainData()),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.normal, fontSize: 12);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '13:00';
        break;
      case 4:
        text = '17:00';
        break;
      case 8:
        text = '21:00';
        break;
      case 12:
        text = '01:00';
        break;
      case 16:
        text = '05:00';
        break;
      case 20:
        text = '09:00';
        break;
      default:
        return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 1,
          height: 8,
          color: Colors.grey, // Tracinho acima da label
        ),
        const SizedBox(height: 4),
        Text(text, style: style),
      ],
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.normal, fontSize: 12);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 40:
        text = '0.4';
        break;
      case 80:
        text = '0.8';
        break;
      case 100:
        text = '1.43';
        break;
      default:
        return Container();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text, style: style, textAlign: TextAlign.right),
        const SizedBox(width: 4),
        Container(
          width: 8,
          height: 1,
          color: Colors.grey, // Tracinho à direita da label
        ),
      ],
    );
  }

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.normal, fontSize: 12);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 25:
        text = '25';
        break;
      case 50:
        text = '50';
        break;
      case 75:
        text = '75';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 1,
          color: Colors.grey, // Tracinho
        ),
        const SizedBox(width: 4),
        Text(text, style: style, textAlign: TextAlign.left),
      ],
    );
  }

  String formatTime(double xValue) {
    int hour = xValue.toInt();
    return "${hour.toString().padLeft(2, '0')}:00";
  }

  LineTouchData lineTouchWidget() {
    return LineTouchData(
      enabled: true,
      touchTooltipData: LineTouchTooltipData(
        maxContentWidth: 300,
        fitInsideVertically: true,
        fitInsideHorizontally: true,
        getTooltipColor: (LineBarSpot touchedSpot) {
          return Colors.white;
        },
        getTooltipItems: (List<LineBarSpot> touchedSpots) {
          return touchedSpots.asMap().entries.map((entry) {
            final index = entry.key;
            final spot = entry.value;

            if (index == 0) {
              final time = formatTime(spot.x);
              return LineTooltipItem(
                textAlign: TextAlign.start,
                "$time\n",
                TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),

                children: [
                  TextSpan(
                    text: "Precipitação: ${spot.y.toStringAsFixed(2)} mm",
                    style: TextStyle(
                      color: Color(0xFF416bdf),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            } else {
              return LineTooltipItem(
                textAlign: TextAlign.start,
                "Probabilidade: ${spot.y.toStringAsFixed(0)}%",
                TextStyle(
                  color: Color(0xFF416bdf),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              );
            }
          }).toList();
        },
      ),
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((spotIndex) {
              return TouchedSpotIndicatorData(
                FlLine(color: Colors.grey, strokeWidth: 0.5),
                FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 6,
                      color: const Color(0xFF416bdf),
                    );
                  },
                ),
              );
            }).toList();
          },
      touchSpotThreshold: 30,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(show: false),
      lineTouchData: lineTouchWidget(),
      titlesData: FlTitlesData(
        show: true,
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: rightTitleWidgets,
            reservedSize: 40,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 40,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
      ),

      borderData: FlBorderData(
        show: true,
        border: Border(
          left: BorderSide(color: Colors.grey),
          right: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: 100,
      lineBarsData: lineBarsData1,
    );
  }

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
    lineChartBarData1_2,
  ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    color: Color(0xFF416bdf),
    barWidth: 2,
    isStrokeCapRound: false,
    dotData: const FlDotData(show: false),
    spots: const [
      FlSpot(0, 0),
      FlSpot(2, 30),
      FlSpot(8, 50),
      FlSpot(15, 60),
      FlSpot(24, 90),
    ],
  );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    spots: const [
      FlSpot(0, 0),
      FlSpot(2, 15),
      FlSpot(8, 80),
      FlSpot(15, 22),
      FlSpot(24, 8),
    ],
    isCurved: true,
    color: Color(0xFF416bdf),
    barWidth: 2,
    isStrokeCapRound: false,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: true,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: gradientColors
            .map(
              (color) => color.withValues(alpha: 0.5),
            ) // use .withOpacity em vez de withValues
            .toList(),
      ),
    ),
  );
}
