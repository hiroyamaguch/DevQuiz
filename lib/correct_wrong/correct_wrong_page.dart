import 'package:devquiz/challenge/widget/next_button/next_button_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class CorrectWrongPage extends StatelessWidget {
  final bool isCorrect;
  final String response;
  final VoidCallback onTap;

  const CorrectWrongPage({
    Key? key,
    required this.isCorrect,
    required this.response,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                if (isCorrect)
                  Image.asset(AppImages.check, height: 120)
                else
                  Image.asset(AppImages.error, height: 120),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 56),
                if (isCorrect)
                  Text("Acertou!", style: AppTextStyles.heading40)
                else
                  Text("Errou :/", style: AppTextStyles.heading40),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(text: response, style: AppTextStyles.body),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 56),
                Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                        label: "Avançar",
                        onTap: onTap,
                      ),
                    ),
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
