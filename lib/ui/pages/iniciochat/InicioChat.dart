import 'package:flutter/material.dart';
import 'package:proyecto/ui/pages/models/usuario.dart';

class InicioChat extends StatefulWidget {
  //const InicioChat({Key? key}) : super(key: key);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<InicioChat> {
  final usuarios = [
    Usuario(
        uid: '1',
        nombre: 'Alex Millan',
        email: 'prueba@gmail.com',
        online: true),
    Usuario(
        uid: '2', nombre: 'Eimmy', email: 'prueba@gmail.com', online: false),
    Usuario(
        uid: '3', nombre: 'Marcela ', email: 'prueba@gmail.com', online: true),
    Usuario(uid: '4', nombre: 'Karol', email: 'prueba@gmail.com', online: true),
    Usuario(
        uid: '5', nombre: 'Eimmy', email: 'prueba@gmail.com', online: false),
    Usuario(
        uid: '6', nombre: 'Marcela ', email: 'prueba@gmail.com', online: true),
    Usuario(uid: '7', nombre: 'Karol', email: 'prueba@gmail.com', online: true),
    Usuario(
        uid: '8', nombre: 'Eimmy', email: 'prueba@gmail.com', online: false),
    Usuario(
        uid: '9', nombre: 'Marcela ', email: 'prueba@gmail.com', online: true),
    Usuario(
        uid: '10', nombre: 'Karol', email: 'prueba@gmail.com', online: true),
    Usuario(
        uid: '11', nombre: 'Eimmy', email: 'prueba@gmail.com', online: false),
    Usuario(
        uid: '12', nombre: 'Marcela ', email: 'prueba@gmail.com', online: true),
    Usuario(uid: '13', nombre: 'Jose', email: 'prueba@gmail.com', online: true)
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Mi Chat',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 1,
          backgroundColor: Colors.black26,
          leading: Center(
            child: CircleAvatar(
              minRadius: 18.0,
              maxRadius: 18.0,
              backgroundImage:
                  NetworkImage('https://picsum.photos/seed/913/400'),
            ),
          ),
          //leading: IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {}),
          //leading: IconButton(chitd: ), onPressed: () {}),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              //margin: EdgeInsets.only(right: 10),
              //child: Icon(Icons.exit_to_app, color: Colors.white)
              child:
                  IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {}),
              //child: Icon(Icons.offline_bolt, color: Colors.red),
            )
          ],
        ),
        body: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, i) => ListTile(
                  title: Text(usuarios[i].nombre),
                  leading: CircleAvatar(
                    backgroundColor: Colors.black38,
                    child: Text(usuarios[i].nombre.substring(0, 2),
                        style: TextStyle(color: Colors.white)),
                  ),
                  trailing: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color:
                            usuarios[i].online ? Colors.green[300] : Colors.red,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, 'chat');
                  },
                ),
            separatorBuilder: (_, i) => Divider(),
            itemCount: usuarios.length));
  }
}
