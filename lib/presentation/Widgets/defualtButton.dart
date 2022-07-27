import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/font_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const DefaultButton({
    required this.buttonText,
    required this.onPressed,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      height: AppSize.s50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s12),
        color: ColorManager.primary,
      ),
      child: MaterialButton(
        onPressed: (){
          onPressed();
        },
        child: Text(
          buttonText,
          style: GoogleFonts.lato(
            fontSize: FontSize.s16,
            fontWeight: FontWeight.w900,
            color: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
