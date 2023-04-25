
import 'package:application/presentation/screens/ForgottenPassword.dart';
import 'package:application/presentation/screens/contact.dart';
import 'package:application/presentation/screens/fingerprint_page.dart';
import 'package:application/presentation/screens/home.dart';
import 'package:application/presentation/screens/login.dart';
import 'package:application/presentation/screens/profilepage.dart';
import 'package:application/presentation/screens/signup.dart';
import 'package:application/presentation/screens/updateinfo.dart';
import 'package:application/presentation/screens/welcomescreen.dart';
import 'package:application/providers/food_provider.dart';
import 'package:application/providers/notification_provider.dart';
import 'package:application/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NotificationProvider>(
          create: (ctx) => NotificationProvider(),
        ),
        ChangeNotifierProvider<FoodProvider>(
          create: (ctx) => FoodProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (ctx) => UserProvider(),
        )
      ],
      child: Splash(),
    ),
  );
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: MyApp(),
      duration: 4000,
      imageSize: 150,
      imageSrc: 'images/splash.jpeg',
      text: "Ashesi Food App",
      textType: TextType.NormalText,
      textStyle: const TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Color(0xFFE8DFDF),
    );

    return MaterialApp(
      title: 'Splash screen Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: example1,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomeScreen(),
        "/login": (context) => Login(),
        "/forgottenPassword": (context) => ForgottenPassword(),
        "/signup": (context) => const SignUp(),
        "/homepage": (context) => HomePage(),
        "/contactus": (context) => ContactPage(),
        "/profile": (context) => ProfilePage(),
        "/update": (context) => Update(),
        "/fingerprint": (context) =>FingerprintPage(),
      },
    );
  }
}
