abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeTaskState extends AppStates {}

class AppShowDateState extends AppStates {}
class AppShowTimeState extends AppStates {}

class AppChangeDropMenuState extends AppStates {}
class AppChangeDateState extends AppStates {}

class AppChooseColorState extends AppStates {}

class AppCreateDatabaseState extends AppStates {}
class AppInsertDatabaseSuccessState extends AppStates {}
class AppInsertDatabaseErrorState extends AppStates {}
class AppInsertDatabaseLoadingState extends AppStates {}
class AppGetDatabaseState extends AppStates {}
class AppGetScheduleDatabaseState extends AppStates {}
class AppUpdateDatabaseState extends AppStates {}
class AppAddToFavoriteState extends AppStates {}
class AppDeleteDatabaseState extends AppStates {}

class AppPopUpMenuState extends AppStates {}