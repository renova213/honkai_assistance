import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/components/search_field.dart';
import 'package:flutter/services.dart';
import 'package:honkai_assistance/presentation/screens/outfit/child/outfit_childs.dart';
import 'package:provider/provider.dart';

import '../../components/title_line_2.dart';
import '../../provider/outfit_provider.dart';

class OutfitScreen extends StatefulWidget {
  const OutfitScreen({super.key});

  @override
  State<OutfitScreen> createState() => _BattlesuitScreenState();
}

class _BattlesuitScreenState extends State<OutfitScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() =>
        Provider.of<OutfitProvider>(context, listen: false).searchOutfit(""));
  }

  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text("Outfit", style: AppFont.headline6),
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
            child: Consumer<OutfitProvider>(
              builder: (context, notifier, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("List of outfit available on Honkai Impact 3",
                      style: AppFont.largeText),
                  SizedBox(height: 24.h),
                  TitleLine2(
                      title: "Outfits",
                      title2:
                          "Showing ${notifier.searchResults.length} outfits"),
                  SizedBox(height: 12.h),
                  SearchField(
                    width: double.maxFinite,
                    hintText: "Search Outfit ...",
                    controller: _searchController,
                    onChanged: (value) {
                      notifier.searchOutfit(value);
                    },
                  ),
                  SizedBox(height: 16.h),
                  const GridOutfit()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
