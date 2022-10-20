import 'package:quiz_app/models/option_model.dart';

class QuestionModel {
  String question;
  OptionModel option1;
  OptionModel option2;
  OptionModel option3;
  OptionModel option4;
  int trueAnswer;

  QuestionModel(
      {required this.question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.option4,
      this.trueAnswer = 1});

  static final PoytaxtQuestion = [
    QuestionModel(
      question: "Rossiya davlatinig poytaxti?",
      option1: OptionModel(title: "Moskva"),
      option2: OptionModel(title: "Astana"),
      option3: OptionModel(title: "Washington"),
      option4: OptionModel(title: "Berlin"),
      trueAnswer: 1,
    ),
    QuestionModel(
      question: "Fransiyaning poytaxti?",
      option1: OptionModel(title: "Parij"),
      option2: OptionModel(title: "Germaniya"),
      option3: OptionModel(title: "Buyuk Britaniya"),
      option4: OptionModel(title: "Italiya"),
      trueAnswer: 1,
    ),
    QuestionModel(
      question: "Buyuk Britaniyaning poyatxti?",
      option1: OptionModel(title: "Berlin"),
      option2: OptionModel(title: "Rim"),
      option3: OptionModel(title: "London"),
      option4: OptionModel(title: "Washington"),
      trueAnswer: 3,
    ),
    QuestionModel(
      question: "Xitoy davlatining potaxti?",
      option1: OptionModel(title: "Rim"),
      option2: OptionModel(title: "Astana"),
      option3: OptionModel(title: "Moskva"),
      option4: OptionModel(title: "Pekin"),
      trueAnswer: 4,
    ),
    QuestionModel(
      question: "Jazoir qaysi davlatning poytaxti?",
      option1: OptionModel(title: "Qohira"),
      option2: OptionModel(title: "Jazoir"),
      option3: OptionModel(title: "Pekin"),
      option4: OptionModel(title: "Astana"),
      trueAnswer: 2,
    ),
  ];

  static final UzbekistanHistory = [
    QuestionModel(
      question: "O'zbekiston qachon mustaqilliga erishgan?",
      option1: OptionModel(title: "1991"),
      option2: OptionModel(title: "1990"),
      option3: OptionModel(title: "1992"),
      option4: OptionModel(title: "1989"),
      trueAnswer: 1,
    ),
    QuestionModel(
      question: "O'zbekiston bayrog'i qachon qabul qilingan?",
      option1: OptionModel(title: "1992"),
      option2: OptionModel(title: "1993"),
      option3: OptionModel(title: "1991"),
      option4: OptionModel(title: "1990"),
      trueAnswer: 3,
    ),
    QuestionModel(
      question: "O'zbekiston gerbi qachon qabul qilingan?",
      option1: OptionModel(title: "1992"),
      option2: OptionModel(title: "1993"),
      option3: OptionModel(title: "1994"),
      option4: OptionModel(title: "1991"),
      trueAnswer: 1,
    ),
    QuestionModel(
      question: "O'zbekiston Kponstitutsiaysi qachon qabul qilingan?",
      option1: OptionModel(title: "1991-yil 8-dekabr"),
      option2: OptionModel(title: "1992-yil 8-dekabr"),
      option3: OptionModel(title: "1991-yil 21-oktabr"),
      option4: OptionModel(title: "1992-yil 18 -noyabr"),
      trueAnswer: 1,
    ),
    QuestionModel(
      question: "O'zbekiston Madhiyasi qachon qabul qilingan?",
      option1: OptionModel(title: "1991-yil 8-dekabr"),
      option2: OptionModel(title: "1992-yil 12-dekabr"),
      option3: OptionModel(title: "1991-yil 21-oktabr"),
      option4: OptionModel(title: "1992-yil 18-noyabr"),
      trueAnswer: 3,
    ),
  ];

  static final Math = [
    QuestionModel(
      question: "10+15+20*3",
      option1: OptionModel(title: "80"),
      option2: OptionModel(title: "85"),
      option3: OptionModel(title: "90"),
      option4: OptionModel(title: "95"),
      trueAnswer: 2,
    ),
    QuestionModel(
      question: "(20+(15+0))*0",
      option1: OptionModel(title: "0"),
      option2: OptionModel(title: "35"),
      option3: OptionModel(title: "30"),
      option4: OptionModel(title: "20"),
      trueAnswer: 1,
    ),
    QuestionModel(
      question: "75-15*0+5-6+4",
      option1: OptionModel(title: "76"),
      option2: OptionModel(title: "80"),
      option3: OptionModel(title: "95"),
      option4: OptionModel(title: "55"),
      trueAnswer: 1,
    ),
    QuestionModel(
      question: "2*5-4+5",
      option1: OptionModel(title: "12"),
      option2: OptionModel(title: "15"),
      option3: OptionModel(title: "13"),
      option4: OptionModel(title: "11"),
      trueAnswer: 4,
    ),
    QuestionModel(
      question: "8+5*4",
      option1: OptionModel(title: "28"),
      option2: OptionModel(title: "15"),
      option3: OptionModel(title: "41"),
      option4: OptionModel(title: "53"),
      trueAnswer: 1,
    ),
  ];
}