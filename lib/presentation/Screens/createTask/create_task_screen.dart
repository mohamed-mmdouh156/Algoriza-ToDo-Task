import 'package:algoriza_task_todo/app/bloc/cubit.dart';
import 'package:algoriza_task_todo/app/bloc/state.dart';
import 'package:algoriza_task_todo/presentation/Widgets/default_text_field.dart';
import 'package:algoriza_task_todo/presentation/Widgets/drop_down_button.dart';
import 'package:algoriza_task_todo/presentation/Widgets/title_text.dart';
import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/font_manager.dart';
import 'package:algoriza_task_todo/presentation/route_manager.dart';
import 'package:algoriza_task_todo/presentation/string_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit ,AppStates>(
        listener: (context , state) {},
        builder: (context , state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
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
                          controller: titleController,
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
                          controller: AppCubit.get(context).dateController,
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
                            Container(
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
                            Container(
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
                            hint: AppCubit.get(context).dropdownValue == null ? Text(
                              StringManager.remindHint,
                              style: TextStyle(
                                color : ColorManager.grey1 ,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                                : Text( AppCubit.get(context).dropdownValue!,
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
                            hint: AppCubit.get(context).dropdownValue == null ? Text(
                              StringManager.repeatHint,
                              style: TextStyle(
                                color : ColorManager.grey1 ,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                                : Text( AppCubit.get(context).dropdownValue!,
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

                            },
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          width : double.infinity,
                          height: AppSize.s50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s12),
                            color: ColorManager.primary,
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              Navigator.pushNamed(context, RoutesManager.createTeskRoute);
                            },
                            child: Text(
                              'Create Task',
                              style: GoogleFonts.lato(
                                fontSize: FontSize.s16,
                                fontWeight: FontWeight.w900,
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ),
                      ],
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
