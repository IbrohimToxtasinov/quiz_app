import 'package:flutter/material.dart';
import 'package:quiz_app/screens/otp_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/utils/images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formkey = GlobalKey<FormState>();
class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60,),
              const Center(
                child: Text("Login", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35),),
              ),
              const SizedBox(height: 40,),
              Stack(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    child: SvgPicture.asset(MyImages.icon_login,)),
                  Positioned(
                    left: 80,
                    child: Container(
                      width: 80,
                      height: 80,
                      child: SvgPicture.asset(MyImages.icon_login_logo)),
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              buildTextField( context ),
              const SizedBox(height: 40,),
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  if(_formkey.currentState!.validate()){
                    saveLogin(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Successfully Logined')),
                    );
                  }
                },
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: const Center(
                    child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
  void saveLogin(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("LoginedIn", true);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const OtpPage()));
  }

 Widget buildTextField(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 322,
        height: 70,
        child: TextFormField( 
          controller: loginController,
          style: TextStyle(),
          keyboardType: TextInputType.phone,
          obscureText: false,
          validator: (value) {
            if(value == null || value.isEmpty) {
              return "Enter your mobile number";
            }
            return null;
          },
          decoration: const InputDecoration(
            filled: true,
            hintText: "Enter your mobile number",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
        ),
      ),
    ],
  );
}
}