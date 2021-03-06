import 'package:devquiz/challenge/widget/answer/anser_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<AnswerModel> onSelected;

  const QuizWidget({
    Key? key,
    required this.onSelected,
    required this.question,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answers(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Text(
            widget.question.title,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answers(i),
              disabled: indexSelected == i,
              isSelected: indexSelected == i,
              onTap: (value) {
                indexSelected = i;
                widget.onSelected(value);
                setState(() {});
              },
            ),
        ],
      ),
    );
  }
}
