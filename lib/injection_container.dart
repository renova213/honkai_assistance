import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:honkai_assistance/data/datasources/remote_data_source.dart';
import 'package:honkai_assistance/data/repositories/remote_repository_impl.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';
import 'package:honkai_assistance/domain/usecases/local/about_content_usecase.dart';
import 'package:honkai_assistance/domain/usecases/local/game_mode.dart';
import 'package:honkai_assistance/domain/usecases/local/glossary_rank.dart';
import 'package:honkai_assistance/domain/usecases/local/glossary_speciality.dart';
import 'package:honkai_assistance/domain/usecases/local/menu_database_usecase.dart';
import 'package:honkai_assistance/domain/usecases/local/official_link_global_usecase.dart';
import 'package:honkai_assistance/domain/usecases/local/official_link_sea_usecase.dart';
import 'package:honkai_assistance/domain/usecases/local/sidebar_menu.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_beginner_guide.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_changelog.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_elf.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_general_guide.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_outfit.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_stigmata.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_tier_list.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_weapon.dart';
import 'package:honkai_assistance/presentation/provider/firestore/battlesuit_provider.dart';
import 'package:honkai_assistance/presentation/provider/firestore/beginner_guide_provider.dart';
import 'package:honkai_assistance/presentation/provider/firestore/changelog_provider.dart';
import 'package:honkai_assistance/presentation/provider/firestore/elf_provider.dart';
import 'package:honkai_assistance/presentation/provider/firestore/general_guide_provider.dart';
import 'package:honkai_assistance/presentation/provider/firestore/outfit_provider.dart';
import 'package:honkai_assistance/presentation/provider/firestore/stigmata_provider.dart';
import 'package:honkai_assistance/presentation/provider/firestore/tier_list_provider.dart';
import 'package:honkai_assistance/presentation/provider/local/about_game_provider.dart';
import 'package:honkai_assistance/presentation/provider/local/database_provider.dart';
import 'package:honkai_assistance/presentation/provider/local/glossary_provider.dart';
import 'package:honkai_assistance/presentation/provider/local/sidebar_provider.dart';

import 'domain/usecases/remote/get_character.dart';
import 'domain/usecases/remote/get_character_banner.dart';
import 'domain/usecases/remote/get_elf_banner.dart';
import 'domain/usecases/remote/get_equipment_banner.dart';
import 'domain/usecases/remote/get_event.dart';
import 'domain/usecases/remote/get_news_update.dart';
import 'domain/usecases/remote/get_redeem_code.dart';
import 'presentation/provider/firestore/character_banner_provider.dart';
import 'presentation/provider/firestore/elf_banner_provider.dart';
import 'presentation/provider/firestore/equipment_banner_provider.dart';
import 'presentation/provider/firestore/event_provider.dart';
import 'presentation/provider/firestore/news_update_provider.dart';
import 'presentation/provider/firestore/redeem_code_provider.dart';
import 'presentation/provider/firestore/weapon_provider.dart';

final sl = GetIt.instance;

