import 'package:taskez/base/base.dart';
import 'package:taskez/blocs/edit_profiles/edit_profiles_state.dart';
import 'package:taskez/models/models.dart';
import 'package:taskez/repositories/repositories.dart';

class EditProfilesBloc extends BaseBloc<EditProfilesState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  EditProfilesBloc(this.authenticationRepository, this.userRepository);

  Stream<bool?> get isCheckingEditStream =>
      stateStream.map((event) => event.isCheckingEdit).distinct();

  void onSetEditProfilesState(bool value) {
    emit(EditProfilesState(state: state, isCheckingEdit: value));
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
