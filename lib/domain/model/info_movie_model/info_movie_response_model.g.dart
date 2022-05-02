// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_movie_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoMovieResponseModel _$InfoMovieResponseModelFromJson(
        Map<String, dynamic> json) =>
    InfoMovieResponseModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => InfoMovieModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$InfoMovieResponseModelToJson(
        InfoMovieResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
