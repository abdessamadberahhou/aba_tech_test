import 'dart:math';

import 'package:assign_project/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BarChartGroupData makeGroupData(
  int x,
  double y, {
  bool isTouched = false,
  Color? barColor,
  double width = 22,
  List<int> showTooltips = const [],
}) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: isTouched ? y + 1 : y,
        color: barColor,
        width: width,
        borderSide: isTouched
            ? BorderSide(color: barColor!)
            : BorderSide(color: Colors.white, width: 0),
        backDrawRodData: BackgroundBarChartRodData(
          show: true,
          toY: 20,
          color: Colors.white,
        ),
      ),
    ],
    showingTooltipIndicators: showTooltips,
  );
}

List<BarChartGroupData> showingGroups() => List.generate(11, (i) {
  var rng = Random();
  return makeGroupData(i+18, rng.nextInt(15).toDouble(), barColor: AppColors.primary, width: 10.w);
    });

List<PieChartSectionData> showingSections(touchedIndex) {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      double fontSize = isTouched ? 20.sp : 14.sp;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.blue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color:  AppColors.textColor,
              
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.yellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
              
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.purple,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color:  AppColors.textColor,
              
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color:  AppColors.textColor,
              
            ),
          );
        default:
          throw Error();
      }
    });
  }