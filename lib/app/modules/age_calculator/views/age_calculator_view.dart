import 'package:age_calculator_lamda/app/utils/text_styles.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/age_calculator_controller.dart';

class AgeCalculatorView extends GetView<AgeCalculatorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Calculator'),
        backgroundColor: Color(0xff0d1321),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.portrait_rounded,
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff0d1321),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Obx(
                            () => Center(
                              child: AnimatedFlipCounter(
                                value: controller.yearsss.value,
                                prefix: " ",
                                textStyle: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffc107),
                                ),
                              ),
                            ),
                          ),
                          height: 150.0,
                          width: 115.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Color(0xff70e000),
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
                      width: 3,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 150.00,
                          width: 115.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Color(0xff70e000),
                              width: 5,
                            ),
                          ),
                          child: Obx(
                            () => Center(
                              child: AnimatedFlipCounter(
                                value: controller.monthsss.value,
                                prefix: " ",
                                textStyle: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffc107),
                                ),
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
                      width: 3,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Obx(
                            () => Center(
                              child: AnimatedFlipCounter(
                                value: controller.daysss.value,
                                prefix: " ",
                                textStyle: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffc300),
                                ),
                              ),
                            ),
                          ),
                          height: 150.0,
                          width: 115.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Color(0xff70e000),
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
                  height: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff70e000),
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
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffffd60a),
                          width: 5,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Obx(
                        () => Text(
                          controller.getStartDate(),
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff70e000),
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

                          controller.setEndDate(date);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffffd60a),
                          width: 5,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Obx(
                        () => Text(
                          controller.getEndDate(),
                          style: TextStyle(
                            fontSize: 28,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(50),
                        shape: CircleBorder(),
                        primary: Color(0xff70e000),
                        onPrimary: Colors.black,
                      ),
                      onPressed: () {
                        controller.calculateAge();
                      },
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        shape: CircleBorder(),
                        primary: Color(0xffdb222a),
                        onPrimary: Colors.black,
                      ),
                      onPressed: () {
                        controller.reset();
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TextSpan container() {
  //   return TextSpan(
  //     text: '${controller.yearsss.value}',
  //     style: TextStyleManager.LARGE_TEXT,
  //   );
  // }
}
