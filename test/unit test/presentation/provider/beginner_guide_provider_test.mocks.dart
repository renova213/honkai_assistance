// Mocks generated by Mockito 5.4.0 from annotations
// in honkai_assistance/test/unit%20test/presentation/provider/beginner_guide_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:honkai_assistance/common/error/error.dart' as _i6;
import 'package:honkai_assistance/domain/entities/guide_entity.dart' as _i7;
import 'package:honkai_assistance/domain/repositories/remote_repository.dart'
    as _i2;
import 'package:honkai_assistance/domain/usecases/get_beginner_guide.dart'
    as _i4;
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

class _FakeRemoteRepository_0 extends _i1.SmartFake
    implements _i2.RemoteRepository {
  _FakeRemoteRepository_0(
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

/// A class which mocks [GetBeginnerGuide].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetBeginnerGuide extends _i1.Mock implements _i4.GetBeginnerGuide {
  MockGetBeginnerGuide() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RemoteRepository get remoteRepository => (super.noSuchMethod(
        Invocation.getter(#remoteRepository),
        returnValue: _FakeRemoteRepository_0(
          this,
          Invocation.getter(#remoteRepository),
        ),
      ) as _i2.RemoteRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.GuideEntity>>> call() =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.GuideEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.GuideEntity>>(
          this,
          Invocation.method(
            #call,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.GuideEntity>>>);
}
