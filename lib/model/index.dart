import 'package:json_annotation/json_annotation.dart';
part 'index.g.dart';

@JsonSerializable()
class MovieModel {
  int id;
  String imgUrl;
  int? publishedYear, durationMin;
  String? type, description;

  MovieModel(
      {required this.id,
      required this.imgUrl,
      this.description,
      this.durationMin,
      this.publishedYear,
      this.type});
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
