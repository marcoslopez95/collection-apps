import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../utils/colors.dart';
import 'friend_model.dart';

class FriendTile extends StatelessWidget {
  final Friend friend;
  final VoidCallback onInviteToggle;

  FriendTile({required this.friend, required this.onInviteToggle});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              friend.imageAsset,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(friend.name, style: TextStyle()),
        subtitle: Text(friend.phone, style: TextStyle()),
        trailing: ElevatedButton(
          onPressed: onInviteToggle,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: friend.isInvited.value ? Colors.transparent : poteaPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: poteaPrimaryColor),
            ),
          ),
          child: Text(friend.isInvited.value ? 'Invited' : 'Invite', style: TextStyle(color: friend.isInvited.value ? poteaPrimaryColor : white)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      );
    });
  }
}
