import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_elf.dart';
import 'package:honkai_assistance/presentation/provider/elf_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'elf_provider_test.mocks.dart';

@GenerateMocks([GetElf])
void main() {
  ElfEntity testElfEntity = const ElfEntity(
      elfName: "string",
      urlImage: "string",
      typeATK: "string",
      urlImageATK: "string",
      elfSkills: [
        ElfSkillEntity(
            urlImage: "string", skillName: "string", descriptionSkill: "string")
      ],
      elfSpecialities: [
        ElfSpecialityEntity(urlImage: "string", name: "string")
      ]);

  group('ElfProvider', () {
    MockGetElf usecase = MockGetElf();
    ElfProvider provider = ElfProvider(getElf: usecase);

    test(
        'should update app state and ElfEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => Right([testElfEntity]),
      );

      await provider.getElfs();

      expect(provider.appState, AppState.loaded);
      expect(provider.elfs.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getElfs();

      expect(provider.appState, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}
