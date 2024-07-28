import 'package:get/get.dart';
import 'package:prokit_flutter/fullApps/potea/screen/profile/help_center/customer_service/message_model.dart';

class ChatController extends GetxController {
  final messages = <Message>[
    Message(text: 'Hello, good morning.', isSent: false, time: '09:41'),
    Message(text: 'I am a Customer Service. Is there anything I can help you with? 😊', isSent: false, time: '09:41'),
    Message(text: 'Hi, I\'m having problems with my order & payment.', isSent: true, time: '09:41'),
    Message(text: 'Can you help me?', isSent: true, time: '09:41'),
    Message(text: 'Of course...', isSent: false, time: '09:41'),
    Message(text: 'Can you tell me the problem you are having? so I can help solve it 😊', isSent: false, time: '09:41'),
  ].obs;

  void sendMessage(String text) {
    messages.add(Message(text: text, isSent: true, time: '09:41'));
  }
}
