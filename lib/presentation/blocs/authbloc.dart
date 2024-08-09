import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app/repositories/auth_repository.dart';

import 'authevent.dart';
import 'authstate.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginRequested) {
      yield AuthLoading();
      try {
        final user = await _authRepository.login(event.email, event.password);
        yield AuthSuccess(user);
      } catch (e) {
        yield AuthFailure(e.toString());
      }
    } else if (event is RegisterRequested) {
      yield AuthLoading();
      try {
        final user = await _authRepository.register(event.name, event.email, event.password);
        yield AuthSuccess(user);
      } catch (e) {
        yield AuthFailure(e.toString());
      }
    }
  }
}
