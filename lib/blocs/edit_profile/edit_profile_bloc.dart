import '../../base/base.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import 'edit_profile.dart';

class EditProfileBloc extends BaseBloc<EditProfileState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  EditProfileBloc(this.authenticationRepository, this.userRepository);

  Stream<bool?> get isCheckingEditStream => stateStream.map((event) => event.isCheckingEdit).distinct();

  void onSetEditProfilesState(bool value) {
    emit(EditProfileState(state: state, isCheckingEdit: value));
  }

  void onUpdateUser(String name, Function onSuccess, Function(String) onError) {
    userRepository.updateUser(name, authenticationRepository.getCurrentUserId(),onSuccess, onError);
  }

  Stream<User> getInformationUserStream() {
    return userRepository.getInformationUserByIdStream(
        authenticationRepository.getCurrentUserId());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
