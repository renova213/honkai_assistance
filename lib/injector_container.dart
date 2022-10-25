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
import 'package:honkai_lab/presentation/blocs/character_bloc/character_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/banner_character_bloc/banner_character_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/elf_banner_bloc/elf_banner_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/event_honkai_bloc/event_honkai_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/redeem_code_bloc/redeem_code_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/update_bloc/update_bloc.dart';
import 'package:honkai_lab/presentation/blocs/home/weapon_stigmata_bloc/weapon_stigmata_bloc_bloc.dart';
import 'package:honkai_lab/presentation/blocs/tier_list/changelog_bloc/changelog_bloc.dart';
import 'package:honkai_lab/presentation/blocs/tier_list/tier_list_character_bloc/tier_list_character_bloc.dart';

final sl = GetIt.instance;

void setUp() {
  sl.registerLazySingleton<HonkaiLabRemoteDataSource>(
    () => HonkaiLabRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<HonkaiLabRepositories>(
      () => HonkaiLabRepositoriesImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<GetActiveCodes>(
    () => GetActiveCodes(repositories: sl()),
  );

  sl.registerLazySingleton<GetEventHonkai>(
    () => GetEventHonkai(repositories: sl()),
  );
  sl.registerLazySingleton<GetLatestUpdate>(
    () => GetLatestUpdate(repositories: sl()),
  );
  sl.registerLazySingleton<GetBannerCharacter>(
    () => GetBannerCharacter(repositories: sl()),
  );
  sl.registerLazySingleton<GetElfBanner>(
    () => GetElfBanner(
      repositories: sl(),
    ),
  );
  sl.registerLazySingleton<GetWeaponStigmaBanner>(
    () => GetWeaponStigmaBanner(repositories: sl()),
  );
  sl.registerLazySingleton<GetCharacter>(
    () => GetCharacter(repositories: sl()),
  );
  sl.registerLazySingleton<GetChangelog>(
    () => GetChangelog(repositories: sl()),
  );

  //bloc
  sl.registerFactory<RedeemCodeBloc>(
    () => RedeemCodeBloc(getActiveCodes: sl()),
  );

  sl.registerFactory<EventHonkaiBloc>(
    () => EventHonkaiBloc(getEventHonkai: sl()),
  );
  sl.registerFactory<UpdateBloc>(
    () => UpdateBloc(getLatestUpdate: sl()),
  );
  sl.registerFactory<ElfBannerBloc>(
    () => ElfBannerBloc(getElfBanner: sl()),
  );
  sl.registerFactory<BannerCharacterBloc>(
    () => BannerCharacterBloc(getBannerCharacter: sl()),
  );
  sl.registerFactory<WeaponStigmataBloc>(
    () => WeaponStigmataBloc(getWeaponStigmaBanner: sl()),
  );
  sl.registerFactory<CharacterBloc>(
    () => CharacterBloc(getCharacter: sl()),
  );
  sl.registerFactory<TierListCharacterBloc>(
    () => TierListCharacterBloc(getCharacter: sl()),
  );
  sl.registerFactory<ChangelogBloc>(
    () => ChangelogBloc(getChangelog: sl()),
  );
}
