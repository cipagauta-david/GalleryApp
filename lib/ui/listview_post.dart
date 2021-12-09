import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:proyecto/model/firestore.dart';
import 'dart:async';
import 'package:proyecto/ui/post_screen.dart';
import 'package:proyecto/ui/post_information.dart';
import 'package:proyecto/model/post.dart';

class ListViewPost extends StatefulWidget {
  @override
  _ListViewPostState createState() => _ListViewPostState();
}

final postReference = FirebaseDatabase.instance.reference().child('post');

class _ListViewPostState extends State<ListViewPost> {

  List<Post> posts;
  StreamSubscription<Event> _onPostAddedSubscription;
  StreamSubscription<Event> _onPostChangedSubscription;

  @override
  void initState() {
    super.initState();
    List posts = [];
    _onPostAddedSubscription = postReference.onChildAdded.listen(_onPostAdded);
    _onPostChangedSubscription =
        postReference.onChildChanged.listen(_onPostUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    _onPostAddedSubscription.cancel();
    _onPostChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts List'),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: posts.length,
              padding: EdgeInsets.only(top: 3.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(
                      height: 1.0,
                    ),
                    Container(
                      padding: new EdgeInsets.all(3.0),
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            //nuevo imagen
                            new Container(
                              padding: new EdgeInsets.all(5.0),
                              child: '${posts[position].postImage}' == ''
                                  ? Text('No image')
                                  : Image.network(
                                      '${posts[position].postImage}' +
                                          '?alt=media',
                                      fit: BoxFit.fill,
                                      height: 57.0,
                                      width: 57.0,
                                    ),
                            ),
                            Expanded(
                              child: ListTile(
                                  title: Text(
                                    '${posts[position].name}',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${posts[position].description}',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  onTap: () => _navigateToPostInformation(
                                      context, posts[position])),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => _showDialog(context, position),
                            ),

                            //onPressed: () => _deletePost(context, posts[position],position)),
                            IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () =>
                                    _navigateToPost(context, posts[position])),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.pinkAccent,
          onPressed: () => _createNewPost(context),
        ),
      ),
    );
  }

  //nuevo para que pregunte antes de eliminar un registro
  void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.purple,
              ),
              onPressed: () => _deletePost(
                context,
                posts[position],
                position,
              ),
            ),
            new TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onPostAdded(Event event) {
    setState(() {
      posts.add(new Post.fromSnapShot(event.snapshot));
    });
  }

  void _onPostUpdate(Event event) {
    var oldPostValue =
        posts.singleWhere((post) => post.id == event.snapshot.key);
    setState(() {
      posts[posts.indexOf(oldPostValue)] =
          new Post.fromSnapShot(event.snapshot);
    });
  }

  void _deletePost(BuildContext context, Post post, int position) async {
    await postReference.child(post.id).remove().then((_) {
      setState(() {
        posts.removeAt(position);
        Navigator.of(context).pop();
      });
    });
  }

  void _navigateToPostInformation(BuildContext context, Post post) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostScreen(post)),
    );
  }

  void _navigateToPost(BuildContext context, Post post) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostInformation(post)),
    );
  }

  void _createNewPost(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              PostScreen(Post(null, '', '', '', '', '', '', '', '', ''))),
    );
  }
}
