import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskez/repositories/profiles_repository.dart';

import '../../base/base.dart';
import 'my_information.dart';

class MyInformationBloc extends BaseBloc<MyInformationState> {
  final ProfilesRepository profilesRepository;

  MyInformationBloc(this.profilesRepository);

  Stream<QuerySnapshot<dynamic>> getUserStream() {
    return profilesRepository.getUserStream();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
