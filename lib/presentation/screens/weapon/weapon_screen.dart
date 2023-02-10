import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/components/search_field.dart';
import 'package:flutter/services.dart';
import 'package:honkai_assistance/presentation/provider/firestore/weapon_provider.dart';
import 'package:provider/provider.dart';

import '../../components/title_line_2.dart';
import 'child/grid_weapon.dart';

class WeaponScreen extends StatefulWidget {
  const WeaponScreen({super.key});

  @override
  State<WeaponScreen> createState() => _BattlesuitScreenState();
}

class _BattlesuitScreenState extends State<WeaponScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text("Weapon", style: AppFont.headline6),
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
            child: Consumer<WeaponProvider>(
              builder: (context, notifier, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("List of weapon available on Honkai Impact 3",
                      style: AppFont.largeText),
                  SizedBox(height: 24.h),
                  TitleLine2(
                      title: "Weapons",
                      title2: "Showing ${notifier.weapons.length} weapons"),
                  SizedBox(height: 12.h),
                  SearchField(
                    width: double.maxFinite,
                    hintText: "Search Weapon ...",
                    controller: _searchController,
                    onSubmit: (value) {
                      notifier.searchWeapon(value);
                      _searchController.clear();
                    },
                  ),
                  SizedBox(height: 16.h),
                  const GridWeapon()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
