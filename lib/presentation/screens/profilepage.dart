import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';


import '../../constants.dart';
import '../../core/utils/color_constant.dart';
import '../../providers/user_provider.dart';
import '../widgets/notificationbutton.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? pickedImage;
  late String imageUrl;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imagePath = File(image.path);

    setState(() {
      pickedImage = imagePath;
    });
  }

  // void _uploadImage({required File image}) async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   var storageReference =
  //   FirebaseStorage.instance.ref().child("UserImage/${user?.uid}");
  //   var uploadTask = storageReference.putFile(image);
  //   var snapshot = await uploadTask.whenComplete(() => {});
  //
  //   imageUrl = await snapshot.ref.getDownloadURL();
  // }

  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray300,
      appBar: AppBar(
        title: Text(
          "Profile Page",
          style: TextStyle(color: primaryColor),
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
        actions: <Widget>[NotificationButton()],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textfield(
                      hintText:
                          context.watch<UserProvider>().getUserInfo.username!,
                    ),
                    textfield(
                      hintText:
                          context.watch<UserProvider>().getUserInfo.email!,
                    ),
                    textfield(
                      hintText: context
                          .watch<UserProvider>()
                          .getUserInfo
                          .student_id!
                          .toString(),
                    ),
                    textfield(
                      hintText: 'Something',
                    ),
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: pickedImage == null
                        ? MemoryImage(kTransparentImage)
                        : Image.file(pickedImage!).image,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: primaryColor,
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Choose Option",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: primaryColor,
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    getImage(ImageSource.camera);
                                  },
                                  splashColor: Colors.transparent,
                                  child: Row(
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.camera,
                                          color: primaryColor,
                                        ),
                                      ),
                                      Text(
                                        "Camera",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff555555),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    getImage(ImageSource.gallery);
                                  },
                                  splashColor: Colors.transparent,
                                  child: Row(
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.image,
                                          color: primaryColor,
                                        ),
                                      ),
                                      Text(
                                        "Gallery",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xff555555),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFE8DFDF);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
