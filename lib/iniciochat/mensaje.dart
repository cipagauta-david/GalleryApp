import 'dart:ffi';

import 'package:flutter/material.dart';

class mensaje extends StatelessWidget {
  final String texto;
  final String uid;

  const mensaje({key, this.texto, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.uid == '123' ? _mimensaje() : mensjedeusuario(),
    );
  }

  Widget _mimensaje() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5, left: 50, right: 6),
        child: Text(
          this.texto,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget mensjedeusuario() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(bottom: 5, left: 6, right: 50),
        child: Text(
          this.texto,
          style: TextStyle(color: Colors.white70),
        ),
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
