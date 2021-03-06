import 'package:devquiz/challange/challenge_controller.dart';
import 'package:devquiz/challange/widget/next_button/next_button_widget.dart';
import 'package:devquiz/challange/widget/questions_indicator/question_indicator_widget.dart';
import 'package:devquiz/challange/widget/quiz/quiz_widget.dart';
import 'package:devquiz/result_page/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallangePage extends StatefulWidget {
  final List<QuestionModel> questions;
  const ChallangePage({Key? key, required this.questions}) : super(key: key);
  @override
  _ChallangePageState createState() => _ChallangePageState();
}

class _ChallangePageState extends State<ChallangePage> {
  final controller = ChallangeController();
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  nextPage() {
    if (controller.currentPage < widget.questions.length) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    }
  }

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
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((item) => QuizWidget(
                  question: item,
                  onChange: nextPage,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (value < widget.questions.length)
                        Expanded(
                            child: NextButtonWidget.white(
                          label: "Pular",
                          onTap: nextPage,
                        )),
                      if (value == widget.questions.length) SizedBox(width: 7),
                      if (value == widget.questions.length)
                        Expanded(
                            child: NextButtonWidget.green(
                          label: "Confirmar",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(),
                              ),
                            );
                          },
                        )),
                    ],
                  )),
        ),
      ),
    );
  }
}
