import 'package:proyecto/data/flutter_flow/flutter_flow_icon_button.dart';
import 'package:proyecto/data/flutter_flow/flutter_flow_theme.dart';
import 'package:proyecto/data/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class NPostWidget extends StatefulWidget {
  NPostWidget({Key key}) : super(key: key);

  @override
  _NPostWidgetState createState() => _NPostWidgetState();
}

class _NPostWidgetState extends State<NPostWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
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
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 90,
                        icon: Icon(
                          Icons.upload_file,
                          color: Colors.black,
                          size: 40,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
