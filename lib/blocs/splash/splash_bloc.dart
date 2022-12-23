import 'package:shared_preferences/shared_preferences.dart';
import '../../base/base.dart';
import '../blocs.dart';

class SplashBloc extends BaseBloc<SplashState> {
  Future<bool> getBoardViewed() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? isViewed = sharedPreferences.getInt("onBoard");
    return isViewed == 0 ? true : false;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
