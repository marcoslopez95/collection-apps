import 'package:get/get.dart';

import 'faq_selecter_model.dart';

class FAQSelectedController extends GetxController {
  var model = [
    FAQSelectedModel(name: 'General'),
    FAQSelectedModel(name: 'Account'),
    FAQSelectedModel(name: 'Service'),
    FAQSelectedModel(name: 'Payment'),
  ].obs;

  var faqs = [
    {
      'question': 'What is Potea?',
      'answer':
          'Potea is a plant-centric app that provides users with a seamless experience in discovering, purchasing, and maintaining plants. It combines elements of e-commerce with educational resources and community engagement to create a holistic platform for plant lovers.'
    },
    {'question': 'How to buy plant?', 'answer': 'You can buy a plant by visiting our store and selecting your favorite plant.'},
    {'question': 'How do I cancel an orders?', 'answer': 'To cancel an order, please go to your orders page and select the order you want to cancel.'},
    {'question': 'Is Potea free to use?', 'answer': 'Yes, Potea is free to use for all users.'},
    {'question': 'How to add promo when checkout?', 'answer': 'To add a promo code during checkout, enter your promo code in the promo code field and click apply.'},
  ].obs;

  var selectedFaqOption = (-1).obs;

  void selectFaqOption(int index) {
    selectedFaqOption.value = index;
  }
}
