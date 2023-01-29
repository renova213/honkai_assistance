import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/screens/battlesuit/child/list_button_battlesuit.dart';
import 'package:honkai_assistance/presentation/widgets/search_field.dart';
import 'package:flutter/services.dart';

import '../../widgets/title_line_2.dart';

class BattlesuitScreen extends StatelessWidget {
  const BattlesuitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text("Battlesuit", style: AppFont.headline6),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            focusField.unfocus();

            FocusScope.of(context).requestFocus(FocusNode());
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 24)
                    .r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("List of battlesuit available on Honkai Impact 3",
                    style: AppFont.largeText),
                SizedBox(height: 24.h),
                const TitleLine2(
                    title: "Battlesuits", title2: "Showing 9 battlesuits"),
                SizedBox(height: 12.h),
                const ListButtonBattlesuit(),
                SizedBox(height: 8.h),
                SearchField(
                    width: double.maxFinite,
                    hintText: "Search Battlesuit ...",
                    controller: TextEditingController(),
                    onSubmit: (value) {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
