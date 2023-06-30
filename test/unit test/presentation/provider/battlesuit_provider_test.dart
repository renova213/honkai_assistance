import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_character.dart';
import 'package:honkai_assistance/presentation/provider/battlesuit_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'battlesuit_provider_test.mocks.dart';

@GenerateMocks([GetCharacter])
void main() {
  CharacterEntity testCharacterEntity = const CharacterEntity(
      characterName: "string",
      urlImageCharacter: "string",
      urlImageAvatar: "string",
      urlImageATK: "string",
      characterRole: "string",
      characterTypeATK: "string",
      characterSpeciality: <CharacterSpecialityEntity>[
        CharacterSpecialityEntity(urlImage: "string", name: "string")
      ],
      characterBiography: CharacterBiographyEntity(
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
      characterWeapon: <CharacterWeaponEntity>[
        CharacterWeaponEntity(
            priority: "string",
            name: "string",
            star: "string",
            urlImage: "string",
            weaponSkill: [
              WeaponSkillEntity(title: "string", description: "string")
            ])
      ],
      characterStigmata: <CharacterStigmataEntity>[
        CharacterStigmataEntity(
            priority: "string",
            name: "string",
            star: "string",
            setName: "string",
            typeStigmata: "string",
            urlImage: "string",
            stigmataEffect: [
              CharacterStigmataEffectEntity(
                  title: "string", description: "string")
            ])
      ],
      characterTeam: <CharacterTeamEntity>[
        CharacterTeamEntity(
            teamList: [TeamListEntity(name: "string", urlImage: "string")])
      ]);

  group('BattlesuitProvider', () {
    MockGetCharacter usecase = MockGetCharacter();
    BattlesuitProvider provider = BattlesuitProvider(getCharacter: usecase);

    test(
        'should update app state and CharacterEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => Right([testCharacterEntity]),
      );

      await provider.getBattlesuits();

      expect(provider.appState, AppState.loaded);
      expect(provider.battlesuits.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getBattlesuits();

      expect(provider.appState, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}
