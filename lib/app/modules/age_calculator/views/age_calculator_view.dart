import 'dart:math';

import 'package:age_calculator_lamda/app/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/age_calculator_controller.dart';

class AgeCalculatorView extends GetView<AgeCalculatorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4f075d),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "AGE - CALCULATOR",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 60,
                  ),
                ),
                Text(
                  "------------------------------------",
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 60,
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Obx(
                            () => Center(
                              child: Text(
                                "${controller.age.value}",
                                style: TextStyleManager.LARGE_TEXT,
                              ),
                            ),
                          ),
                          height: 150.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Color(0xffd55b4f),
                                width: 5,
                                style: BorderStyle.solid),
                          ),
                        ),
                        Text(
                          "Years",
                          style: TextStyleManager.SMALL_TEXT,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 150.00,
                          width: 130.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Color(0xffd55b4f),
                              width: 5,
                            ),
                          ),
                          child: Obx(
                            () => Center(
                              child: Text(
                                "${controller.age2.value}",
                                style: TextStyleManager.LARGE_TEXT,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "months",
                          style: TextStyleManager.SMALL_TEXT,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Obx(
                            () => Center(
                              child: Text(
                                "${controller.age1.value}",
                                style: TextStyleManager.LARGE_TEXT,
                              ),
                            ),
                          ),
                          height: 150.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Color(0xffd55b4f),
                                width: 5,
                                style: BorderStyle.solid),
                          ),
                        ),
                        Text(
                          "Days",
                          style: TextStyleManager.SMALL_TEXT,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // padding: EdgeInsets.all(70),
                          primary: Color(0xffffc107),
                          // onPrimary: Colors.black,
                        ),
                        child: Text(
                          'DATE OF BIRTH',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now().add(
                              const Duration(days: 0),
                            ),
                            firstDate: DateTime.now().add(
                              const Duration(days: -30000),
                            ),
                            lastDate: DateTime.now().add(
                              const Duration(days: 3000),
                            ),
                          );

                          controller.setStartDate(date);
                        },
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.getStartDate(),
                        style: TextStyle(
                          fontSize: 38,
                          color: Color(0xffff9800),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffffc107),
                          onPrimary: Colors.black,
                        ),
                        child: Text(
                          'CURRENT DATE',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.normal),
                        ),
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now().add(
                              const Duration(days: 0),
                            ),
                            firstDate: DateTime.now().add(
                              const Duration(days: -30000),
                            ),
                            lastDate: DateTime.now().add(
                              const Duration(days: 3000),
                            ),
                          );
                          actions:
                          <Widget>[
                            ElevatedButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ];
                          controller.setEndDate(date);
                        },
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.getEndDate(),
                        style: TextStyle(
                          fontSize: 38,
                          color: Color(0xffff9800),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                  ],
                ),
                SizedBox(
                  height: 55,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 20,
                    ),
                    primary: Color(0xffff9800),
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {
                    controller.calculateAge();
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextSpan container() {
    return TextSpan(
      text: '${controller.age.value}',
      style: TextStyleManager.LARGE_TEXT,
    );
  }
}
