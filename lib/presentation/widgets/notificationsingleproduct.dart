import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../core/utils/color_constant.dart';
import '../../model/notification_model.dart';

class NotificationSingleProduct extends StatelessWidget {
  NotificationModel notification;
  NotificationSingleProduct({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray300,
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: ColorConstant.gray300,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: FittedBox(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(kFixPadding),
          padding: const EdgeInsets.all(kFixPadding),
          decoration: BoxDecoration(
              color: kWhiteColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(color: kLightColor, blurRadius: 2.0)
              ]),
          child: Column(
            children: [
              Text(notification.title, style: kDarkTextStyle),
              const SizedBox(height: 16.0),
              Image(image: NetworkImage(notification.image)),
              const SizedBox(height: 16.0),
              Text(notification.description,
                  style: const TextStyle(color: kLightColor)),
              const SizedBox(height: 16.0),
              const Align(
                alignment: Alignment.centerRight,
                child: Text('11/Feb/2021 04:42 PM',
                    style: TextStyle(color: kLightColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
