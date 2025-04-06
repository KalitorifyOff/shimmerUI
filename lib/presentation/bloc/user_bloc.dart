import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>(_userGetEvent);
  }

  Future<void> _userGetEvent(
    UserEvent userEvent,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserLoadingState());
      //* call api
      await Future.delayed(Duration(seconds: 3), () {
        emit(UserLoadedState(userName: "", userEmail: ""));
      });
    } catch (err) {
      emit(UserErrorState(errorMessage: err.toString()));
    }
  }
}
