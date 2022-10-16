import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';

class TierListSupport extends StatelessWidget {
  const TierListSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            "EX",
            style: bodyText1.copyWith(
                fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ),
        Container(
          color: Colors.red.withOpacity(0.2),
        ),
      ],
    );
  }
}
