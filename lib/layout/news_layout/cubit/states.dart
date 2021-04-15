abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class CountryChangedState extends NewsStates {}

class BottomNavChangedState extends NewsStates {}

class BusinessLoadingState extends NewsStates {}
class BusinessLoadingSuccessState extends NewsStates {}
class BusinessLoadingErrorState extends NewsStates {}

class ScienceLoadingState extends NewsStates {}
class ScienceLoadingSuccessState extends NewsStates {}
class ScienceLoadingErrorState extends NewsStates {}

class SportsLoadingState extends NewsStates {}
class SportsLoadingSuccessState extends NewsStates {}
class SportsLoadingErrorState extends NewsStates {}

class HealthLoadingState extends NewsStates {}
class HealthLoadingSuccessState extends NewsStates {}
class HealthLoadingErrorState extends NewsStates {}
