import '../../base/base.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';

class SignInBloc extends BaseBloc<SignInState> {
  final AuthenticationRepository authenticationRepository;

  SignInBloc(this.authenticationRepository);

  Stream<bool?> get isCheckingSignInStream => stateStream.map((event) => event.isCheckingSignIn).distinct();

  void onSetCheckingSignInState(bool value) {
    emit(SignInState(state: state, isCheckingSignIn: value));
  }

  void onSignIn(String email, String pass, Function onSuccess, Function(String) onError) {
    authenticationRepository.signIn(email, pass, onSuccess, onError);
  }

  @override
  void dispose() {
    super.dispose();
  }
}