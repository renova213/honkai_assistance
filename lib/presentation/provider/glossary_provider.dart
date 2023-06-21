import 'package:flutter/material.dart';

class GlossaryProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _gameModes = [
    {
      "title": "Memorial Arena",
      "description":
          "is a game title where Captains can face off against challenging bosses with different difficulties, the score depend on how fast boss get killed"
    },
    {
      "title": "Exalted Abyss",
      "description":
          "Is an Abyss title for Lv80+ Captains. Every Abyss round consists of four stages."
    },
    {
      "title": "Q-Singularis",
      "description":
          "Q-Singularis breaks down into 4 layers, each containing 4 standard floors and 1 Boss floor with a special layer effect."
    }
  ];
  final List<Map<String, dynamic>> _glossaryRanks = [
    {"title": "EX", "description": "Have highest score on bosses"},
    {
      "title": "S",
      "description":
          "Coverage more bosses and still top scores on spesific bosses"
    },
    {
      "title": "A",
      "description":
          "Technically still a great valk, but lost in meta due to various reasons"
    },
    {
      "title": "B",
      "description":
          "Lost to meta and still have decent score on specific bosses"
    },
    {
      "title": "OUT",
      "description":
          "Technically, not usable in current meta and have the lowest score"
    }
  ];
  final List<Map<String, dynamic>> _glossarySpecialities = [
    {"title": "Physical", "description": "Skill deals physical damage"},
    {"title": "Ice DMG", "description": "Skill deals ice damage"},
    {"title": "Fire DMG", "description": "Skill deals fire damage"},
    {"title": "Lightning DMG", "description": "Skill deals lightning damage"}
  ];

  List<Map<String, dynamic>> get glossarySpecialities => _glossarySpecialities;
  List<Map<String, dynamic>> get gameModes => _gameModes;
  List<Map<String, dynamic>> get glossaryRanks => _glossaryRanks;
}
