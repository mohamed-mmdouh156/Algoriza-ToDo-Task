import 'package:algoriza_task_todo/app/bloc/state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController remindTimeController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  String? dropdownValue ;

  void showDate (context){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.parse('2025-01-01'),
    ).then((value)
    {
      dateController.text = DateFormat('dd-MM-yyyy').format(value!);
    });
    emit(AppShowDateState());
  }

  void showTime (context , controller) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value)
    {
      controller.text = value!.format(context);
    });
    emit(AppShowTimeState());
  }

  var date = DateTime.now();

  void changeDateState (var newDate)
  {
    date = newDate;
    emit(AppChangeDateState());
  }

}