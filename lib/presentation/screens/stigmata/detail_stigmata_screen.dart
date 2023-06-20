import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import 'package:honkai_assistance/presentation/screens/stigmata/child/stigmata_childs.dart';

import '../../../common/style/style.dart';

class DetailStigmataScreen extends StatelessWidget {
  final StigmataEntity stigmata;
  const DetailStigmataScreen({super.key, required this.stigmata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stigmata.stigmataName, style: AppFont.headline6),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24),
        child: ListView(
          children: [
            ListStigmata(stigmatas: stigmata.stigmataItems!),
            SizedBox(height: 16.h),
            _setEffect(),
          ],
        ),
      ),
    );
  }

  Container _setEffect() {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.containerColor,
          borderRadius: BorderRadius.circular(10)),
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: SetEffect(onTap: false, setEffects: stigmata.setEffects!),
      ),
    );
  }
}
