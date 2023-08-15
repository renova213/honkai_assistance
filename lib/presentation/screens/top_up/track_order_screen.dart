import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/style/font_style.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Track Order", style: AppFont.subtitle),
      ),
    );
  }
}
