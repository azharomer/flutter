import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shhnatycemexdriver/core/base_bloc/base_bloc.dart';
import 'package:shhnatycemexdriver/features/login/presentation/bloc/login-events.dart';
import 'package:shhnatycemexdriver/features/login/presentation/bloc/login-state.dart';

class LoginBloc extends Bloc<BaseEvent, LoginSuccessState> {
  LoginBloc(LoginSuccessState initialState) : super(initialState);

  @override
  Stream<LoginSuccessState> mapEventToState(BaseEvent event) async* {
    // TODO: implement mapEventToState
    if (event is LoginEvent) {
      yield LoginSuccessState();
    }
  }
}
