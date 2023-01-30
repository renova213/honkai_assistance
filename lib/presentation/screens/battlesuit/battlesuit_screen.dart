import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/providers/character_provider.dart';
import 'package:honkai_assistance/presentation/screens/battlesuit/child/dropdown_button_battlesuit.dart';
import 'package:honkai_assistance/presentation/screens/battlesuit/child/grid_battlesuit.dart';
import 'package:honkai_assistance/presentation/widgets/search_field.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../widgets/title_line_2.dart';

class BattlesuitScreen extends StatefulWidget {
  const BattlesuitScreen({super.key});

  @override
  State<BattlesuitScreen> createState() => _BattlesuitScreenState();
}

class _BattlesuitScreenState extends State<BattlesuitScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        Provider.of<CharacterProvider>(context, listen: false).getCharacters();
      },
    );
  }

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
                Consumer<CharacterProvider>(
                  builder: (context, notifier, _) {
                    return TitleLine2(
                        title: "Battlesuits",
                        title2:
                            "Showing ${notifier.battlesuits.length} battlesuits");
                  },
                ),
                SizedBox(height: 12.h),
                const DropdownButtonBattlesuit(),
                SizedBox(height: 8.h),
                SearchField(
                    width: double.maxFinite,
                    hintText: "Search Battlesuit ...",
                    controller: TextEditingController(),
                    onSubmit: (value) {}),
                SizedBox(height: 16.h),
                const GridBattlesuit(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
