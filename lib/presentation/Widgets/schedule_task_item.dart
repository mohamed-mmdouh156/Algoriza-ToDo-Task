import 'package:algoriza_task_todo/presentation/Widgets/title_text.dart';
import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';

class ScheduleTaskItem extends StatefulWidget {

  final String taskTime;
  final String taskTitle;
  final Color taskColor;

  const ScheduleTaskItem({
    required this.taskTime,
    required this.taskTitle,
    required this.taskColor,
    Key? key}) : super(key: key);

  @override
  State<ScheduleTaskItem> createState() => _ScheduleTaskItemState();
}

class _ScheduleTaskItemState extends State<ScheduleTaskItem> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s16),
        color: widget.taskColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(text: widget.taskTime , color: ColorManager.white,),
                const SizedBox(
                  height: 5,
                ),
                TitleText(text: widget.taskTitle , fontWeight: FontWeight.w400, color: ColorManager.white,),
              ],
            ),
          ),
          IconButton(
            onPressed: (){
              setState((){
                isDone =! isDone;
              });
            },
            icon: isDone == true ? Icon(
              Icons.check_circle,
              color: ColorManager.white,
            ): Icon(
              Icons.check_circle_outline,
              color: ColorManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
