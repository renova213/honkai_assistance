import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:honkai_assistance/data/datasources/remote_data_source.dart';
import 'package:honkai_assistance/data/repositories/home_repository_impl.dart';
import 'package:honkai_assistance/domain/repositories/character_repository.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';
import 'package:honkai_assistance/domain/usecases/get_character.dart';
import 'package:honkai_assistance/domain/usecases/get_character_banner.dart';
import 'package:honkai_assistance/domain/usecases/get_elf_banner.dart';
import 'package:honkai_assistance/domain/usecases/get_equipment_banner.dart';
import 'package:honkai_assistance/domain/usecases/get_event.dart';
import 'package:honkai_assistance/domain/usecases/get_news_update.dart';
import 'package:honkai_assistance/domain/usecases/get_redeem_code.dart';
import 'package:honkai_assistance/presentation/providers/character_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/character_provider.dart';
import 'package:honkai_assistance/presentation/providers/elf_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/equipment_banner_provider.dart';
import 'package:honkai_assistance/presentation/providers/event_provider.dart';
import 'package:honkai_assistance/presentation/providers/news_update_provider.dart';
import 'package:honkai_assistance/presentation/providers/redeem_code_provider.dart';

import 'data/repositories/character_repository_impl.dart';

final sl = GetIt.instance;

void setUp() {
  //datasource
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(firestoreService: sl()));

  //repository
  sl.registerLazySingleton<HomeRepository>(
      () => RepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(remoteDataSource: sl()));

  //usecase
  sl.registerLazySingleton<GetRedeemCode>(
      () => GetRedeemCode(homeRepository: sl()));
  sl.registerLazySingleton<GetNewsUpdate>(
      () => GetNewsUpdate(homeRepository: sl()));
  sl.registerLazySingleton<GetEvent>(() => GetEvent(homeRepository: sl()));
  sl.registerLazySingleton<GetCharacterBanner>(
      () => GetCharacterBanner(homeRepository: sl()));
  sl.registerLazySingleton<GetEquipmentBanner>(
      () => GetEquipmentBanner(homeRepository: sl()));
  sl.registerLazySingleton<GetElfBanner>(
      () => GetElfBanner(homeRepository: sl()));
  sl.registerLazySingleton<GetCharacter>(
      () => GetCharacter(characterRepository: sl()));

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

  sl.registerFactory<CharacterProvider>(
      () => CharacterProvider(getCharacter: sl()));

  //other 3rd party
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
