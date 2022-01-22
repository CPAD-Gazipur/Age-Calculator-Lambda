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
                          height: 130.0,
                          width: 100.0,
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
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 130.00,
                          width: 100.0,
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
                      width: 20,
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
                          height: 130.0,
                          width: 100.0,
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
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.all(70),
                              primary: Color(0xffd55b4f),
                              onPrimary: Color(0xffd55b4f),
                            ),
                            child: Text(
                              'FROM',
                              style: TextStyleManager.SMALL_TEXT,
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
                              [
                                ElevatedButton(
                                  child: const Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ];

                              controller.setStartDate(date);
                            },
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.getStartDate(),
                            style: TextStyleManager.MEDIUM_TEXT,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.all(70),
                              primary: Color(0xffd55b4f),
                              onPrimary: Colors.black,
                              // shape: CircleBorder(),
                            ),
                            child: Text(
                              ' TO ',
                              style: TextStyleManager.SMALL_TEXT,
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
                            style: TextStyleManager.MEDIUM_TEXT,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 55,
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 20,
                    ),
                    primary: Color(0xffffc107),
                    onPrimary: Colors.black,
                  ),
                  onPressed: () {
                    controller.calculateAge();
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
