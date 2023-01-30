import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/glossary.dart';

class GlossaryProvider extends ChangeNotifier {
  final List<Glossary> _listModeGame = const [
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

  final List<Glossary> _rankGlossaries = const [
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

  final List<Glossary> _specialities = const [
    Glossary(title: "Physical", descirption: "Skill deals physical damage"),
    Glossary(title: "Ice DMG", descirption: "Skill deals ice damage"),
    Glossary(title: "Fire DMG", descirption: "Skill deals fire damage"),
    Glossary(
        title: "Lightning DMG", descirption: "Skill deals lightning damage"),
  ];

  List<Glossary> get specialities => _specialities;
  List<Glossary> get listModeGame => _listModeGame;
  List<Glossary> get rankGlossaries => _rankGlossaries;
}
