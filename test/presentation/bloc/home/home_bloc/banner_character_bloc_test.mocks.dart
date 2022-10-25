// Mocks generated by Mockito 5.3.2 from annotations
// in honkai_lab/test/presentation/bloc/home/home_bloc/banner_character_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:honkai_lab/common/errors/failure.dart' as _i6;
import 'package:honkai_lab/domain/entities/banner_character.dart' as _i7;
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart'
    as _i2;
import 'package:honkai_lab/domain/usecases/get_banner_character.dart' as _i4;
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

class _FakeHonkaiLabRepositories_0 extends _i1.SmartFake
    implements _i2.HonkaiLabRepositories {
  _FakeHonkaiLabRepositories_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetBannerCharacter].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetBannerCharacter extends _i1.Mock
    implements _i4.GetBannerCharacter {
  MockGetBannerCharacter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HonkaiLabRepositories get repositories => (super.noSuchMethod(
        Invocation.getter(#repositories),
        returnValue: _FakeHonkaiLabRepositories_0(
          this,
          Invocation.getter(#repositories),
        ),
      ) as _i2.HonkaiLabRepositories);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.BannerCharacter>>> call(
          String? collectionName) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [collectionName],
        ),
        returnValue: _i5.Future<
                _i3.Either<_i6.Failure, List<_i7.BannerCharacter>>>.value(
            _FakeEither_1<_i6.Failure, List<_i7.BannerCharacter>>(
          this,
          Invocation.method(
            #call,
            [collectionName],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.BannerCharacter>>>);
}
