import 'package:get/get.dart';

class AccountSecurityController extends GetxController {
  RxBool BiometricID = false.obs;
  RxBool FaceID = false.obs;
  RxBool SMSAuthenticator = false.obs;
  RxBool GoogleAuthenticator = false.obs;
}
