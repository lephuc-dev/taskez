import 'package:flutter/foundation.dart';

import '../../base/base.dart';
import 'my_information.dart';

class MyInformationBloc extends BaseBloc<MyInformationState> {
  Stream<int?> get indexPgaeStream =>
      stateStream.map((event) => event.indexPage);

  void setIndexPage(int value) {
    emit(MyInformationState(state: state, indexPage: value));
    if (kDebugMode) {
      print(state!.indexPage);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
