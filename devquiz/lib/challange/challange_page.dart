import 'package:devquiz/challange/widget/questions_indicator/question_indicator_widget.dart';
import 'package:devquiz/challange/widget/quiz/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallangePage extends StatefulWidget {
  const ChallangePage({Key? key}) : super(key: key);
  @override
  _ChallangePageState createState() => _ChallangePageState();
}

class _ChallangePageState extends State<ChallangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: SafeArea(
          minimum: EdgeInsets.only(top: 30),
          top: true,
          child: QuestionIndicatorWidget(),
        ),
      ),
      body: QuizWidget(title: "O que o flutter faz em sua totalidade"),
    );
  }
}
