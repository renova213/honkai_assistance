import 'package:honkai_assistance/domain/entities/glossary.dart';

class GlossarySpeciality {
  Future<List<Glossary>> call() async {
    const List<Glossary> glossarySpecialites = [
      Glossary(title: "Physical", descirption: "Skill deals physical damage"),
      Glossary(title: "Ice DMG", descirption: "Skill deals ice damage"),
      Glossary(title: "Fire DMG", descirption: "Skill deals fire damage"),
      Glossary(
          title: "Lightning DMG", descirption: "Skill deals lightning damage"),
    ];

    return glossarySpecialites;
  }
}
