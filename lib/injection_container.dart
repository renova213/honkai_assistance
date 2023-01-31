import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:honkai_assistance/data/datasources/remote_data_source.dart';
import 'package:honkai_assistance/data/repositories/home_repository_impl.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';
import 'package:honkai_assistance/domain/usecases/get_character.dart';
import 'package:honkai_assistance/domain/usecases/get_character_banner.dart';
import 'package:honkai_assistance/domain/usecases/get_elf_banner.dart';
import 'package:honkai_assistance/domain/usecases/get_equipment_banner.dart';
import 'package:honkai_assistance/domain/usecases/get_event.dart';
import 'package:honkai_assistance/domain/usecases/get_news_update.dart';
import 'package:honkai_assistance/domain/usecases/get_redeem_code.dart';
import 'package:honkai_assistance/presentation/providers/character_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/battlesuit_provider.dart';
import 'package:honkai_assistance/presentation/providers/elf_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/equipment_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/event_provider.dart';
import 'package:honkai_assistance/presentation/providers/news_update_provider.dart';
import 'package:honkai_assistance/presentation/providers/redeem_code_provider.dart';

final sl = GetIt.instance;

void setUp() {
  //datasource
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(firestoreService: sl()));

  //repository
  sl.registerLazySingleton<RemoteRepository>(
      () => RemoteRepositoryImpl(remoteDataSource: sl()));

  //usecase
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

  //other 3rd party
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
