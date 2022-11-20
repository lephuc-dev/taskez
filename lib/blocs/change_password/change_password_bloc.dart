import 'package:taskez/base/base.dart';
import 'package:taskez/blocs/change_password/change_password_state.dart';
import 'package:taskez/repositories/profiles_repository.dart';

class ChangePasswordBloc extends BaseBloc<ChangePasswordState> {
  final ProfilesRepository profilesRepository;

  ChangePasswordBloc(this.profilesRepository);

  void onUpdatePassword(
      String newPassword, Function onSuccess, Function(String) onError) {
    profilesRepository.updatePassword(newPassword, onSuccess, onError);
  }

  void onCheckPassword(
      String password, Function onSuccess, Function(String) onError) {
    profilesRepository.onCheckPassword(password, onSuccess, onError);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
