import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/character_model.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  CharacterModel testCharacterModel = const CharacterModel(
      characterName: "string",
      urlImageCharacter: "string",
      urlImageAvatar: "string",
      urlImageATK: "string",
      characterRole: "string",
      characterTypeATK: "string",
      characterSpeciality: <CharacterSpecialityModel>[
        CharacterSpecialityModel(urlImage: "string", name: "string")
      ],
      characterBiography: CharacterBiographyModel(
          rank: "string",
          typeElement: "string",
          typeATK: "string",
          backgroundDetail: "string",
          birthplace: "string",
          dateBirth: "string",
          gender: "string",
          height: "string",
          organization: "string",
          weight: "string"),
      characterWeapon: <CharacterWeaponModel>[
        CharacterWeaponModel(
            priority: "string",
            name: "string",
            star: "string",
            urlImage: "string",
            weaponSkill: [
              WeaponSkillModel(title: "string", description: "string")
            ])
      ],
      characterStigmata: <CharacterStigmataModel>[
        CharacterStigmataModel(
            priority: "string",
            name: "string",
            star: "string",
            setName: "string",
            typeStigmata: "string",
            urlImage: "string",
            stigmataEffect: [
              CharacterStigmataEffectModel(
                  title: "string", description: "string")
            ])
      ],
      characterTeam: <CharacterTeamModel>[
        CharacterTeamModel(
            teamList: [TeamListModel(name: "string", urlImage: "string")])
      ]);

  test('should be a subclass of CharacterEntity', () {
    expect(testCharacterModel, isA<CharacterEntity>());
  });

  group('fromJson', () {
    test('should return valid model CharacterModel from json', () {
      final List jsonMap = json.decode(fixture('character.json'));
      final result = CharacterModel.fromMap(jsonMap.first);
      expect(result, testCharacterModel);
    });
  });
}
