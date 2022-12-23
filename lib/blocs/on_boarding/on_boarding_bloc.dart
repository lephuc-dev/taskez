import 'package:shared_preferences/shared_preferences.dart';
import '../../base/base.dart';
import 'on_boarding.dart';

class OnBoardingBloc extends BaseBloc<OnBoardingState> {
  Stream<int?> get indexPageStream => stateStream.map((event) => event.indexPage);

  void setIndexPage(int value) {
    emit(OnBoardingState(state: state, indexPage: value));
  }

  Future<void> setBoardViewed() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("onBoard", 0);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
