import 'package:proyecto/data/flutter_flow/flutter_flow_theme.dart';
import 'package:proyecto/data/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatefulWidget {
  ProfileWidget({Key key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool checkboxListTileValue1;
  bool checkboxListTileValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 200,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 80, 50, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF02626),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.network(
                        'https://picsum.photos/seed/913/400',
                      ).image,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(70, 0, 0, 0),
                    child: Text(
                      '@NatyPortman\n',
                      style: FlutterFlowTheme.title2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 100, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(1),
                        bottomRight: Radius.circular(1),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(1),
                      ),
                      child: Image.network(
                        'https://as1.ftcdn.net/v2/jpg/03/25/91/36/1000_F_325913690_cFyNpLuJnrO5r6w7I6z1sVN1OTUQx7jP.jpg',
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.45, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Container(
                      width: 120,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/476/600',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Text(
                      '@Professional\nTe ví en la exposición de arte de Bogotá, de Edwin Castro,     ¿te gustó?',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF0D0202),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: CheckboxListTile(
                      value: checkboxListTileValue1 ??= true,
                      onChanged: (newValue) =>
                          setState(() => checkboxListTileValue1 = newValue),
                      tileColor: Color(0xFF0D0202),
                      activeColor: Color(0xFF0D0202),
                      checkColor: Color(0xFFF7F7F7),
                      dense: true,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(30, 10, 0, 0),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://picsum.photos/seed/422/600',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Text(
                    '@AlcaldíaArauca\n@NatyPort gracias por asistir a nuestro evento de óleo, y participar como ',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: CheckboxListTile(
                    value: checkboxListTileValue2 ??= false,
                    onChanged: (newValue) =>
                        setState(() => checkboxListTileValue2 = newValue),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: Color(0xFF0D0202),
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(30, 10, 0, 0),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      'https://http2.mlstatic.com/D_NQ_NP_2X_692947-MLA32511615302_102019-F.webp-de-',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFEEEEEE),
                  ),
                  child: Text(
                    'Gracias por sus sugerencias! He decidio pasar por Suiza para Art Basel, estoy emocionada! luego les cuento como me fue',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.bodyText1,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(
                      'https://cdn-icons.flaticon.com/png/512/1357/premium/1357748.png?token=exp=1637384409~hmac=0dc696d33f14a5c70915f0e8180690dc',
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: 100,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://as2.ftcdn.net/v2/jpg/00/98/26/11/500_F_98261175_Sv69O3rZsHApYkjAdrWbgQixYHwyZyOr.jpg',
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: 25,
                      fit: BoxFit.contain,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
