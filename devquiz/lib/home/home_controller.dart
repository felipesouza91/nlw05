import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/awnser_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.EMPTY);
  UserModel? user;
  List<QuizModel>? quizzes;
  final repository = HomeRepository();
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  void getUSer() async {
    state = HomeState.LOADING;
    user = await repository.getUser();
    state = HomeState.SUCCESS;
  }

  void getQuizzes() async {
    state = HomeState.LOADING;
    quizzes = await repository.getQuizzes();
    state = HomeState.SUCCESS;
  }
}
