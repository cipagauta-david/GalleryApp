import 'package:firebase_database/firebase_database.dart';

class Post {
  String _id;
  String _userId;
  String _content;
  String _ubication;
  String _name;
  String _codebar;
  String _description;
  String _price;
  String _stock;
  String _postImage;

  Post(
      this._id,
      this._userId,
      this._content,
      this._ubication,
      this._name,
      this._codebar,
      this._description,
      this._price,
      this._stock,
      this._postImage);

  Post.map(dynamic obj) {
    this._userId = obj['userId'];
    this._content = obj['content'];
    this._ubication = obj['ubication'];
    this._name = obj['name'];
    this._codebar = obj['codebar'];
    this._description = obj['description'];
    this._price = obj['price'];
    this._stock = obj['stock'];
    this._postImage = obj['postImage'];
  }

  String get id => _id;
  String get userId => _userId;
  String get content => _content;
  String get ubication => _ubication;
  String get postImage => _postImage;
  String get name => _name;
  String get codebar => _codebar;
  String get description => _description;
  String get price => _price;
  String get stock => _stock;

  Post.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _userId = snapshot.value['userId'];
    _content = snapshot.value['content'];
    _ubication = snapshot.value['ubication'];
    _name = snapshot.value['name'];
    _codebar = snapshot.value['codebar'];
    _description = snapshot.value['description'];
    _price = snapshot.value['price'];
    _stock = snapshot.value['stock'];
    _postImage = snapshot.value['postImage'];
  }
}
