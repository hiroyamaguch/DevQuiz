import 'package:devquiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatefulWidget {
  final String label;
  final ValueChanged<bool> onTap;

  LevelButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
  })   : assert([
          "Fácil",
          "Médio",
          "Difícil",
          "Perito",
        ].contains(label)),
        super(key: key);

  @override
  _LevelButtonWidgetState createState() => _LevelButtonWidgetState();
}

class _LevelButtonWidgetState extends State<LevelButtonWidget> {
  bool isSelected = true;

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito
    },
  };

  Color get color =>
      isSelected ? config[widget.label]!['color']! : AppColors.white;

  Color get borderColor =>
      isSelected ? config[widget.label]!['borderColor']! : AppColors.border;

  Color get fontColor =>
      isSelected ? config[widget.label]!['fontColor']! : AppColors.grey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
        widget.onTap(isSelected);
      },
      child: Container(
        decoration: BoxDecoration(
            color: color,
            border: Border.fromBorderSide(BorderSide(color: borderColor)),
            borderRadius: BorderRadius.circular(28)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Text(
            this.widget.label,
            style: GoogleFonts.notoSans(fontSize: 13, color: fontColor),
          ),
        ),
      ),
    );
  }
}
