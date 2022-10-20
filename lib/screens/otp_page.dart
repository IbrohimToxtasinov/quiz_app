import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/screens/register.dart';
import 'package:quiz_app/utils/images.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  void initState(){
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage())),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60,),
          Center(
            child: Container(
              child: const Text("Otp", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35),),
            ),
          ),
          const SizedBox(height: 40,),
          Container(
            child: Center  (child: SvgPicture.asset(MyImages.icon_login_logo, width: 70 , height: 70,)),
          ),
          Container(
            child: const Text("Enter your 6 digit otp here", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.grey),),
          ),
          const SizedBox(height: 50,),
          Container(
            height: 50,
            width: 250, 
            child: SvgPicture.asset(MyImages.icon_input_otp),
          ),
          const SizedBox(height: 40,),
          Container(
            width: 250,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: const Center(
              child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 24),),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            child: const Text("Enter your 6 digit otp here", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.grey),),
          ),
          const SizedBox(height: 50,),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 48, left: 57, right: 34),
              //margin: const EdgeInsets.only(left: 120),
              child: Center  (child: SvgPicture.asset(MyImages.icon_clipart, width: 300 , height: 300)),
            ),
          ),
        ],
      ),
    );
  }
}