import 'package:get/get.dart';

class sesionU extends GetxController {
  var _imaPerfil = 'https://picsum.photos/seed/913/400'.obs;
  var _nombre = "Julanito".obs;

  String get imaPerfil => _imaPerfil.value;
  String get nombre => _nombre.value;
}
