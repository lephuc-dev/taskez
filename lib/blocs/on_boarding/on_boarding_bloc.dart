import '../../base/base.dart';
import 'on_boarding.dart';

class OnBoardingBloc extends BaseBloc<OnBoardingState> {
  Stream<int?> get indexPageStream => stateStream.map((event) => event.indexPage);

  void setIndexPage(int value) {
    emit(OnBoardingState(state: state, indexPage: value));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
