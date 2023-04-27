import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  Future<String?> addUser({
    required String fullName,
    required String age,
    required String email,
  }) async {
    try {
      CollectionReference users =
      FirebaseFirestore.instance.collection('Teams');
      // Call the user's CollectionReference to add a new user
      await users.doc(email).set({
        'full_name': fullName,
        'age': age,
      });
      return 'success';
    } catch (e) {
      return 'Error adding user';
    }
  }

  Future<String?> getUser(String email) async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('Teams');
      final snapshot = await users.doc('PQaDoEiryvRjac7lUIcbSuBRYQ43').get();
      final data = snapshot.data() as Map<String, dynamic>;
      return data['full_name'];
    } catch (e) {
      return 'Error fetching user';
    }
  }
}