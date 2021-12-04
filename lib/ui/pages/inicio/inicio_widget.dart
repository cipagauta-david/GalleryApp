import 'package:proyecto/data/flutter_flow/flutter_flow_icon_button.dart';
import 'package:proyecto/data/flutter_flow/flutter_flow_theme.dart';
import 'package:proyecto/data/flutter_flow/flutter_flow_util.dart';
import 'package:proyecto/ui/pages/iniciochat/InicioChat.dart';
import 'package:proyecto/model/post.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class InicioWidget extends StatefulWidget {
  InicioWidget({Key key}) : super(key: key);

  @override
  _InicioWidgetState createState() => _InicioWidgetState();
}

final postReference = FirebaseDatabase.instance.reference().child('post');

class _InicioWidgetState extends State<InicioWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Post> posts;
  StreamSubscription<Event> _onPostAddedSubscription;
  StreamSubscription<Event> _onPostChangedSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    posts = [];
    _onPostAddedSubscription= postReference.onChildAdded.listen(_onPostAdded);
    _onPostChangedSubscription= postReference.onChildChanged.listen(_onPostChanged);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onPostAddedSubscription.cancel();
    _onPostChangedSubscription.cancel();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/proyecto-3ac2c.appspot.com/o/logoappmovil.jpg?alt=media&token=cae36c9f-58fb-406a-be92-4796adc61449',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Container(
                              width: 70,
                              height: 70,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/913/400',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 50,
                            icon: Icon(
                              Icons.chat_bubble,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InicioChat(),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 60,
                            icon: Icon(
                              Icons.add_box_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            child: Text(
                              'Evento 1',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            child: Text(
                              'Evento 2',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            child: Text(
                              'Evento 3',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            child: Text(
                              'Evento 4',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            child: Text(
                              'Evento 5',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Colors.white,
                            child: Text(
                              'Evento 6',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                        child:
                            ListView.builder(itemBuilder: (context, position) {
                          return Column(
                            children: [
                              Divider(height: 7.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text('$posts[position].name'),
                                      subtitle: Text('$posts[position].content'),
                                      leading: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.amber,
                                            radius: 17.0,
                                            child: Text('$posts[position].content'),
                                          )
                                        ]
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          );
                        })),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _onPostAdded(Event event){
    setState(() {
      posts.add(new Post.fromSnapShot(event.snapshot));
    });
  }

  void _onPostChanged(Event event){
    var oldPostValue= posts.singleWhere((post) => post.id == event.snapshot.key);
    setState(() {
      posts[posts.indexOf(oldPostValue)] = new Post.fromSnapShot(event.snapshot);
    });
  }

  void _deletePost(BuildContext context, Post post, int position) async{
    await postReference.child(post.id).remove().then((value){
      setState(() {
        posts.removeAt(position);
      });
    });
  }
}
