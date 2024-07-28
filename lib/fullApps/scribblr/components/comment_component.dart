import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../models/comments_model.dart';
import '../utils/colors.dart';

class CommentComponent extends StatefulWidget {
  final CommentModel commentData;

  const CommentComponent({required this.commentData});

  @override
  State<CommentComponent> createState() => _CommentComponentState();
}

class _CommentComponentState extends State<CommentComponent> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLiked = widget.commentData.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(widget.commentData.userImage.validate()), fit: BoxFit.cover),
          ),
        ),
        16.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.commentData.userName.validate(), style: TextStyle(color: scribblrPrimaryColor)),
            2.height,
            Text(
              widget.commentData.comment.validate(),
              style: TextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
            )
          ],
        ).expand(),
        IconButton(
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.redAccent : scribblrPrimaryColor,
            size: 20,
          ),
        )
      ],
    ).paddingSymmetric(vertical: 8, horizontal: 8);
  }
}
