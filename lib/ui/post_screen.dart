import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:proyecto/model/post.dart';
//nuevo para imagenes
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:date_format/date_format.dart';

XFile image;
String filename;

class PostScreen extends StatefulWidget {
  final Post post;
  PostScreen(this.post);
  @override
  _PostScreenState createState() => _PostScreenState();
}

final postReference = FirebaseDatabase.instance.reference().child('post');

class _PostScreenState extends State<PostScreen> {
  List<Post> items;

  TextEditingController _nameController;
  TextEditingController _codebarController;
  TextEditingController _descriptionController;
  TextEditingController _priceController;
  TextEditingController _stockController;

  //nuevo imagen
  String postImage;
  ImagePicker _picker = ImagePicker();

  pickerCam() async {
    XFile img = await _picker.pickImage(source: ImageSource.camera);
    // XFile img = await _picker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  pickerGallery() async {
    XFile img = await _picker.pickImage(source: ImageSource.gallery);
    // XFile img = await _picker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }
  //fin nuevo imagen

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = new TextEditingController(text: widget.post.name);
    _codebarController = new TextEditingController(text: widget.post.codebar);
    _descriptionController =
        new TextEditingController(text: widget.post.description);
    _priceController = new TextEditingController(text: widget.post.price);
    _stockController = new TextEditingController(text: widget.post.stock);
    postImage = widget.post.postImage;
    print(postImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        //height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blueAccent)),
                      padding: new EdgeInsets.all(5.0),
                      child: image == null
                          ? Text('Add')
                          : Image.file(File(image.path)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.2),
                      child: new Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.blueAccent)),
                        padding: new EdgeInsets.all(5.0),
                        child: postImage == ''
                            ? Text('Edit')
                            : Image.network(postImage + '?alt=media'),
                      ),
                    ),
                    Divider(),
                    //nuevo para llamar imagen de la galeria o capturarla con la camara
                    new IconButton(
                        icon: new Icon(Icons.camera_alt), onPressed: pickerCam),
                    Divider(),
                    new IconButton(
                        icon: new Icon(Icons.image), onPressed: pickerGallery),
                  ],
                ),
                TextField(
                  controller: _nameController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Name'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _codebarController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'CodeBar'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _descriptionController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Description'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _priceController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on), labelText: 'Price'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                TextField(
                  controller: _stockController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.shop), labelText: 'Stock'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                FlatButton(
                    onPressed: () {
                      //nuevo imagen
                      if (widget.post.id != null) {
                        var now = formatDate(
                            new DateTime.now(), [yyyy, '-', mm, '-', dd]);
                        var fullImageName =
                            '${_nameController.text}-$now' + '.jpg';
                        var fullImageName2 =
                            '${_nameController.text}-$now' + '.jpg';

                        final Reference ref =
                            FirebaseStorage.instance.ref().child(fullImageName);
                        final UploadTask task = ref.putFile(File(image.path));

                        var part1 =
                            'https://firebasestorage.googleapis.com/v0/b/proyecto-3ac2c.appspot.com/o/'; //esto cambia segun su firestore

                        var fullPathImage = part1 + fullImageName2;

                        postReference.child(widget.post.id).set({
                          'name': _nameController.text,
                          'codebar': _codebarController.text,
                          'description': _descriptionController.text,
                          'price': _priceController.text,
                          'stock': _stockController.text,
                          'postImage': '$fullPathImage'
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      } else {
                        //nuevo imagen
                        var now = formatDate(
                            new DateTime.now(), [yyyy, '-', mm, '-', dd]);
                        var fullImageName =
                            '${_nameController.text}-$now' + '.jpg';
                        var fullImageName2 =
                            '${_nameController.text}-$now' + '.jpg';

                        final Reference ref =
                            FirebaseStorage.instance.ref().child(fullImageName);
                        final UploadTask task = ref.putFile(File(image.path));

                        var part1 =
                            'https://firebasestorage.googleapis.com/v0/b/proyecto-3ac2c.appspot.com/o/'; //esto cambia segun su firestore

                        var fullPathImage = part1 + fullImageName2;

                        postReference.push().set({
                          'name': _nameController.text,
                          'codebar': _codebarController.text,
                          'description': _descriptionController.text,
                          'price': _priceController.text,
                          'stock': _stockController.text,
                          'postImage': '$fullPathImage' //nuevo imagen
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.post.id != null)
                        ? Text('Update')
                        : Text('Add')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
