import 'package:flutter/material.dart';

class ResetBUTTON extends StatelessWidget {
  final String text;
  final Function onpress;
  const ResetBUTTON({
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
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
        primary: Color(0xffdb222a),
        onPrimary: Colors.black,
      ),
    );
  }
}
