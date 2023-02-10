import 'package:honkai_assistance/domain/entities/glossary.dart';

class GlossaryRank {
  Future<List<Glossary>> call() async {
    const List<Glossary> glossaryRanks = [
      Glossary(title: "EX", descirption: "Have highest score on bosses"),
      Glossary(
          title: "S",
          descirption:
              "Coverage more bosses and still top scores on spesific bosses"),
      Glossary(
          title: "A",
          descirption:
              "Technically still a great valk, but lost in meta due to various reasons"),
      Glossary(
          title: "B",
          descirption:
              "Lost to meta and still have decent score on specific bosses"),
      Glossary(
          title: "OUT",
          descirption:
              "Technically, not usable in current meta and have the lowest score"),
    ];
    return glossaryRanks;
  }
}
