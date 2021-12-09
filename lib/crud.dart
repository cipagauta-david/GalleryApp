import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/model/firestore.dart';

class Crud extends StatefulWidget {
  Crud({Key key}) : super(key: key);

  @override
  _CrudState createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  Firestore data;
  List docs = [];
  initialise() {
    data = Firestore();
    data.read().then((value) => {
          setState(() {
            print('holacomotas');
            print(value);
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
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
        child: Center(
          child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(children: [
                    Text(docs[index]['id']),
                    Text(docs[index]['userId']),
                    Text(docs[index]['content'])
                  ]),
                );
              }),
        ),
      ),
    );
  }
}
