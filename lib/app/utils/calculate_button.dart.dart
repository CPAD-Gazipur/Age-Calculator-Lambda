import 'package:flutter/material.dart';

class CalculateBUTTON extends StatelessWidget {
  final String text;
  final Function onpress;
  const CalculateBUTTON({
    Key? key,
    this.text = "",
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onpress();
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(50),
        shape: CircleBorder(),
        primary: Color(0xff70e000),
        onPrimary: Colors.black,
      ),
    );
  }
}
