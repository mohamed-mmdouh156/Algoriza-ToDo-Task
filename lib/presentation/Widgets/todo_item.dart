import 'dart:ffi';

import 'package:algoriza_task_todo/app/bloc/cubit.dart';
import 'package:algoriza_task_todo/app/bloc/state.dart';
import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/font_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoItem extends StatefulWidget {
  final int itemColor;
  final String itemText;
  final int id;
  bool? isDone ;

  ToDoItem({
    Key? key,
    required this.itemColor,
    required this.itemText,
    required this.id,
    this.isDone = false,
  }) : super(key: key);

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context , state){
        return Row(
          children: [
            IconButton(
              onPressed: (){
                setState((){
                  widget.isDone =! widget.isDone!;
                });
                widget.isDone == true ? AppCubit.get(context).updateTaskState(completed: true, id: widget.id) : AppCubit.get(context).updateTaskState(completed: false, id: widget.id);
              },
              icon: widget.isDone == true? Icon(
                Icons.check_box,
                color: Color(widget.itemColor),
              ) :Icon(
                Icons.check_box_outline_blank,
                color: Color(widget.itemColor),
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
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Color(widget.itemColor),
              ),
              itemBuilder: (context) =>[
                  PopupMenuItem(
                    value: 1,
                    onTap: (){
                      AppCubit.get(context).updateTaskState(completed: true, id: widget.id);
                    },
                    child: ListTile(
                      leading: Icon(
                          Icons.check_circle,
                        color: ColorManager.blue,
                      ),
                      title: Text(
                          'Completed',
                        style: GoogleFonts.roboto(
                          color: ColorManager.blue,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    onTap: (){
                      AppCubit.get(context).updateTaskState(completed: false, id: widget.id);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.cancel,
                        color: ColorManager.blue,
                      ),
                      title: Text(
                        'Uncompleted',
                        style: GoogleFonts.roboto(
                          color: ColorManager.blue,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    onTap: (){
                      AppCubit.get(context).addToFavoriteState(isFavorite: true, id: widget.id);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.favorite,
                        color: ColorManager.blue,
                      ),
                      title: Text(
                        'Favorite',
                        style: GoogleFonts.roboto(
                          color: ColorManager.blue,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 4,
                    onTap: (){
                      AppCubit.get(context).deleteDatabase(id: widget.id);
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.delete,
                        color: ColorManager.blue,
                      ),
                      title: Text(
                        'Delete',
                        style: GoogleFonts.roboto(
                          color: ColorManager.blue,
                        ),
                      ),
                    ),
                  ),
                ],
            ),
          ],
        );
      },
    );
  }
}
