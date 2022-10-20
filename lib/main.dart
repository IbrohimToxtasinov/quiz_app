import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/login_page.dart';
import 'package:quiz_app/screens/otp_page.dart';
import 'package:quiz_app/screens/question_page.dart';
import 'package:quiz_app/screens/register.dart';
import 'package:quiz_app/screens/welcome_screen_splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const WelcomeScreenSplashPage(),
    );
  }
}