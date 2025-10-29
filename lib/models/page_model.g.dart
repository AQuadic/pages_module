// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageModel _$PageModelFromJson(Map<String, dynamic> json) => PageModel()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] == null ? null : LangModel.fromJson(json['title'])
  ..description = json['description'] == null
      ? null
      : LangModel.fromJson(json['description'])
  ..show = (json['show'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..image = _$JsonConverterFromJson<Map<String, dynamic>, ResponsiveImageModel>(
    json['image'],
    const ResponsiveImageModelJsonConv().fromJson,
  );

Map<String, dynamic> _$PageModelToJson(PageModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title?.toJson(),
  'description': instance.description?.toJson(),
  'show': instance.show,
  'image': _$JsonConverterToJson<Map<String, dynamic>, ResponsiveImageModel>(
    instance.image,
    const ResponsiveImageModelJsonConv().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
