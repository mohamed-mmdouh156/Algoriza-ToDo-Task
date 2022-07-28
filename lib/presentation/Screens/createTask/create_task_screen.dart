import 'package:algoriza_task_todo/app/bloc/cubit.dart';
import 'package:algoriza_task_todo/app/bloc/state.dart';
import 'package:algoriza_task_todo/data/local/notification_helper.dart';
import 'package:algoriza_task_todo/presentation/Widgets/color_circle.dart';
import 'package:algoriza_task_todo/presentation/Widgets/default_text_field.dart';
import 'package:algoriza_task_todo/presentation/Widgets/defualtButton.dart';
import 'package:algoriza_task_todo/presentation/Widgets/title_text.dart';
import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/font_manager.dart';
import 'package:algoriza_task_todo/presentation/route_manager.dart';
import 'package:algoriza_task_todo/presentation/string_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {

  var notifyHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }


  @override
  Widget build(BuildContext context) {

    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit ,AppStates>(
        listener: (context , state) {},
        builder: (context , state) {
          var cubit = AppCubit.get(context);
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
                'Add Task',
                style: GoogleFonts.roboto(
                  fontSize: FontSize.s18,
                  color: ColorManager.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: AppSize.s2),
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                color: ColorManager.white,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TitleText(
                              text: StringManager.titleHint,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultTextField(
                            hintText: StringManager.titleHint,
                            controller: cubit.titleController,
                            onTap: (){},
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          TitleText(
                              text: StringManager.deadlineHint,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultTextField(
                            hintText: StringManager.deadlineHint,
                            controller: cubit.dateController,
                            suffixIcon: Icons.arrow_drop_down,
                            onTap: (){
                              AppCubit.get(context).showDate(context);
                            },
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  children: [
                                    TitleText(text: 'Start Time'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    DefaultTextField(
                                      hintText: StringManager.startDateHint,
                                      controller: AppCubit.get(context).startTimeController,
                                      suffixIcon: Icons.access_time_outlined,
                                      onTap: (){
                                        AppCubit.get(context).showTime(context, AppCubit.get(context).startTimeController);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                      children: [
                                        TitleText(text: 'End Time'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        DefaultTextField(
                                          hintText: StringManager.endDateHint,
                                          controller: AppCubit.get(context).endTimeController,
                                          suffixIcon: Icons.access_time_outlined,
                                          onTap: (){
                                            AppCubit.get(context).showTime(context, AppCubit.get(context).endTimeController);
                                          },
                                        ),
                                      ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          TitleText(
                              text: StringManager.remindHint,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorManager.whiteDark,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10 , ),
                            child: DropdownButton(
                              elevation: 0,
                              hint: AppCubit.get(context).dropdownRemindValue == null ? Text(
                                StringManager.remindHint,
                                style: TextStyle(
                                  color : ColorManager.grey1 ,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                                  : Text( AppCubit.get(context).dropdownRemindValue!,
                                style: TextStyle(color: ColorManager.grey1 , fontSize: 14.0, fontWeight: FontWeight.w500),
                              ),
                              dropdownColor: Colors.grey[300],
                              isExpanded: true,
                              iconSize: 30.0,
                              underline: Container(),
                              style: TextStyle(color: ColorManager.grey1 , fontSize: 14.0 , fontWeight: FontWeight.w500),
                              items: ['10 minute', '30 minute', '1 hour','1 day'].map(
                                    (value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                cubit.changeDropMenuValue1(value);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          TitleText(
                              text: StringManager.repeatHint,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorManager.whiteDark,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10 , ),
                            child: DropdownButton(
                              elevation: 0,
                              hint: AppCubit.get(context).dropdownRepeatValue == null ? Text(
                                StringManager.repeatHint,
                                style: TextStyle(
                                  color : ColorManager.grey1 ,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                                  : Text( AppCubit.get(context).dropdownRepeatValue!,
                                style: TextStyle(color: ColorManager.grey1 , fontSize: 14.0, fontWeight: FontWeight.w500),
                              ),
                              dropdownColor: Colors.grey[300],
                              isExpanded: true,
                              iconSize: 30.0,
                              underline: Container(),
                              style: TextStyle(color: ColorManager.grey1 , fontSize: 14.0 , fontWeight: FontWeight.w500),
                              items: ['week', 'month', 'year','always'].map(
                                    (value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                cubit.changeDropMenuValue2(value);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              ColorCircle(color: ColorManager.red, onPressed: (){ cubit.chooseToDoColor(0); } , isChecked: cubit.color0,),
                              ColorCircle(color: ColorManager.orange, onPressed: (){ cubit.chooseToDoColor(1); } , isChecked: cubit.color1,),
                              ColorCircle(color: ColorManager.gold, onPressed: (){ cubit.chooseToDoColor(2); } , isChecked: cubit.color2,),
                              ColorCircle(color: ColorManager.blue, onPressed: (){ cubit.chooseToDoColor(3); } , isChecked: cubit.color3,),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          DefaultButton(buttonText: 'Create Task', onPressed: (){
                            // if(formKey.currentState!.validate())
                            //   {
                            //     cubit.insertDatabase(
                            //       title: cubit.titleController.text,
                            //       deadline: cubit.dateController.text,
                            //       startTime: cubit.startTimeController.text,
                            //       endTime: cubit.endTimeController.text,
                            //       reminder: cubit.dropdownRemindValue!,
                            //       repeat: cubit.dropdownRepeatValue!,
                            //       favorite: 'unfavorite',
                            //       color: 0xffff9d42,
                            //     );
                            //   }
                                cubit.insertDatabase(
                                  title: cubit.titleController.text,
                                  deadline: cubit.dateController.text,
                                  startTime: cubit.startTimeController.text,
                                  endTime: cubit.endTimeController.text,
                                  reminder: cubit.dropdownRemindValue!,
                                  repeat: cubit.dropdownRepeatValue!,
                                  color: cubit.todoColor,
                                ).then((value) {
                                  notifyHelper.scheduledNotification(
                                    id:0,
                                    title: cubit.titleController.text,
                                    body: cubit.remindTimeController.text,
                                    time : cubit.startTimeController.text,
                                  );
                                  Navigator.pop(context);
                                });
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
