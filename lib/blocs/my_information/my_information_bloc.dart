import 'package:file_picker/file_picker.dart';
import 'package:taskez/models/models.dart';
import 'package:taskez/repositories/repositories.dart';
import '../../base/base.dart';
import 'my_information.dart';

class MyInformationBloc extends BaseBloc<MyInformationState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  MyInformationBloc(this.authenticationRepository, this.userRepository);

  void onSetIsLoading(bool value) {
    emit(MyInformationState(state: state, isLoading: value));
  }

  Stream<User> getInformationUserStream() {
    return userRepository.getInformationUserByIdStream(authenticationRepository.getCurrentUserId());
  }

  @override
  void dispose() {
    super.dispose();
  }
}
