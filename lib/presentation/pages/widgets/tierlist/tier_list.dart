import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/presentation/pages/widgets/tierlist/tier_list_dps.dart';
import 'package:honkai_lab/presentation/providers/tier_list_provider.dart';
import 'package:provider/provider.dart';

class TierList extends StatelessWidget {
  const TierList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text("Tier List", style: headline6),
          const SizedBox(height: 8),
          Text("DPS and support tier list SEA and global on version 6.0",
              style: bodyText1),
          const SizedBox(height: 16),
          _dropDownButton(),
          const SizedBox(height: 32),
          _titleContainer(),
          _log(),
          const SizedBox(height: 16),
          const TierListDps(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _dropDownButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Server", style: bodyText2),
        const SizedBox(height: 8),
        SizedBox(
          height: 40,
          width: 150,
          child: DropdownButtonHideUnderline(
            child: Consumer<TierListProvider>(
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
                items: notifier.items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: bodyText2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: notifier.value,
                onChanged: (value) {
                  notifier.changeValueButton(value as String);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _titleContainer() {
    return Consumer<TierListProvider>(
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
              child: Text(notifier.value == "DPS" ? "DPS" : "Support",
                  style: subtitle),
            ),
          ),
          Expanded(
            flex: 3,
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
                child:
                    Text("This tier list from Marisa Honkai", style: bodyText2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _log() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade700, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const Icon(Icons.history, color: Colors.blue, size: 20),
              TextButton(
                child: Text(
                  "Changelog",
                  style: bodyText2.copyWith(color: Colors.blue),
                ),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.help, color: Colors.blue, size: 20),
              TextButton(
                child: Text(
                  "Help",
                  style: bodyText2.copyWith(color: Colors.blue),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
