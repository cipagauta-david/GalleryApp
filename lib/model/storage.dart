import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:proyecto/ui/post_screen.dart';

class Storage {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await storage.ref('posts/$filename').putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future<String> downloadURL(String imagePath,String imageName) async {
    String downloadURL = await storage.ref('$imagePath$imageName').getDownloadURL();
    return downloadURL;
  }
}
