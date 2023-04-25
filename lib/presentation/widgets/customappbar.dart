import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/utils/color_constant.dart';
import 'notificationbutton.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(color: primaryColor),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: ColorConstant.gray300,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: primaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [NotificationButton()],
    );
  }
}
