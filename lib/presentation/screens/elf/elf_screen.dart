import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/components/search_field.dart';
import 'package:flutter/services.dart';
import 'package:honkai_assistance/presentation/screens/elf/child/elf_childs.dart';
import 'package:provider/provider.dart';

import '../../components/custom_dropdown_button.dart';
import '../../components/title_line_2.dart';
import '../../provider/elf_provider.dart';

class ElfScreen extends StatefulWidget {
  const ElfScreen({super.key});

  @override
  State<ElfScreen> createState() => _BattlesuitScreenState();
}

class _BattlesuitScreenState extends State<ElfScreen> {
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
        Provider.of<ElfProvider>(context, listen: false)
            .searchElf(searchValue: "", typeValue: "Any Type");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text("Elf", style: AppFont.headline6),
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
            child: Consumer<ElfProvider>(
              builder: (context, notifier, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("List of elf available on Honkai Impact 3",
                      style: AppFont.largeText),
                  SizedBox(height: 24.h),
                  TitleLine2(
                      title: "Elfs",
                      title2: "Showing ${notifier.searchResults.length} elfs"),
                  SizedBox(height: 12.h),
                  Consumer<ElfProvider>(
                    builder: (context, notifier, _) => Row(
                      children: [
                        Expanded(
                          child: CustomDropdownButton(
                            changeValue: (value) {
                              notifier.searchElf(
                                  typeValue: value,
                                  searchValue: _searchController.text);
                            },
                            height: 35,
                            width: double.maxFinite,
                            value: notifier.typeATK,
                            items: const [
                              "Any Type",
                              "Physical",
                              "Ice",
                              "Fire",
                              "Lightning"
                            ],
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: SearchField(
                            width: double.maxFinite,
                            hintText: "Search Elf ...",
                            controller: _searchController,
                            onChanged: (value) {
                              notifier.searchElf(
                                  searchValue: value,
                                  typeValue: notifier.typeATK);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const GridElf(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
