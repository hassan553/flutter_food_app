part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeCurrentIndex extends HomeState {}

class GetPizzaScuess extends HomeState {}

class GetPizzaError extends HomeState {}

class GetUserScuess extends HomeState {}

class SetThemeSuccess extends HomeState {}

class SetThemeError extends HomeState {}

class GetThemeSuccess extends HomeState {}

class GetThemeError extends HomeState {}

class SetFavourtiesMeal extends HomeState {}

class GetUserError extends HomeState {}

class GetPastaScuess extends HomeState {}

class GetDrinkError extends HomeState {}

class GetDrinkScuess extends HomeState {}

class GetPastaError extends HomeState {}

class GetSaladsScuess extends HomeState {}

class GetSaladsError extends HomeState {}

class GetDessertScuess extends HomeState {}

class GetDessertError extends HomeState {}

class GetSaucesScuess extends HomeState {}

class GetSaucesError extends HomeState {}

class GetSidesScuess extends HomeState {}

class GetSidesError extends HomeState {}

class CreateData extends HomeState {}

class GetData extends HomeState {}

class InsertData extends HomeState {}

class DeleteData extends HomeState {}
