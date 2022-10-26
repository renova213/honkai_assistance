import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/character.dart';
import 'package:honkai_lab/domain/usecases/get_character.dart';
import 'package:honkai_lab/presentation/blocs/character_bloc/character_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_bloc_test.mocks.dart';

@GenerateMocks([GetCharacter])
void main() {
  MockGetCharacter mockGetCharacter = MockGetCharacter();
  CharacterBloc bloc = CharacterBloc(getCharacter: mockGetCharacter);

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

  group('FetchCharacter', () {
    test('should get data from the GetCharacter usecase', () async {
      when(mockGetCharacter(any, any))
          .thenAnswer((_) async => const Right([testCharacter]));

      bloc.add(const FetchCharacter(value: ""));
      await untilCalled(mockGetCharacter("character", ""));

      verify(mockGetCharacter("character", ""));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      when(mockGetCharacter(any, any))
          .thenAnswer((_) async => const Right([testCharacter]));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingCharacter(),
            const LoadedCharacter(characters: [testCharacter])
          ]));

      bloc.add(const FetchCharacter(value: ""));
    });

    test(
        'should emit [Loading, Loaded] when user trigger event SearchCharacter',
        () async {
      when(mockGetCharacter(any, any))
          .thenAnswer((_) async => const Right([testCharacter]));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingCharacter(),
            const LoadedCharacter(characters: [testCharacter])
          ]));

      bloc.add(const SearchCharacter(value: ""));
    });

    test('should emit [Loading, Failure] when data is gotten successfully',
        () async {
      when(mockGetCharacter(any, any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'ServerFailure')));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingCharacter(),
            const ErrorCharacter(errorMessage: "ServerFailure")
          ]));

      bloc.add(const FetchCharacter(value: ""));
    });
  });
}
