import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/screens/login_page.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WelcomeScreenSplashPage extends StatefulWidget {
  const WelcomeScreenSplashPage({Key? key}) : super(key: key);

  @override
  State<WelcomeScreenSplashPage> createState() => _WelcomeScreenSplashPageState();
}

class _WelcomeScreenSplashPageState extends State<WelcomeScreenSplashPage> {
  bool isLog = false;

  Future<bool> isLoggedIn() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    isLog = _pref.getBool("LoginedIn") ?? false;
    return _pref.getBool("LoginedIn") ?? false;
  }

  @override
  void initState() {
    super.initState();

    isLoggedIn();
    goNext();
  }

  void goNext() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return isLog ? HomeScreenPage() : LoginPage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: oldpage(),
    );
  }
  Widget oldpage() {
    return Container(
      padding: const EdgeInsets.only(top: 160, left: 33, right: 34, bottom: 40).r,
      width: double.infinity.w,
      height: double.infinity.h,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(MyImages.image_background1),fit: BoxFit.cover),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 100),
        child: const Center(
          child: Text("Welcome", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: MyColors.C_FFFEFC),)
        ),
      ),
    );
  }
}