// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
      code: json['code'] as String?,
      creating_datetime: json['creating_datetime'] as String?,
      foreign_name: json['foreign_name'] as String?,
      number: json['number'] as int?,
      creator_user_guide: json['creator_user_guide'] as String?,
      last_edit_datetime: json['last_edit_datetime'] as String?,
      guide: json['guide'] as String?,
      name: json['name'] as String?,
      editor_user_guide: json['editor_user_guide'] as String?,
    );

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
      'code': instance.code,
      'creating_datetime': instance.creating_datetime,
      'foreign_name': instance.foreign_name,
      'number': instance.number,
      'creator_user_guide': instance.creator_user_guide,
      'last_edit_datetime': instance.last_edit_datetime,
      'guide': instance.guide,
      'name': instance.name,
      'editor_user_guide': instance.editor_user_guide,
    };
