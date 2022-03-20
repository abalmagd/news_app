abstract class AppStates {}

class NewsInitialState extends AppStates {}

class BottomNavChangedState extends AppStates {}

class CountryChangedState extends AppStates {}

class NewsThemeChangedState extends AppStates {}

//<editor-fold desc="DatabaseStates">
class NewsInitDatabaseSuccessState extends AppStates {}

class NewsInitDatabaseErrorState extends AppStates {}

class NewsGetDatabaseSuccessState extends AppStates {}

class NewsGetDatabaseErrorState extends AppStates {}

class NewsInsertDatabaseSuccessState extends AppStates {}

class NewsInsertDatabaseErrorState extends AppStates {}

class NewsDeleteDatabaseSuccessState extends AppStates {}

class NewsDeleteDatabaseErrorState extends AppStates {}
//</editor-fold>

//<editor-fold desc="SearchStates">
class SearchState extends AppStates {}

class SearchLoadingState extends AppStates {}

class SearchLoadingSuccessState extends AppStates {}

class SearchLoadingErrorState extends AppStates {}
//</editor-fold>

//<editor-fold desc="BusinessStates">
class BusinessLoadingState extends AppStates {}

class BusinessLoadingSuccessState extends AppStates {}

class BusinessLoadingErrorState extends AppStates {}
//</editor-fold>

//<editor-fold desc="ScienceStates">
class ScienceLoadingState extends AppStates {}

class ScienceLoadingSuccessState extends AppStates {}

class ScienceLoadingErrorState extends AppStates {}
//</editor-fold>

//<editor-fold desc="SportsStates">
class SportsLoadingState extends AppStates {}

class SportsLoadingSuccessState extends AppStates {}

class SportsLoadingErrorState extends AppStates {}
//</editor-fold>

//<editor-fold desc="HealthStates">
class HealthLoadingState extends AppStates {}

class HealthLoadingSuccessState extends AppStates {}

class HealthLoadingErrorState extends AppStates {}
//</editor-fold>
