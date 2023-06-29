import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/guide_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_beginner_guide.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetBeginnerGuide usecase =
      GetBeginnerGuide(remoteRepository: remoteRepository);

  const testGuideEntity = GuideEntity(
      titleGuide: "string",
      urlImage: "string",
      descriptionGuide: "string",
      guideItems: [
        GuideItemEntity(title: "string", guideDetails: [
          GuideItemDetailEntity(
              description: "string", subtitle: "string", image: "string")
        ])
      ]);

  test('should get list of GuideEntity from the repository', () async {
    when(remoteRepository.getBeginnerGuide())
        .thenAnswer((_) async => const Right([testGuideEntity]));

    final result = await usecase();

    verify(remoteRepository.getBeginnerGuide());

    expect(result, const Right([testGuideEntity]));
  });
}
