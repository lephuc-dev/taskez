import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';

class NotificationRepository {
  final _notificationFirestore =
      FirebaseFirestore.instance.collection("NOTIFICATIONS");

  Stream<List<NotificationModel>> getAllNotificationsByUidStream(String uid) {
    return _notificationFirestore.where("uid", isEqualTo: uid).snapshots().map(
        (snapshot) => snapshot.docs
            .map((document) => NotificationModel.fromJson(document.data()))
            .toList());
  }
  Stream<List<NotificationModel>> getNotificationsByUidandTypeStream(String uid,String type) {
    return _notificationFirestore.where("uid", isEqualTo: uid).where("type", isEqualTo: type).snapshots().map(
        (snapshot) => snapshot.docs
            .map((document) => NotificationModel.fromJson(document.data()))
            .toList());
  }
}
