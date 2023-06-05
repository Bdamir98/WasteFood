// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure<T> {
  T get failureValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failureValue) invalidEmail,
    required TResult Function(T failureValue) emailAlreadyTaken,
    required TResult Function(T failureValue) shortPassword,
    required TResult Function(T failureValue) serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failureValue)? invalidEmail,
    TResult? Function(T failureValue)? emailAlreadyTaken,
    TResult? Function(T failureValue)? shortPassword,
    TResult? Function(T failureValue)? serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failureValue)? invalidEmail,
    TResult Function(T failureValue)? emailAlreadyTaken,
    TResult Function(T failureValue)? shortPassword,
    TResult Function(T failureValue)? serverFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyTaken<T> value) emailAlreadyTaken,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ServerFailure<T> value) serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyTaken<T> value)? emailAlreadyTaken,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ServerFailure<T> value)? serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyTaken<T> value)? emailAlreadyTaken,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ServerFailure<T> value)? serverFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<T, Failure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl<T, $Res, Failure<T>>;
  @useResult
  $Res call({T failureValue});
}

/// @nodoc
class _$FailureCopyWithImpl<T, $Res, $Val extends Failure<T>>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureValue = freezed,
  }) {
    return _then(_value.copyWith(
      failureValue: freezed == failureValue
          ? _value.failureValue
          : failureValue // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvalidEmailCopyWith<T, $Res>
    implements $FailureCopyWith<T, $Res> {
  factory _$$InvalidEmailCopyWith(
          _$InvalidEmail<T> value, $Res Function(_$InvalidEmail<T>) then) =
      __$$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failureValue});
}

/// @nodoc
class __$$InvalidEmailCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$InvalidEmail<T>>
    implements _$$InvalidEmailCopyWith<T, $Res> {
  __$$InvalidEmailCopyWithImpl(
      _$InvalidEmail<T> _value, $Res Function(_$InvalidEmail<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureValue = freezed,
  }) {
    return _then(_$InvalidEmail<T>(
      failureValue: freezed == failureValue
          ? _value.failureValue
          : failureValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({required this.failureValue});

  @override
  final T failureValue;

  @override
  String toString() {
    return 'Failure<$T>.invalidEmail(failureValue: $failureValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmail<T> &&
            const DeepCollectionEquality()
                .equals(other.failureValue, failureValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failureValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      __$$InvalidEmailCopyWithImpl<T, _$InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failureValue) invalidEmail,
    required TResult Function(T failureValue) emailAlreadyTaken,
    required TResult Function(T failureValue) shortPassword,
    required TResult Function(T failureValue) serverFailure,
  }) {
    return invalidEmail(failureValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failureValue)? invalidEmail,
    TResult? Function(T failureValue)? emailAlreadyTaken,
    TResult? Function(T failureValue)? shortPassword,
    TResult? Function(T failureValue)? serverFailure,
  }) {
    return invalidEmail?.call(failureValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failureValue)? invalidEmail,
    TResult Function(T failureValue)? emailAlreadyTaken,
    TResult Function(T failureValue)? shortPassword,
    TResult Function(T failureValue)? serverFailure,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failureValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyTaken<T> value) emailAlreadyTaken,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ServerFailure<T> value) serverFailure,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyTaken<T> value)? emailAlreadyTaken,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ServerFailure<T> value)? serverFailure,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyTaken<T> value)? emailAlreadyTaken,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ServerFailure<T> value)? serverFailure,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements Failure<T> {
  const factory InvalidEmail({required final T failureValue}) =
      _$InvalidEmail<T>;

  @override
  T get failureValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailAlreadyTakenCopyWith<T, $Res>
    implements $FailureCopyWith<T, $Res> {
  factory _$$EmailAlreadyTakenCopyWith(_$EmailAlreadyTaken<T> value,
          $Res Function(_$EmailAlreadyTaken<T>) then) =
      __$$EmailAlreadyTakenCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failureValue});
}

