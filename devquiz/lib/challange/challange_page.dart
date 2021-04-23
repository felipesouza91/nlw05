import 'package:devquiz/challange/widget/next_button/next_button_widget.dart';
import 'package:devquiz/challange/widget/questions_indicator/question_indicator_widget.dart';
import 'package:devquiz/challange/widget/quiz/quiz_widget.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallangePage extends StatefulWidget {
  final List<QuestionModel> questions;
  const ChallangePage({Key? key, required this.questions}) : super(key: key);
  @override
  _ChallangePageState createState() => _ChallangePageState();
}

class _ChallangePageState extends State<ChallangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              QuestionIndicatorWidget(),
            ],
          ),
        ),
      ),
      body: QuizWidget(
        question: widget.questions[0],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: NextButtonWidget.white(
                label: "Facil",
                onTap: () {},
              )),
              SizedBox(width: 7),
              Expanded(
                  child: NextButtonWidget.green(
                label: "Confirmar",
                onTap: () {},
              )),
            ],
          ),
        ),
      ),
    );
  }
}
