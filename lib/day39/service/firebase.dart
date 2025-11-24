import 'package:belajar_ppkd/day39/models/user_firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseService {
  // Placeholder for Firebase service methods
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<UserFirebaseModel> registerUser({
    required String email,
    required String password,
    required String username,
  }) async {
    final cred = await auth.createUserWithEmailAndPassword(
      email: email, 
      password: password,
      );
      final user = cred.user! ;
      final model = UserFirebaseModel(
        uid: user.uid,
        email: email,
        username: username,
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
        
      );
      await firestore.collection('users').doc(user.uid).set(model.toMap());
      return model;
  }

  static Future<UserFirebaseModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final cred = await auth.createUserWithEmailAndPassword(
      email: email, 
      password: password,
      );
      final user = cred.user;
      if (user == null) return null;
      final data = await firestore.collection('users').doc(user.uid).get();
      final model = UserFirebaseModel.fromMap(data.data()!);
      return model;
  }
}

