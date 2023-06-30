// Mocks generated by Mockito 5.4.0 from annotations
// in honkai_assistance/test/unit%20test/data/datasources/remote_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:honkai_assistance/data/datasources/remote_data_source.dart'
    as _i3;
import 'package:honkai_assistance/data/models/changelog_model.dart' as _i17;
import 'package:honkai_assistance/data/models/character_banner_model.dart'
    as _i8;
import 'package:honkai_assistance/data/models/character_model.dart' as _i11;
import 'package:honkai_assistance/data/models/elf_banner_model.dart' as _i10;
import 'package:honkai_assistance/data/models/elf_model.dart' as _i12;
import 'package:honkai_assistance/data/models/equipment_banner_model.dart'
    as _i9;
import 'package:honkai_assistance/data/models/event_model.dart' as _i7;
import 'package:honkai_assistance/data/models/guide_model.dart' as _i18;
import 'package:honkai_assistance/data/models/news_update_model.dart' as _i6;
import 'package:honkai_assistance/data/models/outfit_model.dart' as _i15;
import 'package:honkai_assistance/data/models/redeem_code_model.dart' as _i5;
import 'package:honkai_assistance/data/models/stigmata_model.dart' as _i13;
import 'package:honkai_assistance/data/models/tier_list_model.dart' as _i16;
import 'package:honkai_assistance/data/models/weapon_model.dart' as _i14;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFirebaseFirestore_0 extends _i1.SmartFake
    implements _i2.FirebaseFirestore {
  _FakeFirebaseFirestore_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSourceImpl extends _i1.Mock
    implements _i3.RemoteDataSourceImpl {
  MockRemoteDataSourceImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.FirebaseFirestore get firestoreService => (super.noSuchMethod(
        Invocation.getter(#firestoreService),
        returnValue: _FakeFirebaseFirestore_0(
          this,
          Invocation.getter(#firestoreService),
        ),
      ) as _i2.FirebaseFirestore);
  @override
  _i4.Future<List<_i5.RedeemCodeModel>> getRedeemCode() => (super.noSuchMethod(
        Invocation.method(
          #getRedeemCode,
          [],
        ),
        returnValue: _i4.Future<List<_i5.RedeemCodeModel>>.value(
            <_i5.RedeemCodeModel>[]),
      ) as _i4.Future<List<_i5.RedeemCodeModel>>);
  @override
  _i4.Future<List<_i6.NewsUpdateModel>> getNewsUpdate() => (super.noSuchMethod(
        Invocation.method(
          #getNewsUpdate,
          [],
        ),
        returnValue: _i4.Future<List<_i6.NewsUpdateModel>>.value(
            <_i6.NewsUpdateModel>[]),
      ) as _i4.Future<List<_i6.NewsUpdateModel>>);
  @override
  _i4.Future<List<_i7.EventModel>> getEvent() => (super.noSuchMethod(
        Invocation.method(
          #getEvent,
          [],
        ),
        returnValue: _i4.Future<List<_i7.EventModel>>.value(<_i7.EventModel>[]),
      ) as _i4.Future<List<_i7.EventModel>>);
  @override
  _i4.Future<List<_i8.CharacterBannerModel>> getCharacterBanner() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacterBanner,
          [],
        ),
        returnValue: _i4.Future<List<_i8.CharacterBannerModel>>.value(
            <_i8.CharacterBannerModel>[]),
      ) as _i4.Future<List<_i8.CharacterBannerModel>>);
  @override
  _i4.Future<List<_i9.EquipmentBannerModel>> getEquipmentBanner() =>
      (super.noSuchMethod(
        Invocation.method(
          #getEquipmentBanner,
          [],
        ),
        returnValue: _i4.Future<List<_i9.EquipmentBannerModel>>.value(
            <_i9.EquipmentBannerModel>[]),
      ) as _i4.Future<List<_i9.EquipmentBannerModel>>);
  @override
  _i4.Future<List<_i10.ElfBannerModel>> getElfBanner() => (super.noSuchMethod(
        Invocation.method(
          #getElfBanner,
          [],
        ),
        returnValue: _i4.Future<List<_i10.ElfBannerModel>>.value(
            <_i10.ElfBannerModel>[]),
      ) as _i4.Future<List<_i10.ElfBannerModel>>);
  @override
  _i4.Future<List<_i11.CharacterModel>> getCharacter() => (super.noSuchMethod(
        Invocation.method(
          #getCharacter,
          [],
        ),
        returnValue: _i4.Future<List<_i11.CharacterModel>>.value(
            <_i11.CharacterModel>[]),
      ) as _i4.Future<List<_i11.CharacterModel>>);
  @override
  _i4.Future<List<_i12.ElfModel>> getElf() => (super.noSuchMethod(
        Invocation.method(
          #getElf,
          [],
        ),
        returnValue: _i4.Future<List<_i12.ElfModel>>.value(<_i12.ElfModel>[]),
      ) as _i4.Future<List<_i12.ElfModel>>);
  @override
  _i4.Future<List<_i13.StigmataModel>> getStigmata() => (super.noSuchMethod(
        Invocation.method(
          #getStigmata,
          [],
        ),
        returnValue:
            _i4.Future<List<_i13.StigmataModel>>.value(<_i13.StigmataModel>[]),
      ) as _i4.Future<List<_i13.StigmataModel>>);
  @override
  _i4.Future<List<_i14.WeaponModel>> getWeapon() => (super.noSuchMethod(
        Invocation.method(
          #getWeapon,
          [],
        ),
        returnValue:
            _i4.Future<List<_i14.WeaponModel>>.value(<_i14.WeaponModel>[]),
      ) as _i4.Future<List<_i14.WeaponModel>>);
  @override
  _i4.Future<List<_i15.OutfitModel>> getOutfit() => (super.noSuchMethod(
        Invocation.method(
          #getOutfit,
          [],
        ),
        returnValue:
            _i4.Future<List<_i15.OutfitModel>>.value(<_i15.OutfitModel>[]),
      ) as _i4.Future<List<_i15.OutfitModel>>);
  @override
  _i4.Future<List<_i16.TierListModel>> getTierList() => (super.noSuchMethod(
        Invocation.method(
          #getTierList,
          [],
        ),
        returnValue:
            _i4.Future<List<_i16.TierListModel>>.value(<_i16.TierListModel>[]),
      ) as _i4.Future<List<_i16.TierListModel>>);
  @override
  _i4.Future<List<_i17.ChangelogModel>> getChangelog() => (super.noSuchMethod(
        Invocation.method(
          #getChangelog,
          [],
        ),
        returnValue: _i4.Future<List<_i17.ChangelogModel>>.value(
            <_i17.ChangelogModel>[]),
      ) as _i4.Future<List<_i17.ChangelogModel>>);
  @override
  _i4.Future<List<_i18.GuideModel>> getBeginnerGuide() => (super.noSuchMethod(
        Invocation.method(
          #getBeginnerGuide,
          [],
        ),
        returnValue:
            _i4.Future<List<_i18.GuideModel>>.value(<_i18.GuideModel>[]),
      ) as _i4.Future<List<_i18.GuideModel>>);
  @override
  _i4.Future<List<_i18.GuideModel>> getGeneralGuide() => (super.noSuchMethod(
        Invocation.method(
          #getGeneralGuide,
          [],
        ),
        returnValue:
            _i4.Future<List<_i18.GuideModel>>.value(<_i18.GuideModel>[]),
      ) as _i4.Future<List<_i18.GuideModel>>);
}
