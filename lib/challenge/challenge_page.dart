import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widget/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widget/quiz/quiz_widget.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/correct_wrong/correct_wrong_page.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengeController = ChallengeController();
  final pageController = PageController();
  var isCorrect = false;
  var selectedAnswer = '';

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      challengeController.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (isCorrect) {
      challengeController.correctAnswers++;
    }

    if (challengeController.currentPage < widget.questions.length) {
      isCorrect = false;
      selectedAnswer = '';
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            title: widget.title,
            qntAnswers: widget.questions.length,
            correctAnswers: challengeController.correctAnswers,
          ),
        ),
      );
  }

  void onSelected(AnswerModel answer) {
    if (answer.isRight) {
      isCorrect = true;
    } else {
      isCorrect = false;
    }
    selectedAnswer = answer.title;
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode.system == ThemeMode.dark
        ? SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // status bar color
            statusBarBrightness: Brightness.light, //status bar brigtness
            statusBarIconBrightness:
                Brightness.light, //status barIcon Brightness
          ))
        : SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // status bar color
            statusBarBrightness: Brightness.light, //status bar brigtness
            statusBarIconBrightness:
                Brightness.light, //status barIcon Brightness
            systemNavigationBarColor: AppColors.black, // navigation bar color
            systemNavigationBarDividerColor:
                AppColors.black, //Navigation bar divider color
            systemNavigationBarIconBrightness:
                Brightness.dark, //navigation bar icon
          ));

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ValueListenableBuilder<int>(
                valueListenable: challengeController.currentPageNotifier,
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
            .map((question) => QuizWidget(
                  question: question,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ValueListenableBuilder(
            valueListenable: challengeController.currentPageNotifier,
            builder: (context, value, _) => Row(
              children: [
                Expanded(
                  child: NextButtonWidget.white(
                    label: "Pular",
                    onTap: nextPage,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: NextButtonWidget.green(
                    label: "Confirmar",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CorrectWrongPage(
                            isCorrect: isCorrect,
                            response: selectedAnswer,
                            onTap: () {
                              Navigator.pop(context);
                              nextPage();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
