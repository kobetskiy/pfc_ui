import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pfc/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightChart extends StatelessWidget {
  const WeightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 2.1,
        child: Center(
          child: SizedBox(
            width: 260.sp,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size.fromWidth(260.sp),
                  painter: _DashedBorderPainter(),
                ),
                LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      drawVerticalLine: false,
                      horizontalInterval: 2.295.sp,
                      getDrawingHorizontalLine: (value) {
                        return const FlLine(
                          color: CustomColors.lightGrey,
                          strokeWidth: 1.1,
                          dashArray: [2, 2],
                        );
                      },
                    ),
                    titlesData: const FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 9,
                    minY: 70,
                    maxY: 78,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 78),
                          const FlSpot(1, 76),
                          const FlSpot(2, 76),
                          const FlSpot(3, 76),
                          const FlSpot(4, 76),
                          const FlSpot(5, 75),
                          const FlSpot(6, 73),
                          const FlSpot(7, 72),
                          const FlSpot(8, 71),
                          const FlSpot(9, 70),
                        ],
                        isCurved: true,
                        color: CustomColors.primaryGreen,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            if (index == 0 ||
                                index == barData.spots.length - 1) {
                              return FlDotCirclePainter(
                                radius: 6,
                                color: CustomColors.primaryGreen,
                                strokeWidth: 0,
                              );
                            }
                            return FlDotCirclePainter(radius: 0);
                          },
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              CustomColors.primaryGreen.withOpacity(0.6),
                              CustomColors.primaryGreen.withOpacity(0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                      ),
                    ],
                    lineTouchData: const LineTouchData(enabled: false),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = CustomColors.lightGrey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 1.5;
    const dashSpace = 2.0;

    _drawDashedLine(canvas, Offset(0, size.height),
        Offset(size.width, size.height), paint, dashWidth, dashSpace);
    _drawDashedLine(canvas, const Offset(0, 0), Offset(0, size.height), paint,
        dashWidth, dashSpace);
    _drawDashedLine(canvas, const Offset(0, 0), Offset(size.width, 0), paint,
        dashWidth, dashSpace);
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint,
      double dashWidth, double dashSpace) {
    final totalDistance = (end - start).distance;

    double drawnDistance = 0.0;
    while (drawnDistance < totalDistance) {
      final currentDashEnd =
          Offset.lerp(start, end, drawnDistance / totalDistance)!;
      final dashEndDistance = drawnDistance + dashWidth;
      if (dashEndDistance > totalDistance) break;

      final currentDashEndPoint =
          Offset.lerp(start, end, dashEndDistance / totalDistance)!;
      canvas.drawLine(currentDashEnd, currentDashEndPoint, paint);
      drawnDistance += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
