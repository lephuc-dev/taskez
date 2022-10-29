import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final bool? isCheckingSignIn;

  SignInState({SignInState? state, bool? isCheckingSignIn}) : isCheckingSignIn = isCheckingSignIn ?? state?.isCheckingSignIn;

  @override
  List<Object?> get props => [isCheckingSignIn];
}
