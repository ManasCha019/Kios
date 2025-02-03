import 'package:get/get.dart';

class MemberNoController extends GetxController {
  var memberNo = ''.obs;

  void addNumber(String number) {
    if (memberNo.value.length < 9) {
      memberNo.value += number;
    }
  }

  void clear() {
    memberNo.value = '';
  }

  void delete() {
    if (memberNo.value.isNotEmpty) {
      memberNo.value = memberNo.value.substring(0, memberNo.value.length - 1);
    }
  }
}
