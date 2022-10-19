import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/style.dart';
import '../../../providers/detail_character_provider.dart';

class EquipmentCharacter extends StatelessWidget {
  const EquipmentCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<DetailCharacterProvider>(
          builder: (context, notifier, _) => Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleContainer("Recommended Equipment", width),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _titleContainer(String title, double width) {
    return Container(
      height: 30,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        title,
        style: bodyText2.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
