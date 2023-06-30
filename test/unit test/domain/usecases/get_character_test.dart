import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_character.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetCharacter usecase = GetCharacter(remoteRepository: remoteRepository);

  const CharacterEntity testCharacterEntity = CharacterEntity(
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

  test('should get list of CharacterEntity from the repository', () async {
    when(remoteRepository.getCharacter())
        .thenAnswer((_) async => const Right([testCharacterEntity]));

    final result = await usecase();

    verify(remoteRepository.getCharacter());

    expect(result, const Right([testCharacterEntity]));
  });
}
