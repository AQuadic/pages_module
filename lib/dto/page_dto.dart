import 'package:aq_tools/aq_tools.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:pages_module/dto/responsive_image_dto.dart';


part 'page_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PageDto {
  int? id;
  LangModel? title;
  LangModel? description;
  List<String>? show;
  @ResponsiveImageModelJsonConv()
  ResponsiveImageModel? image;
  PageDto();

  factory PageDto.fromJson(Map<String, dynamic> json) {
    return _$PageDtoFromJson(json);
  }
  Map<String, dynamic> toJson() => _$PageDtoToJson(this);
}
