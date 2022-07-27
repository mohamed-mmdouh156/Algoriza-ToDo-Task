import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';

class ColorCircle extends StatefulWidget {
  final Color color ;
  final Function onPressed;
  bool? isChecked;

   ColorCircle({
    required this.color,
    required this.onPressed,
    this.isChecked = false,
    Key? key}) : super(key: key);

  @override
  State<ColorCircle> createState() => _ColorCircleState();
}

class _ColorCircleState extends State<ColorCircle> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s50,
      width: AppSize.s50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: widget.color,
          ),
          IconButton(
            onPressed: (){
              widget.onPressed();
              setState((){
                widget.isChecked =! widget.isChecked!;
              });
            },
            icon: widget.isChecked == true ? Icon(
              Icons.check,
              color: ColorManager.white,
            ) :const Icon(
              Icons.check,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
