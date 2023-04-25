import 'package:flutter/material.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../model/notification_model.dart';
import '../widgets/notificationsingleproduct.dart';

class NotificationScreen extends StatefulWidget {
  List<NotificationModel>? allnotifications;

  NotificationScreen({Key? key, this.allnotifications}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
      body: ListView.separated(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: widget.allnotifications?.length == null
              ? 0
              : widget.allnotifications!.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstant.event),
                      fit: BoxFit.cover),
                ),
              ),
              title: Text(
                widget.allnotifications![index].title,
                style: const TextStyle(color: Color(0xFF303030)),
              ),
              subtitle: const Text(
                'This is an amazing program you do not wanna miss....',
                style: TextStyle(color: Color(0xFF808080)),
              ),
              enabled: true,
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationSingleProduct(
                          notification: widget.allnotifications![index])),
                )
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          }),
    );
  }
}
