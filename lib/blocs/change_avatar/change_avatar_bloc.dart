import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskez/base/base.dart';
import 'package:taskez/blocs/blocs.dart';
import 'package:taskez/models/models.dart';
import 'package:taskez/repositories/repositories.dart';

class ChangeAvatarBloc extends BaseBloc<ChangeAvatarState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  ChangeAvatarBloc(this.authenticationRepository, this.userRepository);

  Stream<bool?> get isChangeAvatar =>
      stateStream.map((event) => event.isChangeAvatar).distinct();

  void setOnChangeAvatarState(bool value) {
    emit(ChangeAvatarState(state: state, isChangeAvatar: value));
  }

  Stream<User> getInformationUserStream() {
    return userRepository.getInformationUserByIdStream(
        authenticationRepository.getCurrentUserId());
  }

  Future uploadImage(String? filePath, Function onUpdateSuccess,
      Function(String) onUpdateError) async {
    // final result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.image);

    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    userRepository.changeAvatar(
        fileName,
        authenticationRepository.getCurrentUserId(),
        filePath ?? "",
        onUpdateSuccess,
        (error) => onUpdateError(error));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
