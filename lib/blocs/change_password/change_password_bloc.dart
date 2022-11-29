import 'package:taskez/base/base.dart';
import 'package:taskez/blocs/change_password/change_password_state.dart';
import 'package:taskez/models/models.dart';
import 'package:taskez/repositories/repositories.dart';

class ChangePasswordBloc extends BaseBloc<ChangePasswordState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  ChangePasswordBloc(this.authenticationRepository, this.userRepository);

  Stream<bool?> get isCheckingChangePassword =>
      stateStream.map((event) => event.isCheckingChangePassword).distinct();

  Stream<String?> get email =>
      stateStream.map((event) => event.email).distinct();

  void onSetChangePasswordState(bool value) {
    emit(ChangePasswordState(state: state, isCheckingChangePassword: value));
  }

  Stream<User> getInformationUserStream() {
    return userRepository.getInformationUserByIdStream(authenticationRepository.getCurrentUserId());
  }

  void onSetEmail(String value) {
    emit(ChangePasswordState(state: state, email: value));
  }

  void onUpdatePassword(
      String newPassword, Function onSuccess, Function(String) onError) {
    authenticationRepository.updatePassword(newPassword, onSuccess, onError);
  }

  void onSignIn(
      String email, String pass, Function onSuccess, Function(String) onError) {
    authenticationRepository.signIn(email, pass, onSuccess, onError);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
