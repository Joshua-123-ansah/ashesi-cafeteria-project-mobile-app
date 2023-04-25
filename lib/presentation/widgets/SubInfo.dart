import 'package:flutter/material.dart';

class SubInfo extends StatelessWidget {
  final String information;
  final String type;
  final void Function() onPress;

  const SubInfo({
    Key? key,
    required this.onPress,
    required this.information,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(information),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            type,
            style: const TextStyle(
                color: Color(0xFF630511),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
