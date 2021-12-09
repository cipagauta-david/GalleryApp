import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:proyecto/model/post.dart';


class PostInformation extends StatefulWidget {
  final Post post;
  PostInformation(this.post);
  @override
  _PostInformationState createState() => _PostInformationState();
}

final postReference = FirebaseDatabase.instance.reference().child('post');

class _PostInformationState extends State<PostInformation> {

  List<Post> posts;

  String postImage;//nuevo

  @override
  void initState() {   
    super.initState();
    postImage = widget.post.postImage;//nuevo
    print(postImage);//nuevo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Information y Foto'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        height: 800.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[                
                new Text("Name : ${widget.post.name}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Codebar : ${widget.post.codebar}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Description : ${widget.post.description}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Price : ${widget.post.price}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Stock : ${widget.post.stock}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                Container(
                          height: 300.0,
                          width: 300.0,
              child: Center(
                child: postImage == ''
                    ? Text('No Image')
                    : Image.network(postImage+'?alt=media'),//nuevo para traer la imagen de firestore
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}