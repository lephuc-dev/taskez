import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class InvitationRepository {
  final _notificationFirestore =
      FirebaseFirestore.instance.collection("INVITATIONS");

  Stream<List<InvitationModel>> getAllInvitationsByUidStream(String uid) {
    return _notificationFirestore
        .where("invitee_id", isEqualTo: uid)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((document) => InvitationModel.fromJson(document.data()))
            .toList());
  }
}
