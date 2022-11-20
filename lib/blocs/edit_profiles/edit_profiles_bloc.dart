import 'package:taskez/base/base.dart';
import 'package:taskez/blocs/edit_profiles/edit_profiles_state.dart';
import 'package:taskez/repositories/profiles_repository.dart';

class EditProfilesBloc extends BaseBloc<EditProfilesState> {
  final ProfilesRepository profilesRepository;

  EditProfilesBloc(this.profilesRepository);

  void onUpdateUser(String name, Function onSuccess, Function(String) onError) {
    profilesRepository.updateUser(name, onSuccess, onError);
  }

  void getUser() {
    profilesRepository.getUser();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
