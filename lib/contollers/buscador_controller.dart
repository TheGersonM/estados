import 'package:get/get.dart';



class BuscadorController extends GetxController {
  final RxString _buscador = '0'.obs;
  
  
  String get buscadorvalue => _buscador.value;
  set buscadorvalue(String value) => _buscador.value = value;
}