
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:swarp/model/user.dart';

class AuthController extends GetxController {
  Rxn<User> thisuser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
  }

  User? get user => thisuser.value;

}

