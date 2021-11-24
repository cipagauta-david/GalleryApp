import 'package:flutter/material.dart';
import 'package:proyecto/iniciochat/chat.dart';

import 'package:proyecto/iniciochat/InicioChat.dart';

final Map<String, Widget Function(BuildContext)> appRutas = {
  'usuarios': (_) => InicioChat(),
  'chat': (_) => ChatPantalla()
};
