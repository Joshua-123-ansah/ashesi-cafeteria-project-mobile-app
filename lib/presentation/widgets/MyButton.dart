import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Function() authType;
  final double paddingNumber;

  const MyButton({
    Key? key,
    required this.authType,
    required this.paddingNumber,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingNumber),
      child: Container(
        height: 45,
        width: double.infinity,
        child: ElevatedButton(
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
          // color: Color(0xFF630511),
          onPressed: authType,
          style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Color(0xFF630511)) ),
        ),
      ),
    );
  }
}
