import 'package:algoriza_task_todo/app/bloc/cubit.dart';
import 'package:algoriza_task_todo/app/bloc/state.dart';
import 'package:algoriza_task_todo/presentation/Widgets/schedule_task_item.dart';
import 'package:algoriza_task_todo/presentation/Widgets/title_text.dart';
import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/font_manager.dart';
import 'package:algoriza_task_todo/presentation/route_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context , state) {},
        builder: (context , state) {
          var date = AppCubit.get(context).date;
          var scheduleTasks = AppCubit.get(context).scheduleTasks;

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorManager.black,
                ),
              ),
              title: Text(
                'Schedule',
                style: GoogleFonts.roboto(
                  fontSize: FontSize.s18,
                  color: ColorManager.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: AppSize.s2),
              child: Column(
                children: [
                  Container(
                    color: ColorManager.white,
                    padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DatePicker(
                          DateTime.now(),
                          initialSelectedDate: DateTime.now(),
                          selectionColor: ColorManager.primary,
                          selectedTextColor: Colors.white,
                          onDateChange: (date) {
                            AppCubit.get(context).changeDateState(date);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Expanded(
                    child: Container(
                      color: ColorManager.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TitleText(text: DateFormat('EEEE').format(date)),
                                //DateFormat("MMMM d").format(date)
                                const Spacer(),
                                TitleText(text: DateFormat('d MMMM yyyy').format(date)),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Expanded(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context , index) => ScheduleTaskItem(taskTime: scheduleTasks[index]['start_time'], taskTitle: scheduleTasks[index]['title'], taskColor: scheduleTasks[index]['color']),
                                  separatorBuilder: (context , index) => const SizedBox(height: 10,),
                                  itemCount: scheduleTasks.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
