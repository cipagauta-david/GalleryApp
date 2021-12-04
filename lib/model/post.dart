import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Post {
  String _id;
  String _userId;
  String _content;
  String _ubication;

  Post(this._id, this._userId, this._content, this._ubication);

  Post.map(dynamic obj) {
    this._id = obj['id'];
    this._userId = obj['userId'];
    this._content = obj['content'];
    this._ubication = obj['ubication'];
  }

  String get id => _id;
  String get userId => _userId;
  String get content => _content;
  String get ubication => _ubication;

  Post.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _userId = snapshot.value['userId'];
    _content = snapshot.value['content'];
    _ubication = snapshot.value['ubication'];
  }
}