/// @nodoc
class __$$EmailAlreadyTakenCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$EmailAlreadyTaken<T>>
    implements _$$EmailAlreadyTakenCopyWith<T, $Res> {
  __$$EmailAlreadyTakenCopyWithImpl(_$EmailAlreadyTaken<T> _value,
      $Res Function(_$EmailAlreadyTaken<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureValue = freezed,
  }) {
    return _then(_$EmailAlreadyTaken<T>(
      failureValue: freezed == failureValue
          ? _value.failureValue
          : failureValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$EmailAlreadyTaken<T> implements EmailAlreadyTaken<T> {
  const _$EmailAlreadyTaken({required this.failureValue});

  @override
  final T failureValue;

  @override
  String toString() {
    return 'Failure<$T>.emailAlreadyTaken(failureValue: $failureValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAlreadyTaken<T> &&
            const DeepCollectionEquality()
                .equals(other.failureValue, failureValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failureValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailAlreadyTakenCopyWith<T, _$EmailAlreadyTaken<T>> get copyWith =>
      __$$EmailAlreadyTakenCopyWithImpl<T, _$EmailAlreadyTaken<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failureValue) invalidEmail,
    required TResult Function(T failureValue) emailAlreadyTaken,
    required TResult Function(T failureValue) shortPassword,
    required TResult Function(T failureValue) serverFailure,
  }) {
    return emailAlreadyTaken(failureValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failureValue)? invalidEmail,
    TResult? Function(T failureValue)? emailAlreadyTaken,
    TResult? Function(T failureValue)? shortPassword,
    TResult? Function(T failureValue)? serverFailure,
  }) {
    return emailAlreadyTaken?.call(failureValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failureValue)? invalidEmail,
    TResult Function(T failureValue)? emailAlreadyTaken,
    TResult Function(T failureValue)? shortPassword,
    TResult Function(T failureValue)? serverFailure,
    required TResult orElse(),
  }) {
    if (emailAlreadyTaken != null) {
      return emailAlreadyTaken(failureValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyTaken<T> value) emailAlreadyTaken,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ServerFailure<T> value) serverFailure,
  }) {
    return emailAlreadyTaken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyTaken<T> value)? emailAlreadyTaken,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ServerFailure<T> value)? serverFailure,
  }) {
    return emailAlreadyTaken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyTaken<T> value)? emailAlreadyTaken,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ServerFailure<T> value)? serverFailure,
    required TResult orElse(),
  }) {
    if (emailAlreadyTaken != null) {
      return emailAlreadyTaken(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyTaken<T> implements Failure<T> {
  const factory EmailAlreadyTaken({required final T failureValue}) =
      _$EmailAlreadyTaken<T>;

  @override
  T get failureValue;
  @override
  @JsonKey(ignore: true)
  _$$EmailAlreadyTakenCopyWith<T, _$EmailAlreadyTaken<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShortPasswordCopyWith<T, $Res>
    implements $FailureCopyWith<T, $Res> {
  factory _$$ShortPasswordCopyWith(
          _$ShortPassword<T> value, $Res Function(_$ShortPassword<T>) then) =
      __$$ShortPasswordCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failureValue});
}

/// @nodoc
class __$$ShortPasswordCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$ShortPassword<T>>
    implements _$$ShortPasswordCopyWith<T, $Res> {
  __$$ShortPasswordCopyWithImpl(
      _$ShortPassword<T> _value, $Res Function(_$ShortPassword<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureValue = freezed,
  }) {
    return _then(_$ShortPassword<T>(
      failureValue: freezed == failureValue
          ? _value.failureValue
          : failureValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({required this.failureValue});

  @override
  final T failureValue;

  @override
  String toString() {
    return 'Failure<$T>.shortPassword(failureValue: $failureValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortPassword<T> &&
            const DeepCollectionEquality()
                .equals(other.failureValue, failureValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failureValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShortPasswordCopyWith<T, _$ShortPassword<T>> get copyWith =>
      __$$ShortPasswordCopyWithImpl<T, _$ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failureValue) invalidEmail,
    required TResult Function(T failureValue) emailAlreadyTaken,
    required TResult Function(T failureValue) shortPassword,
    required TResult Function(T failureValue) serverFailure,
  }) {
    return shortPassword(failureValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failureValue)? invalidEmail,
    TResult? Function(T failureValue)? emailAlreadyTaken,
    TResult? Function(T failureValue)? shortPassword,
    TResult? Function(T failureValue)? serverFailure,
  }) {
    return shortPassword?.call(failureValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failureValue)? invalidEmail,
    TResult Function(T failureValue)? emailAlreadyTaken,
    TResult Function(T failureValue)? shortPassword,
    TResult Function(T failureValue)? serverFailure,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failureValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyTaken<T> value) emailAlreadyTaken,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ServerFailure<T> value) serverFailure,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyTaken<T> value)? emailAlreadyTaken,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ServerFailure<T> value)? serverFailure,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyTaken<T> value)? emailAlreadyTaken,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ServerFailure<T> value)? serverFailure,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements Failure<T> {
  const factory ShortPassword({required final T failureValue}) =
      _$ShortPassword<T>;

  @override
  T get failureValue;
  @override
  @JsonKey(ignore: true)
  _$$ShortPasswordCopyWith<T, _$ShortPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerFailureCopyWith<T, $Res>
    implements $FailureCopyWith<T, $Res> {
  factory _$$ServerFailureCopyWith(
          _$ServerFailure<T> value, $Res Function(_$ServerFailure<T>) then) =
      __$$ServerFailureCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T failureValue});
}

