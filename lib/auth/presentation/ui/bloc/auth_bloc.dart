import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../data/repository/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthLoggedOutState()) {
    // When User Presses the SignIn Button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<AuthLogInEvent>((event, emit) async {
      emit(AuthStartedState());
      try {
        await authRepository.loginIn(
            email: event.email, password: event.password);
        emit(AuthLoggedInState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
        emit(AuthLoggedOutState());
      }
    });
    // When User Presses the SignUp Button, we will send the SignUpRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthStartedState());
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(AuthLoggedInState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
        emit(AuthLoggedOutState());
      }
    });
    // When User Presses the Google Login Button, we will send the GoogleSignInRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    on<AuthGoogleSignInEvent>((event, emit) async {
      emit(AuthStartedState());
      try {
        await authRepository.signInWithGoogle();
        emit(AuthLoggedInState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
        emit(AuthLoggedOutState());
      }
    });
    // When User Presses the SignOut Button, we will send the SignOutRequested Event to the AuthBloc to handle it and emit the UnAuthenticated State
    on<AuthLogOutEvent>((event, emit) async {
      emit(AuthStartedState());
      await authRepository.logOut();
      emit(AuthLoggedOutState());
    });
  }
}
