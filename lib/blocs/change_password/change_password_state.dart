import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable {
  final bool? isCheckingChangePassword;
  final String? email;

  ChangePasswordState({ChangePasswordState? state, bool? isCheckingChangePassword, String? email})
      : isCheckingChangePassword = isCheckingChangePassword ?? state?.isCheckingChangePassword,
        email = email ?? state?.email;

  @override
  List<Object?> get props => [isCheckingChangePassword, email];
}
