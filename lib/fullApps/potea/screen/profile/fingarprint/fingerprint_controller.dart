import 'dart:async';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class FingarPrintController extends GetxController {
  var isBiometric = true.obs;

  Future<void> authentificateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    final bool isBiometricSupported =
    await localAuthentication.isDeviceSupported();
    final bool canCheckBiometrics =
    await localAuthentication.canCheckBiometrics;

    if (isBiometricSupported && canCheckBiometrics) {
      isBiometric.value = await localAuthentication.authenticate(
          localizedReason: 'Please complete the biometrics to proceed');
    }
  }
}