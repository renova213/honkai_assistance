import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:honkai_assistance/data/datasources/remote_data_source.dart';
import 'package:honkai_assistance/data/repositories/remote_repository_impl.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';
import 'package:honkai_assistance/domain/usecases/get_chat.dart';
import 'package:honkai_assistance/domain/usecases/post_chat.dart';
import 'package:honkai_assistance/domain/usecases/post_google_sign_in.dart';
import 'package:honkai_assistance/presentation/provider/auth_provider.dart';
import 'package:honkai_assistance/presentation/provider/chat_provider.dart';
import 'package:honkai_assistance/presentation/provider/top_up_provider.dart';

import 'domain/usecases/get_beginner_guide.dart';
import 'domain/usecases/get_changelog.dart';
import 'domain/usecases/get_character.dart';
import 'domain/usecases/get_character_banner.dart';
import 'domain/usecases/get_elf.dart';
import 'domain/usecases/get_elf_banner.dart';
import 'domain/usecases/get_equipment_banner.dart';
import 'domain/usecases/get_event.dart';
import 'domain/usecases/get_general_guide.dart';
import 'domain/usecases/get_news_update.dart';
import 'domain/usecases/get_outfit.dart';
import 'domain/usecases/get_redeem_code.dart';
import 'domain/usecases/get_stigmata.dart';
import 'domain/usecases/get_tier_list.dart';
import 'domain/usecases/get_weapon.dart';
import 'presentation/provider/battlesuit_provider.dart';
import 'presentation/provider/beginner_guide_provider.dart';
import 'presentation/provider/changelog_provider.dart';
import 'presentation/provider/character_banner_provider.dart';
import 'presentation/provider/elf_banner_provider.dart';
import 'presentation/provider/elf_provider.dart';
import 'presentation/provider/equipment_banner_provider.dart';
import 'presentation/provider/event_provider.dart';
import 'presentation/provider/general_guide_provider.dart';
import 'presentation/provider/news_update_provider.dart';
import 'presentation/provider/outfit_provider.dart';
import 'presentation/provider/redeem_code_provider.dart';
import 'presentation/provider/stigmata_provider.dart';
import 'presentation/provider/tier_list_provider.dart';
import 'presentation/provider/weapon_provider.dart';

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
  sl.registerLazySingleton<PostGoogleSignIn>(
      () => PostGoogleSignIn(remoteRepository: sl()));
  sl.registerLazySingleton<GetChat>(() => GetChat(remoteRepository: sl()));
  sl.registerLazySingleton<PostChat>(() => PostChat(remoteRepository: sl()));

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
  sl.registerFactory<AuthProvider>(() => AuthProvider(postGoogleSignIn: sl()));
  sl.registerFactory<ChatProvider>(
      () => ChatProvider(getChat: sl(), postChat: sl()));
  sl.registerFactory<TopUpProvider>(() => TopUpProvider());

  //other 3rd party
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
