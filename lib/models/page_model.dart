import 'package:aq_tools/aq_tools.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pages_module/models/responsive_image_model.dart';

part 'page_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PageModel {
  int? id;
  LangModel? title;
  LangModel? description;
  List<String>? show;
  @ResponsiveImageModelJsonConv()
  ResponsiveImageModel? image;

  PageModel();

  factory PageModel.fromJson(Map<String, dynamic> json) {
    return _$PageModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$PageModelToJson(this);
}
