import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/provider/stigmata_provider.dart';
import 'package:honkai_assistance/presentation/screens/stigmata/child/stigmata_childs.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';

class BattlesuitDetailStigmata extends StatefulWidget {
  final String setName;
  const BattlesuitDetailStigmata({super.key, required this.setName});

  @override
  State<BattlesuitDetailStigmata> createState() => _DetailStigmataScreenState();
}

class _DetailStigmataScreenState extends State<BattlesuitDetailStigmata> {
  @override
  void initState() {
    Future.microtask(() => Provider.of<StigmataProvider>(context, listen: false)
        .searchStigmata(widget.setName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.setName, style: AppFont.headline6),
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
        child: Consumer<StigmataProvider>(
          builder: (context, notifier, _) => ListView(
            children: [
              ListStigmata(
                  stigmatas: notifier.stigmatas.isNotEmpty
                      ? notifier.stigmatas.first.stigmataItems!
                      : []),
              SizedBox(height: 16.h),
              notifier.stigmatas.isNotEmpty
                  ? _setEffect()
                  : Center(child: Text("Not Found", style: AppFont.subtitle)),
            ],
          ),
        ),
      ),
    );
  }

  Column _setEffect() {
    return Column(
      children: [
        Text("Set Effects", style: AppFont.subtitle),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
              color: AppColor.containerColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Consumer<StigmataProvider>(
              builder: (context, notifier, _) => SetEffect(
                  onTap: false,
                  setEffects: notifier.stigmatas.isNotEmpty
                      ? notifier.stigmatas.first.setEffects!
                      : []),
            ),
          ),
        )
      ],
    );
  }
}
