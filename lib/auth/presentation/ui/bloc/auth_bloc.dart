import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import '../../../data/repository/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthLoggedOutState()) {
    // When User Presses the SignIn Button, we will send the SignInRequested Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    // on<AuthLogInEvent>((event, emit) async {
    //   emit(AuthStartedState());
    //   try {
    //     await authRepository.loginIn(
    //         email: event.email, password: event.password);
    //     emit(AuthLoggedInState());
    //   } catch (e) {
    //     emit(AuthErrorState(e.toString()));
    //     emit(AuthLoggedOutState());
    //   }
    // });
    // When User Presses the SignUp Button, we will send the SignUpRequest Event to the AuthBloc to handle it and emit the Authenticated State if the user is authenticated
    // on<AuthSignUpEvent>((event, emit) async {
    //   emit(AuthStartedState());
    //   try {
    //     await authRepository.signUp(
    //         email: event.email, password: event.password);
    //     emit(AuthLoggedInState());
    //   } catch (e) {
    //     emit(AuthErrorState(e.toString()));
    //     emit(AuthLoggedOutState());
    //   }
    // });
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
    // sent otp event implementation
    on<AuthSenOtptoPhoneEvent>((event, emit) async {
      emit(AuthStartedState());
      try {
        await authRepository.verifyPhone(
          phoneNumber: event.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            add(AuthPhoneVerificationCompleteEvent(credential: credential));
          },
          codeSent: (String verificationId, int? resendToken) {
            add(AuthOnPhoneOtpSentEvent(
                verificationId: verificationId, token: resendToken));
          },
          verificationFailed: (FirebaseAuthException e) {
            emit(AuthErrorState(e.code));
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (e) {
        emit(AuthErrorState(e.toString()));
        emit(AuthLoggedOutState());
      }
    });

    //verify otp event implementation

    on<AuthVerifyOtpEvent>(
      (event, emit) {
        emit(AuthStartedState());

        try {
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: event.verificationId,
            smsCode: event.otpCode,
          );
          add(AuthPhoneVerificationCompleteEvent(credential: credential));
        } catch (e) {
          emit(AuthErrorState(e.toString()));
          emit(AuthLoggedOutState());
        }
      },
    );

    //trigger this when a code is sent to store toke and verification id it will emit AuthCodeSentSuccessState

    on<AuthOnPhoneOtpSentEvent>(
      (event, emit) => emit(
        AuthCodeSentSuccessState(verificationId: event.verificationId),
      ),
    );

    //trigger when credentials is created after verification it will call
    //login method from repository

    on<AuthPhoneVerificationCompleteEvent>(
      (event, emit) {
        try {
          authRepository.logInWithCredentials(credential: event.credential);
          emit(AuthLoggedInState());
        } catch (e) {
          emit(AuthErrorState(e.toString()));
          emit(AuthLoggedOutState());
        }
      },
    );
  }
}
