import 'package:json_annotation/json_annotation.dart';
import 'info_movie_model.dart';

part 'info_movie_response_model.g.dart';

@JsonSerializable()
class InfoMovieResponseModel {
  InfoMovieResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @JsonKey(name: 'page')
  final int? page;

  @JsonKey(name: 'results', defaultValue: [])
  final List<InfoMovieModel>? results;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  factory InfoMovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InfoMovieResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoMovieResponseModelToJson(this);
}
