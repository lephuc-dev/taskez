import 'package:equatable/equatable.dart';

class EditProfileState extends Equatable {
  final bool? isCheckingEdit;

  EditProfileState({EditProfileState? state, bool? isCheckingEdit}) : isCheckingEdit = isCheckingEdit ?? state?.isCheckingEdit;

  @override
  List<Object?> get props => [isCheckingEdit];
}
