import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:access_maketicket/fullApps/potea/components/app_scaffold.dart';

import 'friend_invite_controller.dart';
import 'friend_tile.dart';

class InviteFriendsScreen extends StatelessWidget {
  final FriendsController controller = Get.put(FriendsController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: Text('Invite Friends', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.friends.length,
          itemBuilder: (context, index) {
            return FriendTile(
              friend: controller.friends[index],
              onInviteToggle: () => controller.toggleInvite(index),
            );
          },
        ),
      ),
    );
  }
}
