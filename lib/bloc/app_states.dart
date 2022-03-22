abstract class AppStates {}

class InitialState extends AppStates {}

class BottomNavChangedState extends AppStates {}

class CountryChangedState extends AppStates {}

class ThemeChangedState extends AppStates {}

//<editor-fold desc="DatabaseStates">
class InitDatabaseSuccessState extends AppStates {}

class InitDatabaseErrorState extends AppStates {}

class GetDatabaseSuccessState extends AppStates {}

class GetDatabaseErrorState extends AppStates {}

class InsertDatabaseSuccessState extends AppStates {}

class InsertDatabaseErrorState extends AppStates {}

class DeleteDatabaseSuccessState extends AppStates {}

class DeleteDatabaseErrorState extends AppStates {}
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
