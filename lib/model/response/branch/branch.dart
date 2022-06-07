
import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable()
class Branch {
  String? code;
  String? creating_datetime;
  String? foreign_name;
  int? number;
  String? creator_user_guide;
  String? last_edit_datetime;
  String? guide;
  String? name;
  String? editor_user_guide;
  Branch({
    this.code,
    this.creating_datetime,
    this.foreign_name,
    this.number,
    this.creator_user_guide,
    this.last_edit_datetime,
    this.guide,
    this.name,
    this.editor_user_guide,
  });

    factory Branch.fromJson(Map<String,dynamic> data) => _$BranchFromJson(data);

  Map<String,dynamic> toJson() => _$BranchToJson(this);
}
