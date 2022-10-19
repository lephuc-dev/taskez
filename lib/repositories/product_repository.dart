import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/models.dart';
import 'package:flutter/foundation.dart';

class ProductRepository {
  final _fireStore = FirebaseFirestore.instance.collection("productions");

  Future<List<ProductModel>> getData() async {
    List<ProductModel> proList = [];
    try {
      final list = await _fireStore.get();

      for (var element in list.docs) {
        proList.add(ProductModel.fromJson(element.data()));
      }

      return proList;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error ${e.code} : ${e.message}");
      }

      return proList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addProduct({required String name, required String price}) async {
    try {
      await _fireStore.add({"name": name, "price": price});
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Failed with error ${e.code} : ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
