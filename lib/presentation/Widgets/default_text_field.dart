import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/string_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String hintText;
  IconData? suffixIcon;
  TextEditingController controller = TextEditingController();
  final Function()? onTap;

   DefaultTextField({
    required this.hintText,
    required this.controller,
     required this.onTap,
     this.suffixIcon,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: ColorManager.whiteDark,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14.0,
          color: ColorManager.grey,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.0,
            color: ColorManager.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(
              vertical: AppSize.s18,
              horizontal: AppSize.s12,
          ),
          border: InputBorder.none,
          fillColor: Colors.blue,
          suffixIcon: Icon(
              suffixIcon,
            color: ColorManager.grey1,
          )
        ),
        controller: controller,
        onTap: onTap,
      ),
    );
  }
}
