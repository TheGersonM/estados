import 'package:get/get.dart';



class TitleController extends GetxController {
  final RxString _title = '0'.obs;
  
  
  String get titlevalue => _title.value;
  set titlevalue(String value) => _title.value = value;
}