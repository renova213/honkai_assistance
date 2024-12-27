import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/components/search_field.dart';
import 'package:flutter/services.dart';
import 'package:honkai_assistance/presentation/screens/stigmata/child/grid_stigmata.dart';
import 'package:provider/provider.dart';

import '../../components/title_line_2.dart';
import '../../provider/stigmata_provider.dart';

class StigmataScreen extends StatefulWidget {
  const StigmataScreen({super.key});

  @override
  State<StigmataScreen> createState() => _BattlesuitScreenState();
}

class _BattlesuitScreenState extends State<StigmataScreen> {
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
        Provider.of<StigmataProvider>(context, listen: false)
            .searchStigmata("");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text("Stigmata", style: AppFont.headline6),
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
            child: Consumer<StigmataProvider>(
              builder: (context, notifier, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("List of stigmata available on Honkai Impact 3",
                      style: AppFont.largeText),
                  SizedBox(height: 24.h),
                  TitleLine2(
                      title: "Stigmatas",
                      title2:
                          "Showing ${notifier.searchResults.length} stigmatas"),
                  SizedBox(height: 12.h),
                  SearchField(
                    width: double.maxFinite,
                    hintText: "Search Stigmata ...",
                    controller: _searchController,
                    onChanged: (value) {
                      notifier.searchStigmata(value);
                    },
                  ),
                  SizedBox(height: 16.h),
                  const GridStigmata()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
