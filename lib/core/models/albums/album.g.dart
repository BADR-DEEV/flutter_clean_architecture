// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Album> _$albumSerializer = new _$AlbumSerializer();

class _$AlbumSerializer implements StructuredSerializer<Album> {
  @override
  final Iterable<Type> types = const [Album, _$Album];
  @override
  final String wireName = 'Album';

  @override
  Iterable<Object?> serialize(Serializers serializers, Album object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Album deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AlbumBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Album extends Album {
  @override
  final int? id;
  @override
  final String? title;

  factory _$Album([void Function(AlbumBuilder)? updates]) =>
      (new AlbumBuilder()..update(updates))._build();

  _$Album._({this.id, this.title}) : super._();

  @override
  Album rebuild(void Function(AlbumBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AlbumBuilder toBuilder() => new AlbumBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Album && id == other.id && title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Album')
          ..add('id', id)
          ..add('title', title))
        .toString();
  }
}

class AlbumBuilder implements Builder<Album, AlbumBuilder> {
  _$Album? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  AlbumBuilder();

  AlbumBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Album other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Album;
  }

  @override
  void update(void Function(AlbumBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Album build() => _build();

  _$Album _build() {
    final _$result = _$v ?? new _$Album._(id: id, title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
