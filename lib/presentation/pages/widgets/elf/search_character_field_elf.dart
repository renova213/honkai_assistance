import 'package:flutter/material.dart';
import 'package:honkai_lab/presentation/providers/character_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/style.dart';

class SearchFieldElf extends StatefulWidget {
  const SearchFieldElf({super.key});

  @override
  State<SearchFieldElf> createState() => _SearchFieldElfState();
}

class _SearchFieldElfState extends State<SearchFieldElf> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(
      builder: (context, notifier, _) => SizedBox(
        height: 40,
        child: TextField(
          controller: _searchController,
          onChanged: (value) => notifier.fetchCharacter(value),
          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _searchController.clear();
                  });
                  notifier.fetchCharacter("");
                },
                icon: const Icon(Icons.close, color: Colors.black87),
              ),
              contentPadding: const EdgeInsets.only(left: 8, top: 5, right: 8),
              hintStyle: bodyText2.copyWith(color: Colors.grey.shade800),
              hintText: "Search by name or element",
              filled: true,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              fillColor: Colors.white),
        ),
      ),
    );
  }
}
