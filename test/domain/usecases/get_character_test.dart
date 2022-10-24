import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/domain/entities/character.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';
import 'package:honkai_lab/domain/usecases/get_character.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_active_code_test.mocks.dart';

@GenerateMocks([HonkaiLabRepositories])
void main() {
  MockHonkaiLabRepositories repositories = MockHonkaiLabRepositories();
  GetCharacter usecase = GetCharacter(repositories: repositories);

  const String collectionName = "collectionName";

  const testCharacter = Character(
      element: "element",
      image: "image",
      imageChibi: "imageChibi",
      nameCharacter: "nameCharacter",
      tier: "tier",
      elementImage: "elementImage",
      role: "role",
      detail: Detail(
          characterProfile: CharacterProfile(
              dateBirth: "dateBirth",
              battlesuitDetail: "battlesuitDetail",
              gender: "gender",
              organization: "organization",
              height: "height",
              birthplace: "birthplace",
              weight: "weight"),
          rankUpLevel: [
            RankUpLevel(rankUp: "rankUp", description: "description")
          ],
          characterEquipment: CharacterEquipment(stigmatas: [
            EquipmentStigmataCharacter(
                nameStigmata: "nameStigmata",
                rank: "rank",
                urlImage: "urlImage")
          ], weapons: [
            EquipmentWeaponCharacter(
                nameWeapon: "nameWeapon", rank: "rank", urlImage: "urlImage")
          ]),
          characterTeam: [
            CharacterTeam(characterTeam: <CharacterTeamItem>[
              CharacterTeamItem(
                  nameCharacter: "nameCharacter", urlImage: "urlImage")
            ], nameTeam: "nameTeam")
          ],
          characterElysianRealm: CharacterElysianRealm(
              recommendedSetup: RecommendedSetup(emblemSetup: [
                EmblemSetup(contents1: "contents1", contents2: "contents2")
              ], setupSignet: [
                SetupSignet(contents1: "contents1", contents2: "contents2")
              ], supportSetup: [
                SupportSetup(
                    contents1: "contents1",
                    contents2: "contents2",
                    contents3: "contents3")
              ]),
              coreSignet: [
                CoreSignet(contents1: "contents1", contents2: "contents2")
              ],
              reinforcementSignet: [
                ReinforcementSignet(
                    contents1: "contents1", contents2: "contents2")
              ])));

  test('should get Character from the repository', () async {
    when(repositories.getCharacter(any, any))
        .thenAnswer((_) async => const Right([testCharacter]));

    final result = await usecase(collectionName, "character");

    verify(repositories.getCharacter(collectionName, "character"));

    expect(result, const Right([testCharacter]));
  });
}
