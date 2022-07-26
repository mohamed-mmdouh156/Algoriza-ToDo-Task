import 'package:algoriza_task_todo/app/bloc/cubit.dart';
import 'package:algoriza_task_todo/app/bloc/state.dart';
import 'package:algoriza_task_todo/presentation/Screens/home/tabs/AllTab/all_screen.dart';
import 'package:algoriza_task_todo/presentation/Screens/home/tabs/CompletedTab/completed_screen.dart';
import 'package:algoriza_task_todo/presentation/Screens/home/tabs/FavoriteTab/favorite_screen.dart';
import 'package:algoriza_task_todo/presentation/Screens/home/tabs/UncompletedTab/uncompleted_screen.dart';
import 'package:algoriza_task_todo/presentation/color_manager.dart';
import 'package:algoriza_task_todo/presentation/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> tabScreens = const [
      AllScreen(),
      CompletedScreen(),
      UncompletedScreen(),
      FavoriteScreen(),
    ];


    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer <AppCubit ,AppStates>(
        listener: (context ,state) {},
        builder: (context ,state) {
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  indicatorColor: ColorManager.primary,
                  unselectedLabelColor: ColorManager.lightGrey,
                  labelColor: ColorManager.black,
                  tabs:  [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'All',
                        style : GoogleFonts.lato(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Completed',
                        style : GoogleFonts.lato(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Uncompleted',
                        style : GoogleFonts.lato(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Favorite',
                        style : GoogleFonts.lato(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  'Board',
                  style: GoogleFonts.lato(
                    color: ColorManager.black,
                    fontSize: AppSize.s22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.search,
                      color: ColorManager.black,
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.notifications_none,
                      color: ColorManager.black,
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.menu,
                      color: ColorManager.black,
                    ),
                  ),
                ],
              ),
              body: TabBarView(
                children: tabScreens,
              ),
            ),
          );
        },
      ),
    );
  }
}
