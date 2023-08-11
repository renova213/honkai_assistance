import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/style/app_color.dart';
import 'package:honkai_assistance/common/style/font_style.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  const ChatBubble({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColor.blue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(message, style: AppFont.largeText),
          Text(time, style: AppFont.smallText),
        ],
      ),
    );
  }
}
