import 'package:algoriza_task_todo/app/bloc/cubit.dart';
import 'package:algoriza_task_todo/app/bloc/state.dart';
import 'package:algoriza_task_todo/presentation/Widgets/defualtButton.dart';
import 'package:algoriza_task_todo/presentation/Widgets/todo_item.dart';
import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/font_manager.dart';
import 'package:algoriza_task_todo/presentation/route_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UncompletedScreen extends StatelessWidget {
  const UncompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.teal,
      Colors.black,
    ];

    List <String> texts = [
      'todo one',
      'todo two',
      'todo three',
      'todo four',
    ];

    return BlocConsumer<AppCubit , AppStates>(
      listener: (context ,state) {},
      builder: (context ,state) {
        List<Map> uncompletedTasks = AppCubit.get(context).uncompletedTasks;
        return Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Container(
            color: ColorManager.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context , index) => ToDoItem(itemColor: uncompletedTasks[index]['color'] , itemText: uncompletedTasks[index]['title'], id: uncompletedTasks[index]['id'] , isDone: uncompletedTasks[index]['completed'] == 1 ?true : false,),
                      separatorBuilder: (context , index) => const SizedBox(
                        height: AppSize.s8,
                      ),
                      itemCount: uncompletedTasks.length,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  DefaultButton(buttonText: 'Add Task', onPressed: (){
                    Navigator.pushNamed(context, RoutesManager.createTeskRoute);
                  }),
                  const SizedBox(
                    height: AppSize.s8,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}