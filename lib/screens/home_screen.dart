import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/screens/login_page.dart';
import 'package:quiz_app/screens/question_page.dart';
import 'package:quiz_app/screens/question_page2.dart';
import 'package:quiz_app/screens/question_page3.dart';
import 'package:quiz_app/screens/welcome_screen_splash_page.dart';
import 'package:quiz_app/utils/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(child: SvgPicture.asset(MyImages.icon_logo)),
        actions: [
          InkWell(
            onTap: () {
              showDialog(context: context, 
              builder: ((context) {
                return AlertDialog(
                  title: Text("Logout"),
                  content: Text("Siz aniq chiqmoqchimisiz"),
                  actions: [
                    TextButton(onPressed: (){
                      saveLogin(context);
                    }, child: Text("ok")),
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("No")),
                  ],
                );
              }),
              );
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(Icons.logout_outlined, color: Colors.black,))
          ),
          const SizedBox(width: 10,),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.person, color: Colors.black,)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildButton("1. Potaxtlar", "2 min", Colors.blue, context, ),
              const SizedBox(height: 20,),
              buildButton2("2. O'zbekiston Tarixi", "2 min", Colors.yellow, context),
              const SizedBox(height: 20,),
              buildButton3("3. Matematika", "2 min", Colors.red, context),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
  void saveLogin(context) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("LoginedIn", false);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

Widget buildButton(text, time,  color, BuildContext context) {
  return InkWell(
    splashColor: Colors.grey,
    onTap: () {
    Navigator.push(context,
      MaterialPageRoute(builder: ((context) => const QuestionPage())));
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
          ),
          Container(
            child: Text(time, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
          ),
        ],
      ),
    ),
  );
}


Widget buildButton2(text, time,  color, BuildContext context) {
  return InkWell(
    splashColor: Colors.grey,
    onTap: () {
    Navigator.push(context,
      MaterialPageRoute(builder: ((context) => const QuestionPage2())));
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
          ),
          Container(
            child: Text(time, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
          ),
        ],
      ),
    ),
  );
}

Widget buildButton3(text, time,  color, BuildContext context) {
  return InkWell(
    splashColor: Colors.grey,
    onTap: () {
    Navigator.push(context,
      MaterialPageRoute(builder: ((context) => const QuestionPage3())));
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
          ),
          Container(
            child: Text(time, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
          ),
        ],
      ),
    ),
  );
}