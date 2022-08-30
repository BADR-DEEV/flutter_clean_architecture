import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '/core/models/serializers.dart';

part 'album.g.dart';

/// An example Album model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Album implements Built<Album, AlbumBuilder> {
  int? get id;

  String? get title;

  Album._();

  String toJson() {
    return json.encode(serializers.serializeWith(Album.serializer, this));
  }

  factory Album.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Album.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Album.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Album.serializer,
      map,
    )!;
  }

  static Serializer<Album> get serializer => _$albumSerializer;

  factory Album([void Function(AlbumBuilder)? updates]) = _$Album;
}
