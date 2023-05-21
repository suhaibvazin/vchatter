part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

//class AuthStartedEvent extends AuthEvent {}

class AuthLogInEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLogInEvent(this.email, this.password);
}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpEvent(this.email, this.password);
}

class AuthGoogleSignInEvent extends AuthEvent {}

class AuthLogOutEvent extends AuthEvent {}

//when user click on send button after entering phone number
class AuthSenOtptoPhoneEvent extends AuthEvent {
  final String phoneNumber;

  AuthSenOtptoPhoneEvent({required this.phoneNumber});
}

//fired to verify otp sent to the phone
class AuthVerifyOtpEvent extends AuthEvent {
  final String otpCode;
  final String verificationId;

  AuthVerifyOtpEvent({required this.otpCode, required this.verificationId});
}

//fired right after the otp is sent
class AuthOnPhoneOtpSentEvent extends AuthEvent {
  final String verificationId;
  final int? token;
  AuthOnPhoneOtpSentEvent({
    required this.verificationId,
    required this.token,
  });
}

//fired once verification completes either automatically or manually
// then login with those credential generated after verification
class AuthPhoneVerificationCompleteEvent extends AuthEvent {
  final AuthCredential credential;
  AuthPhoneVerificationCompleteEvent({
    required this.credential,
  });
}

class AuthErrorEvent extends AuthEvent {
  final String error;
  AuthErrorEvent(this.error);
}
