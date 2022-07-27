import 'package:algoriza_task_todo/app/bloc/state.dart';
import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController remindTimeController = TextEditingController();
  TextEditingController repeatController = TextEditingController();

  String? dropdownRemindValue ;
  String? dropdownRepeatValue ;

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
    getScheduleFromDatabase(database, DateFormat('dd-MM-yyyy').format(newDate!).toString());
    emit(AppChangeDateState());
  }

  void changeDropMenuValue1 (value)
  {
    dropdownRemindValue = value;
    emit(AppChangeDropMenuState());
  }
  void changeDropMenuValue2 (value)
  {
    dropdownRepeatValue = value;
    emit(AppChangeDropMenuState());
  }


  late Database database;

  void createDatabase () async
  {
    await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database , version){
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT , deadline TEXT , start_time TEXT , end_time TEXT , reminder TEXT , repeat TEXT , completed BOOLEAN , favorite BOOLEAN , color INT)').then((value)
        {
          print('database created successful');
        }).catchError((error)
        {
          print('error when creating database ${error.toString()}');
        });
      },

      onOpen: (database){
        print('database opened');
        getDataFromDatabase(database);
      },
    ).then((value)
    {
      database = value ;
      print('database ${value}');
      emit(AppCreateDatabaseState());
    }
    );
  }

  Future insertDatabase ({
    required String title ,
    required String deadline,
    required String startTime,
    required String endTime,
    required String reminder,
    required String repeat,
    required int color,
  }) async {
     await database.transaction((txn) async{
       txn.rawInsert(
          'INSERT INTO tasks(title , deadline , start_time , end_time , reminder, repeat, completed , favorite , color) VALUES("$title" , "$deadline" , "$startTime" , "$endTime" , "$reminder" , "$repeat" , ${false} , ${false} , "$color" )'
      ).then((value)
      {
        print('insert successfully : $value');
        getDataFromDatabase(database);
        emit(AppInsertDatabaseSuccessState());
      }).catchError((error){
        print('Error when insert row ${error.toString()}');
        emit(AppInsertDatabaseErrorState());
      });
       return null;
     },
    );
  }


  List<int> todoColors = [
    0xffff5147,
    0xffff9d42,
    0xfff9c50b,
    0xff42a0ff,
  ];

  bool color0 = false ;
  bool color1 = false ;
  bool color2 = false ;
  bool color3 = false ;
  int todoColor = 0xffff9d42;

  chooseToDoColor (int id)
  {
    switch(id)
    {
      case 0 : {
        color0 = true ;
        color1 = false ;
        color2 = false ;
        color3 = false ;
        todoColor = todoColors[id];
        emit(AppChooseColorState());
        break;
      }
      case 1 : {
        color0 = false ;
        color1 = true ;
        color2 = false ;
        color3 = false ;
        todoColor = todoColors[id];
        emit(AppChooseColorState());
        break;
      }
      case 2 : {
        color0 = false ;
        color1 = false ;
        color2 = true ;
        color3 = false ;
        todoColor = todoColors[id];
        emit(AppChooseColorState());
        break;
      }
      case 3 : {
        color0 = false ;
        color1 = false ;
        color2 = false ;
        color3 = true ;
        todoColor = todoColors[id];
        emit(AppChooseColorState());
        break;
      }
    }
  }


  List <Map> allTasks = [];
  List <Map> completedTasks = [];
  List <Map> uncompletedTasks = [];
  List <Map> favoriteTasks = [];

  void getDataFromDatabase (database) async {
    allTasks = [];
    completedTasks = [];
    uncompletedTasks = [];
    favoriteTasks = [];

    emit(AppInsertDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value)
    {
      allTasks = value ;
      value.forEach((element)
      {
        if (element['completed'] == 1)
        {
          completedTasks.add(element);
        }
        else if (element['completed'] == 0)
        {
          uncompletedTasks.add(element);
        }

        if (element['favorite'] == 1 )
        {
          favoriteTasks.add(element);
        }
      });
      print(allTasks.toString());
      getScheduleFromDatabase(database, DateFormat('dd-MM-yyyy').format(DateTime.now()).toString());
      emit(AppGetDatabaseState());
    });

  }

  List <Map> scheduleTasks = [];

  void getScheduleFromDatabase ( database , String date) async {
    scheduleTasks = [];

    emit(AppInsertDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value)
    {
      value.forEach((element)
      {
        if (element['deadline'] == date)
        {
          scheduleTasks.add(element);
        }
      });
      print(scheduleTasks.toString());
      emit(AppGetScheduleDatabaseState());
    });

  }


  void updateTaskState ({
    required bool completed ,
    required int id ,
  })
  {
    database.rawUpdate(
        'UPDATE tasks SET completed = ? WHERE id = ?' , [completed , id] ).then((value) {

      emit(AppUpdateDatabaseState());
      getDataFromDatabase(database);

        }
    );
  }

  void addToFavoriteState ({
    required bool isFavorite ,
    required int id ,
  })
  {
    database.rawUpdate(
        'UPDATE tasks SET favorite = ? WHERE id = ?' , [isFavorite , id] ).then((value) {

      emit(AppAddToFavoriteState());
      getDataFromDatabase(database);
    }
    );
  }

  void deleteDatabase ({
    required int id ,
  })
  {
    database.rawDelete(
        'DELETE FROM tasks  WHERE id = ?' , [id] ).then((value)
    {
      emit(AppDeleteDatabaseState());
      getDataFromDatabase(database);
    }
    );
  }



  void popUpMenuButtonFunction (value , int id)
  {
    switch(value)
    {
      case 1 : {
       updateTaskState(completed: true, id: id);
       break;
      }
      case 2 : {
        updateTaskState(completed: false, id: id);
        break;
      }
      case 3 : {
        addToFavoriteState(isFavorite: true, id: id);
        break;
      }
      case 4 : {
        deleteDatabase(id: id);
        break;
      }
    }
    emit(AppPopUpMenuState());
  }





}