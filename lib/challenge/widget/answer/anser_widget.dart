import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final ValueChanged<AnswerModel> onTap;
  final bool isSelected;
  final bool disabled;

  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    this.disabled = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: this.disabled,
        child: GestureDetector(
          onTap: () {
            onTap(answer);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: isSelected ? AppColors.lightGreen : AppColors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.fromBorderSide(BorderSide(
                    color: isSelected ? AppColors.green : AppColors.border))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answer.title,
                    style: isSelected
                        ? AppTextStyles.bodyDarkGreen
                        : AppTextStyles.body,
                  ),
                ),
                Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.darkGreen : AppColors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.fromBorderSide(
                        BorderSide(
                            color: isSelected
                                ? AppColors.lightGreen
                                : AppColors.border),
                      ),
                    ),
                    child: isSelected
                        ? Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                        : null)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
