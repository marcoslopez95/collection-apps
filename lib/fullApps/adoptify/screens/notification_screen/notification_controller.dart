import 'package:get/get.dart';
import 'package:access_maketicket/main/utils/AppConstant.dart';

import '../../../../generated/assets.dart';
import 'model/notification_model.dart';

class NotificationController extends GetxController {
  final RxList<NotifactionModel> notifications = RxList([
    NotifactionModel(
      icon: "${BaseUrl}/images/adoptify/icons/star.png",
      title: "Account Security Alert 🔒",
      description: "We've noticed some unusual activity on your account. Please review your recent logins and update your password if necessary.",
      time: "09:41 AM",
      hasNotification: true,
    ),
    NotifactionModel(
      icon: "${BaseUrl}/images/adoptify/icons/verified.png",
      title: "System Update Available 🔄",
      description: "A new system update is ready for installation. It includes performance improvements and bug fixes.",
      time: "08:46 AM",
      hasNotification: true,
    ),
    NotifactionModel(
      icon: "${BaseUrl}/images/adoptify/icons/exclamation.png",
      title: "Password Reset Successful ✅",
      description: "Your password has been successfully reset. If you didn't request this change. please contact support immediately.",
      time: "20:30 PM",
    ),
    NotifactionModel(
      icon: "${BaseUrl}/images/adoptify/icons/star.png",
      title: "Account Security Alert 🔒",
      description: "We've noticed some unusual activity on your account. Please review your recent logins and update your password if necessary.",
      time: "09:41 AM",
      hasNotification: true,
    ),
    NotifactionModel(
      icon: "${BaseUrl}/images/adoptify/icons/verified.png",
      title: "System Update Available 🔄",
      description: "A new system update is ready for installation. It includes performance improvements and bug fixes.",
      time: "08:46 AM",
      hasNotification: true,
    ),
    NotifactionModel(
      icon: "${BaseUrl}/images/adoptify/icons/exclamation.png",
      title: "Password Reset Successful ✅",
      description: "Your password has been successfully reset. If you didn't request this change. please contact support immediately.",
      time: "20:30 PM",
    ),
  ]);
}