void setUp() {
  //datasource
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(firestoreService: sl()));

  //repository
  sl.registerLazySingleton<RemoteRepository>(
      () => RemoteRepositoryImpl(remoteDataSource: sl()));

  //usecase remote
  sl.registerLazySingleton<GetRedeemCode>(
      () => GetRedeemCode(remoteRepository: sl()));
  sl.registerLazySingleton<GetNewsUpdate>(
      () => GetNewsUpdate(remoteRepository: sl()));
  sl.registerLazySingleton<GetEvent>(() => GetEvent(remoteRepository: sl()));
  sl.registerLazySingleton<GetCharacterBanner>(
      () => GetCharacterBanner(remoteRepository: sl()));
  sl.registerLazySingleton<GetEquipmentBanner>(
      () => GetEquipmentBanner(remoteRepository: sl()));
  sl.registerLazySingleton<GetElfBanner>(
      () => GetElfBanner(remoteRepository: sl()));
  sl.registerLazySingleton<GetCharacter>(
      () => GetCharacter(remoteRepository: sl()));
  sl.registerLazySingleton<GetElf>(() => GetElf(remoteRepository: sl()));
  sl.registerLazySingleton<GetStigmata>(
      () => GetStigmata(remoteRepository: sl()));
  sl.registerLazySingleton<GetWeapon>(() => GetWeapon(remoteRepository: sl()));
  sl.registerLazySingleton<GetOutfit>(() => GetOutfit(remoteRepository: sl()));
  sl.registerLazySingleton<GetTierList>(
      () => GetTierList(remoteRepository: sl()));
  sl.registerLazySingleton<GetChangelog>(
      () => GetChangelog(remoteRepository: sl()));
  sl.registerLazySingleton<GetBeginnerGuide>(
      () => GetBeginnerGuide(remoteRepository: sl()));
  sl.registerLazySingleton<GetGeneralGuide>(
      () => GetGeneralGuide(remoteRepository: sl()));

  //usecase local
  sl.registerLazySingleton<AboutContentUsecase>(() => AboutContentUsecase());
  sl.registerLazySingleton<OfficialLinkSeaUsecase>(
      () => OfficialLinkSeaUsecase());
  sl.registerLazySingleton<OfficialLinkGlobalUsecase>(
      () => OfficialLinkGlobalUsecase());
  sl.registerLazySingleton<SidebarMenu>(() => SidebarMenu());
  sl.registerLazySingleton<MenuDatabaseUsecase>(() => MenuDatabaseUsecase());
  sl.registerLazySingleton<GameMode>(() => GameMode());
  sl.registerLazySingleton<GlossaryRank>(() => GlossaryRank());
  sl.registerLazySingleton<GlossarySpeciality>(() => GlossarySpeciality());

  //provider
  sl.registerFactory<RedeemCodeProvider>(
      () => RedeemCodeProvider(getRedeemCode: sl()));
  sl.registerFactory<NewsUpdateProvider>(
      () => NewsUpdateProvider(getNewsUpdate: sl()));
  sl.registerFactory<EventProvider>(() => EventProvider(getEvent: sl()));
  sl.registerFactory<CharacterBannerProvider>(
      () => CharacterBannerProvider(getCharacterBanner: sl()));
  sl.registerFactory<EquipmentBannerProvider>(
      () => EquipmentBannerProvider(getEquipmentBanner: sl()));
  sl.registerFactory<ElfBannerProvider>(
      () => ElfBannerProvider(getElfBanner: sl()));
  sl.registerFactory<BattlesuitProvider>(
      () => BattlesuitProvider(getCharacter: sl()));
  sl.registerFactory<ElfProvider>(() => ElfProvider(getElf: sl()));
  sl.registerFactory<StigmataProvider>(
      () => StigmataProvider(getStigmata: sl()));
  sl.registerFactory<WeaponProvider>(() => WeaponProvider(getWeapon: sl()));
  sl.registerFactory<OutfitProvider>(() => OutfitProvider(getOutfit: sl()));
  sl.registerFactory<TierListProvider>(
      () => TierListProvider(getTierList: sl()));
  sl.registerFactory<ChangelogProvider>(
      () => ChangelogProvider(getChangelog: sl()));
  sl.registerFactory<BeginnerGuideProvider>(
      () => BeginnerGuideProvider(getBeginnerGuide: sl()));
  sl.registerFactory<GeneralGuideProvider>(
      () => GeneralGuideProvider(getGeneralGuide: sl()));

  //local
  sl.registerFactory<AboutGameProvider>(() => AboutGameProvider(
      aboutContentUsecase: sl(),
      officialLinkSeaUsecase: sl(),
      officialLinkGlobalUsecase: sl()));
  sl.registerFactory<SidebarProvider>(() => SidebarProvider(sidebarMenu: sl()));
  sl.registerFactory<DatabaseProvider>(
      () => DatabaseProvider(menuDatabaseUsecase: sl()));
  sl.registerFactory<GlossaryProvider>(() => GlossaryProvider(
      gameMode: sl(), glossaryRank: sl(), glossarySpeciality: sl()));

  //other 3rd party
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
