import 'package:algoriza_task_todo/presentation/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String text;
  FontWeight? fontWeight;
  Color? color;

  TitleText({
    required this.text,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: FontSize.s16,
          fontWeight: fontWeight,
          color: color,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
