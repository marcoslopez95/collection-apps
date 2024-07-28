import 'package:get/get.dart';

class Friend {
  final String name;
  final String phone;
  final String imageAsset;
  RxBool isInvited;

  Friend(this.name, this.phone, this.imageAsset, bool isInvited) : isInvited = RxBool(isInvited);
}
