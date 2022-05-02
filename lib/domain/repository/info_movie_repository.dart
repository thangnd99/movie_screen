import 'package:movie_screen/data/network/api_constant.dart';
import 'package:movie_screen/data/network/method_type.dart';
import 'package:movie_screen/data/network/request.dart';
import 'package:movie_screen/data/storage/storage_constant.dart';

import '../model/info_movie_model/info_movie_response_model.dart';

class InfoMovieRepository {
  final Request _request = Request();

  Future<InfoMovieResponseModel> getListMovie({int page = 1}) async {
    try {
      final response = await _request.requestApi(
        method: MethodType.get,
        url: ApiConstants.apiMovie,
        params: {
          'api_key': StorageConstant.apiKey,
          'page': page,
        },
      );
      return InfoMovieResponseModel.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      return Future.error(e);
    }
  }
}
