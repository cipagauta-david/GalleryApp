import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Firestore {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> add(String userId, String content) async {
    try {
      await firestore.collection('posts').add({
        'userId': userId,
        'content': content,
        'timestamp': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('posts').orderBy('timestamp').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = doc.data();
          a.putIfAbsent('id', () => doc.id);
          print(a);
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(String id, String content) async {
    try {
      await firestore.collection('posts').doc(id).update({'content': content});
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection('posts').doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
