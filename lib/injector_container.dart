import 'package:get_it/get_it.dart';
import 'package:honkai_lab/data/datasources/honkai_lab_remote_data_sources.dart';
import 'package:honkai_lab/data/repositories/honkai_lab_repositories_impl.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';
import 'package:honkai_lab/domain/usecases/get_active_codes.dart';
import 'package:honkai_lab/domain/usecases/get_banner_character.dart';
import 'package:honkai_lab/domain/usecases/get_changelog.dart';
import 'package:honkai_lab/domain/usecases/get_elf_banner.dart';
import 'package:honkai_lab/domain/usecases/get_event_honkai.dart';
import 'package:honkai_lab/domain/usecases/get_last_update.dart';
import 'package:honkai_lab/domain/usecases/get_character.dart';
import 'package:honkai_lab/domain/usecases/get_weapon_stigma_banner.dart';
import 'package:honkai_lab/presentation/providers/character_provider.dart';
import 'package:honkai_lab/presentation/providers/home_provider.dart';

import 'presentation/providers/tier_list_provider.dart';

final sl = GetIt.instance;

void setUp() {
  sl.registerLazySingleton<HonkaiLabRemoteDataSource>(
    () => HonkaiLabRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<HonkaiLabRepositories>(
      () => HonkaiLabRepositoriesImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<GetActiveCodes>(
    () => GetActiveCodes(
      repositories: sl(),
    ),
  );

  sl.registerLazySingleton<GetEventHonkai>(
    () => GetEventHonkai(
      repositories: sl(),
    ),
  );
  sl.registerLazySingleton<GetLatestUpdate>(
    () => GetLatestUpdate(
      repositories: sl(),
    ),
  );
  sl.registerLazySingleton<GetBannerCharacter>(
    () => GetBannerCharacter(
      repositories: sl(),
    ),
  );
  sl.registerLazySingleton<GetElfBanner>(
    () => GetElfBanner(
      repositories: sl(),
    ),
  );
  sl.registerLazySingleton<GetWeaponStigmaBanner>(
    () => GetWeaponStigmaBanner(
      repositories: sl(),
    ),
  );
  sl.registerLazySingleton<GetCharacter>(
    () => GetCharacter(
      repositories: sl(),
    ),
  );
  sl.registerLazySingleton<GetChangelog>(
    () => GetChangelog(
      repositories: sl(),
    ),
  );

  //provider
  sl.registerLazySingleton<HomeProvider>(
    () => HomeProvider(
      getWeaponStigmaBanner: sl(),
      getBannerCharacter: sl(),
      getActiveCodes: sl(),
      getEventHonkai: sl(),
      getLastUpdate: sl(),
      getElfBanner: sl(),
    ),
  );

  sl.registerLazySingleton<TierListProvider>(
    () => TierListProvider(
      character: sl(),
      changelog: sl(),
    ),
  );
  sl.registerLazySingleton<CharacterProvider>(
    () => CharacterProvider(
      character: sl(),
    ),
  );
}
