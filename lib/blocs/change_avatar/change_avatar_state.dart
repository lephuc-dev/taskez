import 'package:equatable/equatable.dart';

class ChangeAvatarState extends Equatable {
  final bool? isChangeAvatar;
  final bool? free;
  final bool? picked;
  final bool? cropped;

  ChangeAvatarState({ChangeAvatarState? state, bool? isChangeAvatar, bool? free, bool? picked, bool? cropped})
      : isChangeAvatar = isChangeAvatar ?? state?.isChangeAvatar,
       free = free ?? state?.free,
       picked = picked ?? state?.picked,
       cropped = cropped ?? state?.cropped;

  @override
  List<Object?> get props => [isChangeAvatar];
}
