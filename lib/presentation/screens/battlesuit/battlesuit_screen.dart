import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/screens/battlesuit/child/dropdown_button_battlesuit.dart';
import 'package:honkai_assistance/presentation/screens/battlesuit/child/grid_battlesuit.dart';
import 'package:honkai_assistance/presentation/components/search_field.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../components/title_line_2.dart';
import '../../provider/battlesuit_provider.dart';

class BattlesuitScreen extends StatefulWidget {
  const BattlesuitScreen({super.key});

  @override
  State<BattlesuitScreen> createState() => _BattlesuitScreenState();
}

class _BattlesuitScreenState extends State<BattlesuitScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        Provider.of<BattlesuitProvider>(context, listen: false)
            .searchBattlesuit(
                searchValue: "", roleValue: "Any Role", typeValue: "Any Type");
        Provider.of<BattlesuitProvider>(context, listen: false)
            .getBattlesuits();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text("Battlesuit", style: AppFont.headline6),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
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
                Consumer<BattlesuitProvider>(
                  builder: (context, notifier, _) {
                    return TitleLine2(
                        title: "Battlesuits",
                        title2:
                            "Showing ${notifier.searchResults.length} battlesuits");
                  },
                ),
                SizedBox(height: 12.h),
                DropdownButtonBattlesuit(controller: _searchController),
                SizedBox(height: 8.h),
                Consumer<BattlesuitProvider>(
                  builder: (context, notifier, _) => SearchField(
                    width: double.maxFinite,
                    hintText: "Search Battlesuit ...",
                    controller: _searchController,
                    onChanged: (value) {
                      notifier.searchBattlesuit(
                          searchValue: value,
                          typeValue: notifier.typeATK,
                          roleValue: notifier.role);
                    },
                  ),
                ),
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
