import 'package:algoriza_task_todo/app/bloc/cubit.dart';
import 'package:algoriza_task_todo/app/bloc/state.dart';
import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/font_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoItem extends StatefulWidget {
  final Color itemColor;
  final String itemText;
  bool? isDone ;

  ToDoItem({
    Key? key,
    required this.itemColor,
    required this.itemText,
    this.isDone = false,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: (){
            setState((){
              widget.isDone =! widget.isDone!;
            });
          },
          icon: widget.isDone == true? Icon(
            Icons.check_box,
            color: widget.itemColor,
          ) :Icon(
            Icons.check_box_outline_blank,
            color: widget.itemColor,
          ),
        ),
        const SizedBox(
          width: AppSize.s8,
        ),
        Expanded(
          child: Text(
            widget.itemText,
            style: GoogleFonts.lato(
              color: ColorManager.black,
              fontSize: FontSize.s16,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
