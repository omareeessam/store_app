part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class AppLoadin extends AppState {}

final class AppSuccess extends AppState {}

final class AppError extends AppState {
  final String message;

  AppError({required this.message});
}

final class ChangeNav extends AppState {}



final class AppLoadinAllCategory extends AppState {}

final class AppSuccessAllCategory extends AppState {}

final class AppErrorAllCategory extends AppState {
  final String message;

  AppErrorAllCategory({required this.message});
}