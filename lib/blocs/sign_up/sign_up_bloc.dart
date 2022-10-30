import '../../base/base.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class SignUpBloc extends BaseBloc<SignUpState> {
  final AuthenticationRepository authenticationRepository;

  SignUpBloc(this.authenticationRepository);

  Stream<bool?> get isCheckingSignUpStream => stateStream.map((event) => event.isCheckingSignUp).distinct();

  void onSetRegisteringState(bool value) {
    emit(SignUpState(state: state, isCheckingSignUp: value));
  }

  void onSignUp(String name, String email, String pass, Function onSuccess, Function(String) onError) {
    authenticationRepository.signUp(name, email, pass, onSuccess, onError);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
