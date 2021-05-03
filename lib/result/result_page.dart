import 'package:devquiz/challenge/widget/next_button/next_button_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int correctAnswers;
  final int qntAnswers;

  const ResultPage({
    Key? key,
    required this.title,
    required this.correctAnswers,
    required this.qntAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(AppImages.trophy, height: 250),
                Text(
                  "Parabéns!",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                        text: "\n$title",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      TextSpan(
                        text: "\ncom $correctAnswers de $qntAnswers acertos.",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                        label: "Compartilhar",
                        onTap: () => {
                          Share.share(
                              'DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\nObtive: ${correctAnswers / qntAnswers} % de aproveitamento')
                        },
                      ),
                    ),
                  )
                ]),
                SizedBox(height: 20),
                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.white(
                        label: "Voltar ao início",
                        onTap: () => {Navigator.pop(context)},
                      ),
                    ),
                  )
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
