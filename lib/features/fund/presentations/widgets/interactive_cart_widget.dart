import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class InteractiveCartWidget extends StatelessWidget {
  final List<double> data ;
  const InteractiveCartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        backgroundColor: Colors.white,
        gridData: FlGridData(show: true, drawVerticalLine: false),
        borderData: FlBorderData(show: false),

        lineTouchData: LineTouchData(
          enabled: true,
          handleBuiltInTouches: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipRoundedRadius: 12,
            fitInsideHorizontally: true,
            fitInsideVertically: true,
            tooltipPadding: EdgeInsets.all(10),
            getTooltipItems: (spots) {
              return spots.map((spot) {
                return LineTooltipItem(
                  "৳ ${spot.y.toStringAsFixed(2)}",
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                );
              }).toList();
            },
          ),
        ),

        titlesData: FlTitlesData(
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return Text(
                  "D${value.toInt() + 1}",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                );
              },
            ),
          ),
        ),

        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              data.length,
              (i) => FlSpot(i.toDouble(), data[i]),
            ),
            isCurved: true,
            barWidth: 3,
            color: Colors.deepPurple,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.deepPurple.withOpacity(0.2),
            ),
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Colors.deepPurple,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}