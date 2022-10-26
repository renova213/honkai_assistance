import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/presentation/blocs/character_bloc/character_bloc.dart';
import 'package:honkai_lab/presentation/widgets/character/list_character.dart';
import 'package:honkai_lab/presentation/widgets/character/search_character_field.dart';
import 'package:provider/provider.dart';

import '../../../common/style.dart';
import '../../providers/character_provider.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => BlocProvider.of<CharacterBloc>(context, listen: false).add(
        const FetchCharacter(value: ""),
      ),
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
            Text("List of character available in honkai impact 3",
                style: bodyText1),
            const SizedBox(height: 16),
            _dropDownButton(),
            const SizedBox(height: 32),
            _titleContainer(),
            const SizedBox(height: 16),
            const SearchCharacterField(),
            const SizedBox(height: 16),
            const ListCharacter(),
            SizedBox(height: height * 0.3),
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
              child: Text("Characters", style: subtitle),
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
                child: BlocBuilder<CharacterBloc, CharacterState>(
                  builder: (context, state) {
                    return Text(
                        state is LoadedCharacter
                            ? "Showing ${state.characters.length} characters"
                            : "Showing 0 characters",
                        style: bodyText2);
                  },
                ),
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
                  context.read<CharacterBloc>().add(
                        SortAscending(value: value),
                      );
                  context.read<CharacterBloc>().add(
                        SortDescending(value: value),
                      );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
