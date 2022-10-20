import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/screens/home_screen.dart';
import 'package:quiz_app/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
final _formkey = GlobalKey<FormState>();
class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60,),
              Center(
                child: Container(
                  child: const Text("Register", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35),),
                ),
              ),
              const SizedBox(height: 40,),
              Container(
                child: Center  (child: SvgPicture.asset(MyImages.icon_login_logo, width: 70, height: 70,)),
              ),
              const SizedBox(height: 55,),
              buildTextField("Enter your mobile number",TextInputType.phone, "Enter your mobile number"),
              const SizedBox(height: 10,),
              buildTextField("Password", TextInputType.text, "Enter your password"),
              const SizedBox(height: 10,),
              buildTextField("Comnfirm Password", TextInputType.text, "Enter your comnfirm password"),
              const SizedBox(height: 20,),   
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
                  width: 250,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text("Register", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Container(
                child: const Text("if you have already account click here", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),),
              ),
            ]
          ),
        ),
      ),
    );
  }
   void saveLogin(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("LoginedIn", true);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreenPage()));
  }
}

Widget buildTextField(String hintName,TextInputType choose, String errorname) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 322,
        height: 70,
        child: TextFormField(
          style: TextStyle(),
          keyboardType: choose,
          obscureText: false,
          validator: (value) {
            if(value == null || value.isEmpty) {
              return errorname;
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            hintText: hintName,
            fillColor: Colors.white,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
        ),
      ),
    ],
  );
}