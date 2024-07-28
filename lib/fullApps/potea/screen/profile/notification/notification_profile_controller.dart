import 'package:get/get.dart';

class NotificationProfileController extends GetxController {
  var isGeneralNotificationSwitched = false.obs;
  var isSoundSwitched = false.obs;
  var isVibrateSwitched = false.obs;
  var isSpecialOffersSwitched = false.obs;
  var isPromoDiscountSwitched = false.obs;
  var isPaymentsSwitched = false.obs;
  var isCashbackSwitched = false.obs;
  var isAppUpdatesSwitched = false.obs;
  var isNewServiceAvailableSwitched = false.obs;
  var isNewTipsAvailableSwitched = false.obs;

  void toggleGeneralNotification(bool value) {
    isGeneralNotificationSwitched.value = value;
  }

  void toggleSound(bool value) {
    isSoundSwitched.value = value;
  }

  void toggleVibrate(bool value) {
    isVibrateSwitched.value = value;
  }

  void toggleSpecialOffers(bool value) {
    isSpecialOffersSwitched.value = value;
  }

  void togglePromoDiscount(bool value) {
    isPromoDiscountSwitched.value = value;
  }

  void togglePayments(bool value) {
    isPaymentsSwitched.value = value;
  }

  void toggleCashback(bool value) {
    isCashbackSwitched.value = value;
  }

  void toggleAppUpdates(bool value) {
    isAppUpdatesSwitched.value = value;
  }

  void toggleNewServiceAvailable(bool value) {
    isNewServiceAvailableSwitched.value = value;
  }

  void toggleNewTipsAvailable(bool value) {
    isNewTipsAvailableSwitched.value = value;
  }
}
