import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/home_controller.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  List<String> levelQuizzes = ['facil', 'medio', 'dificil', 'perito'];

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes(levels: levelQuizzes);

    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
      statusBarBrightness: Brightness.light, //status bar brigtness
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
    ));

    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: 'Fácil',
                    onTap: (isSelected) {
                      if (isSelected)
                        levelQuizzes.add('facil');
                      else
                        levelQuizzes.remove('facil');
                      controller.getQuizzes(levels: levelQuizzes);
                    },
                  ),
                  LevelButtonWidget(
                    label: 'Médio',
                    onTap: (isSelected) {
                      if (isSelected)
                        levelQuizzes.add('medio');
                      else
                        levelQuizzes.remove('medio');
                      controller.getQuizzes(levels: levelQuizzes);
                    },
                  ),
                  LevelButtonWidget(
                    label: 'Difícil',
                    onTap: (isSelected) {
                      if (isSelected)
                        levelQuizzes.add('dificil');
                      else
                        levelQuizzes.remove('dificil');
                      controller.getQuizzes(levels: levelQuizzes);
                    },
                  ),
                  LevelButtonWidget(
                    label: 'Perito',
                    onTap: (isSelected) {
                      if (isSelected)
                        levelQuizzes.add('perito');
                      else
                        levelQuizzes.remove('perito');
                      controller.getQuizzes(levels: levelQuizzes);
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: controller.quizzes!
                        .map((quiz) => QuizCardWidget(
                            title: quiz.title,
                            percent:
                                quiz.questionAnswered / quiz.questions.length,
                            progress:
                                "${quiz.questionAnswered}/${quiz.questions.length}",
                            imageName: quiz.imagem,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChallengePage(
                                      questions: quiz.questions,
                                      title: quiz.title,
                                    ),
                                  ));
                            }))
                        .toList()),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
