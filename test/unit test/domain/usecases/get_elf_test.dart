import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_elf.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetElf usecase = GetElf(remoteRepository: remoteRepository);

  const testElfEntity = ElfEntity(
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

  test('should get list of ElfEntity from the repository', () async {
    when(remoteRepository.getElf())
        .thenAnswer((_) async => const Right([testElfEntity]));

    final result = await usecase();

    verify(remoteRepository.getElf());

    expect(result, const Right([testElfEntity]));
  });
}
