import 'package:get/get.dart';

import '../../../utils/image.dart';
import '../model/payment_model.dart';

class PaymentController extends GetxController {
  var payment = <PaymentModel>[
    PaymentModel(profileImage: icPaypal, paymentType: 'PayPal', price: '\$9.449'),
    PaymentModel(profileImage: icGoogle, paymentType: 'Google Pay', price: '\$9.449'),
    PaymentModel(profileImage: icAppleWhite, paymentType: 'Apple Pay', price: '\$9.449'),
    PaymentModel(profileImage: walletMastercard, paymentType: 'Credit/Debit card', price: '\$9.449'),
  ].obs;

  var selectedpayment = Rx<PaymentModel?>(null);

  void setSelectedpayment(PaymentModel? payments) {
    selectedpayment.value = payments;
  }
}
