import 'package:flutter/material.dart';
import '../../constants.dart';

class BeforeInfo extends StatelessWidget {
  final String information;
  final String type;

  const BeforeInfo({
    Key? key,
    required this.information,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage("images/splash.jpeg"),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            information,
            style: kheadings,
          ),
          Text(
            type,
            style: kBody,
          )
        ],
      ),
    );
  }
}
