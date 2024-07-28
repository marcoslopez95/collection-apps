import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import 'model/chat_model.dart';

class MessageController extends GetxController {
  var selectedTabIndex = 0.obs;

  final RxList<MessageModel> message = RxList<MessageModel>([
    MessageModel(
      name: "Happy Tails Animal Resc...",
      message: "Hi, of course. You can come dire...",
      time: "09:41",
      image: "${BaseUrl}/images/adoptify/message/1.jpg",
      unread: "1",
    ),
    MessageModel(
      name: "City Critters Adoption C...",
      message: "Haha, yes I’ve seen your profile...",
      time: "08:25",
      image: "${BaseUrl}/images/adoptify/message/2.jpg",
      unread: "3",
    ),
    MessageModel(
      name: "Purr Haven Shelter",
      message: "Wow, this is really epic 👍",
      time: "Yesterday ",
      image: "${BaseUrl}/images/adoptify/message/3.jpg",
      unread: "",
    ),
    MessageModel(
      name: "Metro Paws Animal San...",
      message: "Wow love it! ❤️",
      time: "Dec 21, 2024",
      image: "${BaseUrl}/images/adoptify/message/4.jpg",
      unread: "2",
    ),
    MessageModel(
      name: "Big Apple Pet Rescues",
      message: "Thank you so much andrew 🔥",
      time: "Dec 21, 2024",
      image: "${BaseUrl}/images/adoptify/message/5.jpg",
      unread: "",
    ),
    MessageModel(
      name: "Urban Paws Haven",
      message: "I know… I’m trying to get the ...",
      time: "Dec 20, 2024",
      image: "${BaseUrl}/images/adoptify/message/6.jpg",
      unread: "",
    ),
    MessageModel(
      name: "Central Bark Shelter",
      message: "It’s strong not just fabulous! 😁",
      time: "Dec 20, 2024",
      image: "${BaseUrl}/images/adoptify/message/7.jpg",
      unread: "",
    ),
    MessageModel(
      name: "Manhattan Critter Care",
      message: "Sky blue. Trying it now! 💙",
      time: "Dec 19, 2024",
      image: "${BaseUrl}/images/adoptify/message/8.jpg",
      unread: "",
    ),
    MessageModel(
      name: "Happy Tails Animal Resc...",
      message: "Hi, of course. You can come dire...",
      time: "09:41",
      image: "${BaseUrl}/images/adoptify/message/9.jpg",
      unread: "1",
    ),
    MessageModel(
      name: "City Critters Adoption C...",
      message: "Haha, yes I’ve seen your profile...",
      time: "08:25",
      image: "${BaseUrl}/images/adoptify/message/1.jpg",
      unread: "3",
    ),
  ]);

  final RxList<CallModel> call = RxList<CallModel>([
    CallModel(name: "Happy Tails Animal Resc...", callimage: "${BaseUrl}/images/adoptify/icons/video.png", time: "09:41", image: "${BaseUrl}/images/adoptify/message/1.jpg", indication: "${BaseUrl}/images/adoptify/icons/incomming-call.png"),
    CallModel(name: "City Critters Adoption C...", callimage: "${BaseUrl}/images/adoptify/icons/telephone.png", time: "08:25", image: "${BaseUrl}/images/adoptify/message/2.jpg", indication: "${BaseUrl}/images/adoptify/icons/outgoing-call.png"),
    CallModel(name: "Purr Haven Shelter", callimage: "${BaseUrl}/images/adoptify/icons/telephone.png", time: "Yesterday ", image: "${BaseUrl}/images/adoptify/message/3.jpg", indication: "${BaseUrl}/images/adoptify/icons/incomming-call.png"),
    CallModel(name: "Metro Paws Animal San...", callimage: "${BaseUrl}/images/adoptify/icons/video.png", time: "Dec 21, 2024", image: "${BaseUrl}/images/adoptify/message/4.jpg", indication: "${BaseUrl}/images/adoptify/icons/incomming-call.png"),
    CallModel(name: "Big Apple Pet Rescues", callimage: "${BaseUrl}/images/adoptify/icons/video.png", time: "Dec 21, 2024", image: "${BaseUrl}/images/adoptify/message/5.jpg", indication: "${BaseUrl}/images/adoptify/icons/incomming-call.png"),
    CallModel(name: "Urban Paws Haven", callimage: "${BaseUrl}/images/adoptify/icons/telephone.png", time: "Dec 20, 2024", image: "${BaseUrl}/images/adoptify/message/6.jpg", indication: "${BaseUrl}/images/adoptify/icons/outgoing-call.png"),
    CallModel(name: "Central Bark Shelter", callimage: "${BaseUrl}/images/adoptify/icons/video.png", time: "Dec 20, 2024", image: "${BaseUrl}/images/adoptify/message/7.jpg", indication: "${BaseUrl}/images/adoptify/icons/outgoing-call.png"),
    CallModel(name: "Manhattan Critter Care", callimage: "${BaseUrl}/images/adoptify/icons/telephone.png", time: "Dec 19, 2024", image: "${BaseUrl}/images/adoptify/message/8.jpg", indication: "${BaseUrl}/images/adoptify/icons/incomming-call.png"),
    CallModel(name: "Happy Tails Animal Resc...", callimage: "${BaseUrl}/images/adoptify/icons/telephone.png", time: "09:41", image: "${BaseUrl}/images/adoptify/message/9.jpg", indication: "${BaseUrl}/images/adoptify/icons/outgoing-call.png"),
    CallModel(name: "City Critters Adoption C...", callimage: "${BaseUrl}/images/adoptify/icons/video.png", time: "08:25", image: "${BaseUrl}/images/adoptify/message/1.jpg", indication: "${BaseUrl}/images/adoptify/icons/incomming-call.png"),
  ]);

  var lastBackPressTime = 0.obs;

  bool onWillPop(BuildContext context) {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    if (currentTime - lastBackPressTime.value < 2000) {
      return true; // Exit the app
    } else {
      lastBackPressTime.value = currentTime;
      toast('Press Back Again to Exit');
      return false;
    }
  }
}
