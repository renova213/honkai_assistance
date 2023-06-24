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
    {"title": "S", "description": "Have highest score on bosses"},
    {
      "title": "A",
      "description":
          "Coverage more bosses and still top scores on spesific bosses"
    },
    {
      "title": "B",
      "description":
          "Technically still a great valk, but lost in meta due to various reasons"
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
    {"title": "Lightning DMG", "description": "Skill deals lightning damage"},
    {
      "title": "Aerial",
      "description": "Valkyrie can attack enemies in mid air"
    },
    {
      "title": "Bleed",
      "description":
          "Enemies will bleed at full Bleed Trauma. bleeding enemies take 40% ATK of Physical DMG every 0.5s for 10s"
    },
    {
      "title": "Burst",
      "description":
          "Burst mode is state of enhanced in which valk atk pattern is changed and have increased properties"
    },
    {
      "title": "Fast ATK",
      "description": "Valkyrie attacks frequently and quickly"
    },
    {
      "title": "Freeze",
      "description":
          "Enemies freeze at full Rime Trauma. Frozen enemies will be unable to move for 5s"
    },
    {"title": "Gather", "description": "Skill pulls in nearby enemies"},
    {"title": "Heal", "description": "Skill heals teammates"},
    {"title": "Heavy ATK", "description": "Deal more DMG aganinst shields"},
    {
      "title": "Ignite",
      "description":
          "Enemies will be ignited at full Ignite Trauma. Ignited enemies take 30% ATK of Fire DMG every 0.5s for 10s"
    },
    {
      "title": "Impair",
      "description": "Impaired enemies take more Physical DMG"
    },
    {
      "title": "Paralyze",
      "description":
          "Enemies will be Paralyzed at full Paralyze Trauma. Paralyzed enemies will be unable to move for 5s"
    },
    {
      "title": "Stun",
      "description":
          "Enemies will be stunned at full Stun Trauma. Stunned enemies will be unable to move for 5s"
    },
    {
      "title": "Time Mastery",
      "description":
          "Skill or ultimate evasion triggers time slow. Time slowed enemies move more slowly"
    },
    {
      "title": "Weaken",
      "description": "Weakened enemies deal less Physical DMG"
    },
  ];

  List<Map<String, dynamic>> get glossarySpecialities => _glossarySpecialities;
  List<Map<String, dynamic>> get gameModes => _gameModes;
  List<Map<String, dynamic>> get glossaryRanks => _glossaryRanks;
}
