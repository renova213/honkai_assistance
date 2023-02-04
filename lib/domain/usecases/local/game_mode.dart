import 'package:honkai_assistance/domain/entities/glossary.dart';

class GameMode {
  Future<List<Glossary>> call() async {
    const List<Glossary> gameModes = [
      Glossary(
          title: "Memorial Arena",
          descirption:
              "is a game title where Captains can face off against challenging bosses with different difficulties, the score depend on how fast boss get killed"),
      Glossary(
          title: "Exalted Abyss",
          descirption:
              "Is an Abyss title for Lv80+ Captains. Every Abyss round consists of four stages."),
      Glossary(
          title: "Q-Singularis",
          descirption:
              "Q-Singularis breaks down into 4 layers, each containing 4 standard floors and 1 Boss floor with a special layer effect."),
    ];

    return gameModes;
  }
}
