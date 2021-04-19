abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class BottomNavChangedState extends NewsStates {}

class CountryChangedState extends NewsStates {}

//<editor-fold desc="DatabaseStates">
class NewsInitDatabaseSuccessState extends NewsStates {}

class NewsInitDatabaseErrorState extends NewsStates {}

class NewsGetDatabaseSuccessState extends NewsStates {}

class NewsGetDatabaseErrorState extends NewsStates {}

class NewsInsertDatabaseSuccessState extends NewsStates {}

class NewsInsertDatabaseErrorState extends NewsStates {}
//</editor-fold>

//<editor-fold desc="SearchStates">
class SearchState extends NewsStates {}

class SearchLoadingState extends NewsStates {}

class SearchLoadingSuccessState extends NewsStates {}

class SearchLoadingErrorState extends NewsStates {}
//</editor-fold>

//<editor-fold desc="BusinessStates">
class BusinessLoadingState extends NewsStates {}

class BusinessLoadingSuccessState extends NewsStates {}

class BusinessLoadingErrorState extends NewsStates {}
//</editor-fold>

//<editor-fold desc="ScienceStates">
class ScienceLoadingState extends NewsStates {}

class ScienceLoadingSuccessState extends NewsStates {}

class ScienceLoadingErrorState extends NewsStates {}
//</editor-fold>

//<editor-fold desc="SportsStates">
class SportsLoadingState extends NewsStates {}

class SportsLoadingSuccessState extends NewsStates {}

class SportsLoadingErrorState extends NewsStates {}
//</editor-fold>

//<editor-fold desc="HealthStates">
class HealthLoadingState extends NewsStates {}

class HealthLoadingSuccessState extends NewsStates {}

class HealthLoadingErrorState extends NewsStates {}
//</editor-fold>
