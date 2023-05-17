part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthStartedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoggedInState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoggedOutState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
  @override
  List<Object?> get props => [];
}
