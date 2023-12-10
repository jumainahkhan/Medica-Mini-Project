import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/model/user_model.dart';

class UserHelper {
  static final UserHelper _instance = UserHelper._internal();
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  factory UserHelper() {
    return _instance;
  }

  UserHelper._internal();

  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  setUserModel(UserModel? userModel) {
    debugPrint('Setting user model: $userModel');
    _userModel = userModel;
  }

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<bool> doesUserDocumentExist() async {
    final DocumentSnapshot documentSnapshot =
        await userCollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    return documentSnapshot.exists;
  }

  Future<void> createUserDocumentIfNotExists(
      String uid, String phoneNumber) async {
    final bool userExists = await doesUserDocumentExist();
    if (!userExists) {
      return await userCollection.doc().set({
        'phoneNumber': phoneNumber,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<String> uploadProfilePicture(XFile imageFile, String uid) async {
    debugPrint('uploadProfilePicture: $imageFile');
    final String fileName = uid;
    final Reference reference =
        FirebaseStorage.instance.ref().child('images/$fileName');
    final UploadTask uploadTask = reference.putFile(File(imageFile.path));
    final TaskSnapshot taskSnapshot = await uploadTask;
    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    debugPrint('downloadUrl: $downloadUrl');
    return downloadUrl;
  }

  Future<UserModel?> getUserData(String uid) async {
    try {
      debugPrint('Getting user data for $uid');
      final DocumentSnapshot documentSnapshot =
          await userCollection.doc(uid).get();
      if (documentSnapshot.exists) {
        final UserModel userModelResp =
            UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
        setUserModel(userModelResp);

        return userModel;
      } else {
        // Sign out user
        await FirebaseAuth.instance.signOut();
        throw Exception('User document does not exist');
      }
    } catch (e) {
      debugPrint('Error getting user data: $e');
      return null;
    }
  }

  // getUserDataStream - returns a stream of user data
  StreamSubscription getUserDocumentStream() {
    debugPrint('user_helper:getUserDocumentStream called');
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .listen((event) {
        debugPrint('getUserDocumentStream: $event');
        if (event.exists) {
          setUserModel(
              UserModel.fromJson(event.data() as Map<String, dynamic>));
        } else {
          debugPrint('getUserDocumentStream: User document does not exist');
          debugPrint('getUserDocumentStream: Signing out user');

          FirebaseAuth.instance.signOut();
          throw Exception('User document does not exist');
        }
      });
    } catch (e) {
      debugPrint('Error getting user data stream: $e');
      return const Stream.empty().listen((event) {
        debugPrint('getUserDocumentStreamCatch: $event');
      });
    }
  }

  Future<void> updateUserRecord(UserModel user) async {
    debugPrint("updateUserRecord");
    try {
      await userCollection.doc(user.uid).update(user.toJson());
      // getUserData(user.uid!);
    } catch (e) {
      debugPrint('Error updating user data: $e');
    }
  }

  // logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      setUserModel(null);
    } catch (e) {
      debugPrint('Error logging out: $e');
    }
  }

  void closeUserDocumentStream() {
    debugPrint('user_helper:closeUserDocumentStream called');
    getUserDocumentStream().cancel();
  }
}
