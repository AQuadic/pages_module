part of 'controller_cubit.dart';

@immutable
sealed class ControllerState {}

final class ControllerInitial extends ControllerState {}

final class PagesLoading extends ControllerState {}

final class PagesLoaded extends ControllerState {
  PagesLoaded({required this.msg});

  final String msg;
}

final class PagesError extends ControllerState {
  PagesError(this.error);

  final String error;
}
