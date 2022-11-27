import 'package:equatable/equatable.dart';

class EditProfilesState extends Equatable {
  final bool? isCheckingEdit;

  EditProfilesState({EditProfilesState? state, bool? isCheckingEdit})
      : isCheckingEdit = isCheckingEdit ?? state?.isCheckingEdit;

  @override
  List<Object?> get props => [isCheckingEdit];
}
