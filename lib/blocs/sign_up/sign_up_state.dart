import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final bool? isCheckingSignUp;

  SignUpState({SignUpState? state, bool? isCheckingSignUp}) : isCheckingSignUp = isCheckingSignUp ?? state?.isCheckingSignUp;

  @override
  List<Object?> get props => [isCheckingSignUp];
}
