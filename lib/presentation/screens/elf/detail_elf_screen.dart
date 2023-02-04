import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/presentation/screens/elf/child/elf_childs.dart';

class DetailElfScreen extends StatelessWidget {
  final ElfEntity elf;
  const DetailElfScreen({super.key, required this.elf});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DetailElfAppbar(elf: elf),
            Padding(
              padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 24, top: 24)
                  .r,
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
