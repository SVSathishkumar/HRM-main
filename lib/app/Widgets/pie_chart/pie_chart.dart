import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm/app/utils/themes.dart';

class HRMPieChart extends StatelessWidget {
  const HRMPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final bool isSmallScreen = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "HRM Report",
          style: GoogleFonts.teko(
            fontSize: isSmallScreen ? 18 : 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(isSmallScreen ? 12.0 : 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: isSmallScreen ? 150 : 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "HRM",
                        style: GoogleFonts.teko(
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      PieChart(
                        PieChartData(
                          sections: _buildPieChartSections(isSmallScreen),
                          sectionsSpace: 2,
                          centerSpaceRadius: isSmallScreen ? 30 : 40,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  children: [
                    _buildLegendItem(ThemeClass.lightPrimaryColor, "Developers"),
                    _buildLegendItem(Colors.green, "HR"),
                    _buildLegendItem(Colors.orange, "Marketing"),
                    _buildLegendItem(Colors.red, "Finance"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _buildPieChartSections(bool isSmallScreen) {
    double radius = isSmallScreen ? 50 : 60;
    double fontSize = isSmallScreen ? 14 : 16;

    return [
      PieChartSectionData(
        value: 40,
        title: '40%',
        color: ThemeClass.lightPrimaryColor,
        radius: radius,
        titleStyle: GoogleFonts.teko(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: 25,
        title: '25%',
        color: Colors.green,
        radius: radius,
        titleStyle: GoogleFonts.teko(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: 20,
        title: '20%',
        color: Colors.orange,
        radius: radius,
        titleStyle: GoogleFonts.teko(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        value: 15,
        title: '15%',
        color: Colors.red,
        radius: radius,
        titleStyle: GoogleFonts.teko(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.teko(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }
}
