// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthException<T> {
  T get exceptionValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T exceptionValue) invalidEmail,
    required TResult Function(T exceptionValue) shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T exceptionValue)? invalidEmail,
    TResult? Function(T exceptionValue)? shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T exceptionValue)? invalidEmail,
    TResult Function(T exceptionValue)? shortPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(ShortPassword<T> value)? shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthExceptionCopyWith<T, AuthException<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthExceptionCopyWith<T, $Res> {
  factory $AuthExceptionCopyWith(
          AuthException<T> value, $Res Function(AuthException<T>) then) =
      _$AuthExceptionCopyWithImpl<T, $Res, AuthException<T>>;
  @useResult
  $Res call({T exceptionValue});
}

/// @nodoc
class _$AuthExceptionCopyWithImpl<T, $Res, $Val extends AuthException<T>>
    implements $AuthExceptionCopyWith<T, $Res> {
  _$AuthExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exceptionValue = freezed,
  }) {
    return _then(_value.copyWith(
      exceptionValue: freezed == exceptionValue
          ? _value.exceptionValue
          : exceptionValue // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvalidEmailCopyWith<T, $Res>
    implements $AuthExceptionCopyWith<T, $Res> {
  factory _$$InvalidEmailCopyWith(
          _$InvalidEmail<T> value, $Res Function(_$InvalidEmail<T>) then) =
      __$$InvalidEmailCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T exceptionValue});
}

/// @nodoc
class __$$InvalidEmailCopyWithImpl<T, $Res>
    extends _$AuthExceptionCopyWithImpl<T, $Res, _$InvalidEmail<T>>
    implements _$$InvalidEmailCopyWith<T, $Res> {
  __$$InvalidEmailCopyWithImpl(
      _$InvalidEmail<T> _value, $Res Function(_$InvalidEmail<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exceptionValue = freezed,
  }) {
    return _then(_$InvalidEmail<T>(
      exceptionValue: freezed == exceptionValue
          ? _value.exceptionValue
          : exceptionValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({required this.exceptionValue});

  @override
  final T exceptionValue;

  @override
  String toString() {
    return 'AuthException<$T>.invalidEmail(exceptionValue: $exceptionValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidEmail<T> &&
            const DeepCollectionEquality()
                .equals(other.exceptionValue, exceptionValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exceptionValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      __$$InvalidEmailCopyWithImpl<T, _$InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T exceptionValue) invalidEmail,
    required TResult Function(T exceptionValue) shortPassword,
  }) {
    return invalidEmail(exceptionValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T exceptionValue)? invalidEmail,
    TResult? Function(T exceptionValue)? shortPassword,
  }) {
    return invalidEmail?.call(exceptionValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T exceptionValue)? invalidEmail,
    TResult Function(T exceptionValue)? shortPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(exceptionValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(ShortPassword<T> value)? shortPassword,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements AuthException<T> {
  const factory InvalidEmail({required final T exceptionValue}) =
      _$InvalidEmail<T>;

  @override
  T get exceptionValue;
  @override
  @JsonKey(ignore: true)
  _$$InvalidEmailCopyWith<T, _$InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShortPasswordCopyWith<T, $Res>
    implements $AuthExceptionCopyWith<T, $Res> {
  factory _$$ShortPasswordCopyWith(
          _$ShortPassword<T> value, $Res Function(_$ShortPassword<T>) then) =
      __$$ShortPasswordCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T exceptionValue});
}

/// @nodoc
class __$$ShortPasswordCopyWithImpl<T, $Res>
    extends _$AuthExceptionCopyWithImpl<T, $Res, _$ShortPassword<T>>
    implements _$$ShortPasswordCopyWith<T, $Res> {
  __$$ShortPasswordCopyWithImpl(
      _$ShortPassword<T> _value, $Res Function(_$ShortPassword<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exceptionValue = freezed,
  }) {
    return _then(_$ShortPassword<T>(
      exceptionValue: freezed == exceptionValue
          ? _value.exceptionValue
          : exceptionValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({required this.exceptionValue});

  @override
  final T exceptionValue;

  @override
  String toString() {
    return 'AuthException<$T>.shortPassword(exceptionValue: $exceptionValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShortPassword<T> &&
            const DeepCollectionEquality()
                .equals(other.exceptionValue, exceptionValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exceptionValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShortPasswordCopyWith<T, _$ShortPassword<T>> get copyWith =>
      __$$ShortPasswordCopyWithImpl<T, _$ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T exceptionValue) invalidEmail,
    required TResult Function(T exceptionValue) shortPassword,
  }) {
    return shortPassword(exceptionValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T exceptionValue)? invalidEmail,
    TResult? Function(T exceptionValue)? shortPassword,
  }) {
    return shortPassword?.call(exceptionValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T exceptionValue)? invalidEmail,
    TResult Function(T exceptionValue)? shortPassword,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(exceptionValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidEmail<T> value)? invalidEmail,
    TResult? Function(ShortPassword<T> value)? shortPassword,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements AuthException<T> {
  const factory ShortPassword({required final T exceptionValue}) =
      _$ShortPassword<T>;

  @override
  T get exceptionValue;
  @override
  @JsonKey(ignore: true)
  _$$ShortPasswordCopyWith<T, _$ShortPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ValueException<T> {
  T get exceptionValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T exceptionValue) serverException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T exceptionValue)? serverException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T exceptionValue)? serverException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(serverException<T> value) serverException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(serverException<T> value)? serverException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(serverException<T> value)? serverException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueExceptionCopyWith<T, ValueException<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueExceptionCopyWith<T, $Res> {
  factory $ValueExceptionCopyWith(
          ValueException<T> value, $Res Function(ValueException<T>) then) =
      _$ValueExceptionCopyWithImpl<T, $Res, ValueException<T>>;
  @useResult
  $Res call({T exceptionValue});
}

/// @nodoc
class _$ValueExceptionCopyWithImpl<T, $Res, $Val extends ValueException<T>>
    implements $ValueExceptionCopyWith<T, $Res> {
  _$ValueExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exceptionValue = freezed,
  }) {
    return _then(_value.copyWith(
      exceptionValue: freezed == exceptionValue
          ? _value.exceptionValue
          : exceptionValue // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$serverExceptionCopyWith<T, $Res>
    implements $ValueExceptionCopyWith<T, $Res> {
  factory _$$serverExceptionCopyWith(_$serverException<T> value,
          $Res Function(_$serverException<T>) then) =
      __$$serverExceptionCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T exceptionValue});
}

/// @nodoc
class __$$serverExceptionCopyWithImpl<T, $Res>
    extends _$ValueExceptionCopyWithImpl<T, $Res, _$serverException<T>>
    implements _$$serverExceptionCopyWith<T, $Res> {
  __$$serverExceptionCopyWithImpl(
      _$serverException<T> _value, $Res Function(_$serverException<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exceptionValue = freezed,
  }) {
    return _then(_$serverException<T>(
      exceptionValue: freezed == exceptionValue
          ? _value.exceptionValue
          : exceptionValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$serverException<T> implements serverException<T> {
  const _$serverException({required this.exceptionValue});

  @override
  final T exceptionValue;

  @override
  String toString() {
    return 'ValueException<$T>.serverException(exceptionValue: $exceptionValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$serverException<T> &&
            const DeepCollectionEquality()
                .equals(other.exceptionValue, exceptionValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exceptionValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$serverExceptionCopyWith<T, _$serverException<T>> get copyWith =>
      __$$serverExceptionCopyWithImpl<T, _$serverException<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T exceptionValue) serverException,
  }) {
    return serverException(exceptionValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T exceptionValue)? serverException,
  }) {
    return serverException?.call(exceptionValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T exceptionValue)? serverException,
    required TResult orElse(),
  }) {
    if (serverException != null) {
      return serverException(exceptionValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(serverException<T> value) serverException,
  }) {
    return serverException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(serverException<T> value)? serverException,
  }) {
    return serverException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(serverException<T> value)? serverException,
    required TResult orElse(),
  }) {
    if (serverException != null) {
      return serverException(this);
    }
    return orElse();
  }
}

abstract class serverException<T> implements ValueException<T> {
  const factory serverException({required final T exceptionValue}) =
      _$serverException<T>;

  @override
  T get exceptionValue;
  @override
  @JsonKey(ignore: true)
  _$$serverExceptionCopyWith<T, _$serverException<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
