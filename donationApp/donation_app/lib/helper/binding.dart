import 'package:donation_app/core/view_model/auth_viewmodel.dart';
import 'package:donation_app/core/view_model/home_viewmodel.dart';
import 'package:get/get.dart';

import '../core/network_viewmodel.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => NetworkViewModel());
  }
}
// 