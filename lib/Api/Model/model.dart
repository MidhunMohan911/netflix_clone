import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class DataModel {
  // create variables
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'poster_path')
  String? image;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'release_date')
  String? releasedate;

  //constructor
  DataModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.overview,
      required this.releasedate});
}
