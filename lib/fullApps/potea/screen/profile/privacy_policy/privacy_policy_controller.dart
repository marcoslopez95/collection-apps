import 'package:get/get.dart';
import 'package:access_maketicket/fullApps/potea/screen/profile/privacy_policy/policy_model.dart';

class PrivacyController extends GetxController {
  var privacyData = <PrivacyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPrivacyData();
  }

  void fetchPrivacyData() {
    var data = [
      PrivacyModel('1. Types of Data We Collect',
          'We collect various types of data, including personal information such as your name, email address, phone number, and mailing address. We also gather account information like your username and password, payment details including credit card information, and technical data such as your IP address and browser type. Additionally, we collect usage data on your interactions with our website and services, as well as non-personal, aggregated information for analytical purposes.'),
      PrivacyModel('2. Use of Your Personal Data',
          'We use your personal data to provide and maintain our services, ensuring a seamless user experience. This includes processing transactions, managing your account, and communicating with you about updates, promotions, and other relevant information. We also use your data to improve and personalize our website and services based on your usage patterns. Additionally, your personal data helps us monitor and analyze trends to enhance functionality, and it assists in detecting, preventing, and addressing technical issues and security threats.'),
      PrivacyModel('3. Disclosure of Your Personal Data',
          'We may share your personal data with trusted third-party service providers who help us operate our services, such as payment processors and customer support. Additionally, we may disclose your information to comply with legal obligations or in response to legal requests. In the event of a business transaction, like a merger or sale, your data may be transferred to the new owners. We also share your data with your consent or at your direction.'),
    ];

    privacyData.value = data;
  }
}
