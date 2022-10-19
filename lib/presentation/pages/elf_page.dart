import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honkai_lab/presentation/pages/widgets/elf/list_elf.dart';
import 'package:honkai_lab/presentation/pages/widgets/elf/search_character_field_elf.dart';
import 'package:provider/provider.dart';

import '../../common/style.dart';
import '../providers/character_provider.dart';

class ElfPage extends StatefulWidget {
  const ElfPage({super.key});

  @override
  State<ElfPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<ElfPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<CharacterProvider>(context, listen: false)
          .fetchCharacter(""),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final focusField = FocusNode();

    return GestureDetector(
      onTap: () {
        focusField.unfocus();
        FocusScope.of(context).requestFocus(FocusNode());
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text("Characters", style: headline6),
            const SizedBox(height: 8),
            Text("List of elf available in honkai impact 3", style: bodyText1),
            const SizedBox(height: 16),
            _dropDownButton(),
            const SizedBox(height: 32),
            _titleContainer(),
            const SizedBox(height: 16),
            const SearchFieldElf(),
            const SizedBox(height: 16),
            const ListElf(),
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }

  Widget _titleContainer() {
    return Consumer<CharacterProvider>(
      builder: (context, notifier, _) => Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(color: Colors.blue, width: 3),
                ),
              ),
              child: Text("Elfs", style: subtitle),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade700, width: 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("Showing ${notifier.listCharacters.length} elfs",
                    style: bodyText2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropDownButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Sort", style: subtitle),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          width: 150,
          child: DropdownButtonHideUnderline(
            child: Consumer<CharacterProvider>(
              builder: (context, notifier, _) => DropdownButton2(
                selectedItemHighlightColor: Colors.blue,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                dropdownDecoration: BoxDecoration(
                  color: Colors.grey.shade800,
                ),
                buttonPadding: const EdgeInsets.only(left: 8),
                buttonDecoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                  color: Colors.grey.shade800,
                ),
                focusColor: Colors.white,
                items: notifier.itemsDropdown
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: bodyText2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                value: notifier.value,
                onChanged: (value) {
                  notifier.changeValueButton(value as String);
                  notifier.sortList();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
