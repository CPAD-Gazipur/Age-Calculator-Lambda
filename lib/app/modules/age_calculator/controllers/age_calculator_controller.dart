import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:month_calculator/month_calculator.dart';

class AgeCalculatorController extends GetxController {
  final dateTime = DateFormat("dd-MM-yyyy");
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;

  final sty = DateTime(1).obs;
  final endy = DateTime(365).obs;

  final s = DateTime(1).obs;
  final e = DateTime(365).obs;

  final yearsss = 00.0.obs; //YEAR
  final monthsss = 00.0.obs; //DAY
  final daysss = 00.0.obs; //MONTH

  void calculateAge() {
    var dateRange = DateTimeRange(start: startDate.value, end: endDate.value);
    var months = MonthCalculator.monthsInRange(dateRange).months;
    var dayrange = DateTimeRange(start: sty.value, end: endy.value);
    var days = MonthCalculator.monthsInRange(dayrange).days;

    /*YEAR*/ yearsss.value = (months / 12).floorToDouble();

    /*DAY*/ daysss.value = ((days / 1) + 1).floorToDouble();

    /*MONTH*/ monthsss.value = ((months % 12)).floorToDouble();
  }

  void setStartDate(date) {
    startDate.value = date;
    sty.value = date;
    s.value = date;
  }

  void setEndDate(date) {
    endDate.value = date;
    endy.value = date;
    e.value = date;
  }

  String getStartDate() {
    int year = startDate.value.year;
    int month = startDate.value.month;
    int day = startDate.value.day;
    return ("$year // $month // $day");
  }

  String getEndDate() {
    int year = endDate.value.year;
    int month = endDate.value.month;
    int day = endDate.value.day;
    return ("$year // $month // $day");
  }

  void reset() {
    startDate.value = DateTime.now();
    endDate.value = DateTime.now();
    yearsss.value = 00.0;
    monthsss.value = 00.0;
    daysss.value = 00.0;
  }
}
