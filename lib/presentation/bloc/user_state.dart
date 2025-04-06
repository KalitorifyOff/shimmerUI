part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final String userName;
  final String userEmail;

  UserLoadedState({required this.userName, required this.userEmail});
}

class UserErrorState extends UserState {
  final String errorMessage;

  UserErrorState({required this.errorMessage});
}
