import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shimmerpoc/data/repo/user_repo_imp.dart';
import 'package:shimmerpoc/domain/entity/user_entity.dart';

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
      var result = await UserRepo().getUser();
      await Future.delayed(Duration(seconds: 3), () {
        emit(UserLoadedState(result));
      });
    } catch (err) {
      emit(UserErrorState(errorMessage: err.toString()));
    }
  }
}