/// @nodoc
class __$$ServerFailureCopyWithImpl<T, $Res>
    extends _$FailureCopyWithImpl<T, $Res, _$ServerFailure<T>>
    implements _$$ServerFailureCopyWith<T, $Res> {
  __$$ServerFailureCopyWithImpl(
      _$ServerFailure<T> _value, $Res Function(_$ServerFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureValue = freezed,
  }) {
    return _then(_$ServerFailure<T>(
      failureValue: freezed == failureValue
          ? _value.failureValue
          : failureValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ServerFailure<T> implements ServerFailure<T> {
  const _$ServerFailure({required this.failureValue});

  @override
  final T failureValue;

  @override
  String toString() {
    return 'Failure<$T>.serverFailure(failureValue: $failureValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailure<T> &&
            const DeepCollectionEquality()
                .equals(other.failureValue, failureValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failureValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureCopyWith<T, _$ServerFailure<T>> get copyWith =>
      __$$ServerFailureCopyWithImpl<T, _$ServerFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failureValue) invalidEmail,
    required TResult Function(T failureValue) emailAlreadyTaken,
    required TResult Function(T failureValue) shortPassword,
    required TResult Function(T failureValue) serverFailure,
  }) {
    return serverFailure(failureValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T failureValue)? invalidEmail,
    TResult? Function(T failureValue)? emailAlreadyTaken,
    TResult? Function(T failureValue)? shortPassword,
    TResult? Function(T failureValue)? serverFailure,
  }) {
    return serverFailure?.call(failureValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failureValue)? invalidEmail,
    TResult Function(T failureValue)? emailAlreadyTaken,
    TResult Function(T failureValue)? shortPassword,
    TResult Function(T failureValue)? serverFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(failureValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmailAlreadyTaken<T> value) emailAlreadyTaken,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(ServerFailure<T> value) serverFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(EmailAlreadyTaken<T> value)? emailAlreadyTaken,
    TResult? Function(ShortPassword<T> value)? shortPassword,
    TResult? Function(ServerFailure<T> value)? serverFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmailAlreadyTaken<T> value)? emailAlreadyTaken,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(ServerFailure<T> value)? serverFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class ServerFailure<T> implements Failure<T> {
  const factory ServerFailure({required final T failureValue}) =
      _$ServerFailure<T>;

  @override
  T get failureValue;
  @override
  @JsonKey(ignore: true)
  _$$ServerFailureCopyWith<T, _$ServerFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
