import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mensaje.dart';

class ChatPantalla extends StatefulWidget {
  //const ChatPantalla({Key? key}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPantalla> {
  //FocusNode myFocusNode;
  final _textControl = new TextEditingController();
  final _focus = new FocusNode();
  List<mensaje> _mimensaje = [
    mensaje(texto: 'Hola', uid: '2'),
    mensaje(texto: 'Hola Mundo', uid: '123'),
    mensaje(texto: 'Hola Mundo', uid: '2'),
    mensaje(texto: 'Hola Mundo', uid: '123'),
  ];

  bool _escribiendo = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alex Millan',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 1,
        backgroundColor: Colors.black12,
        leading: Center(
          child: CircleAvatar(
            minRadius: 18.0,
            maxRadius: 18.0,
            backgroundImage: NetworkImage(
                'https://uifaces.co/our-content/donated/36K1AQPs.jpg'),
          ),
        ),
        //leading: IconButton(icon: Icon(Icons.exit_to_app), onPressed: () {}),
        //leading: IconButton(chitd: ), onPressed: () {}),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            //margin: EdgeInsets.only(right: 10),
            //child: Icon(Icons.exit_to_app, color: Colors.white)
            child: IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  _focus.unfocus();
                  Navigator.pushNamed(context, 'usuarios');
                }),
            //child: Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          _focus.unfocus();

          //final FocusScopeNode focuss = FocusScope.of(context);
          //focuss.unfocus();
          //if (!focuss.hasPrimaryFocus && focuss.hasFocus) {
          //FocusManager.instance.primaryFocus.unfocus();
          //focuss.unfocus();
          //}
        },
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _mimensaje.length,
              itemBuilder: (_, i) => _mimensaje[i],
              reverse: true,
            )),
            Divider(height: 1),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
              child: TextField(
            controller: _textControl,
            onSubmitted: _textoEnviado,
            onChanged: (String texto) {
              setState(() {
                if (texto.trim().length > 0) {
                  _escribiendo = true;
                } else {
                  _escribiendo = false;
                }
              });
            },
            decoration: InputDecoration.collapsed(hintText: "Mensaje"),
            focusNode: _focus,
          )),
          //Boton enviar
          Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: Text('Enviar'),
                      onPressed: _escribiendo
                          ? () => _textoEnviado(_textControl.text.trim())
                          : null,
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[900]),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(Icons.send),
                          onPressed: _escribiendo
                              ? () => _textoEnviado(_textControl.text.trim())
                              : null,
                        ),
                      ),
                    ))
        ],
      ),
    ));
  }

  _textoEnviado(String texto) {
    if (texto.length == 0) return;
    print(texto);
    _textControl.clear();
    _focus.requestFocus();

    final nuevoMensaje = new mensaje(texto: texto, uid: "123");
    _mimensaje.insert(0, nuevoMensaje);
    setState(() {
      _escribiendo = false;
    });
  }
}
