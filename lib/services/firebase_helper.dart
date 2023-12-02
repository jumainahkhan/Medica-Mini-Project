import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medica/model/test_model.dart';

class FirebaseHelper {
  final CollectionReference _testCollection =
      FirebaseFirestore.instance.collection('test');
  Future<bool> createDocument(TestModel data) async {
    try {
      DocumentReference doc = _testCollection.doc();
      data.id = doc.id;
      await doc.set(data.toJson());
      debugPrint('Document Added');
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<List<TestModel>> getAllDocumentForACollection() async {
    try {
      List<TestModel> tests = [];
      await _testCollection.get().then((value) => {
            for (var element in value.docs)
              {
                tests.add(
                    TestModel.fromJson(element.data() as Map<String, dynamic>))
              }
          });
      return tests;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<bool> updateDocument(String filePath, TestModel newData) async {
    try {
      await _testCollection.doc(filePath).update(newData.toJson());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
  // Future<bool> getAllDocumentForACollection (String collectionName) async {

  // }
}
