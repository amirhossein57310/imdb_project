import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/detail_movie.dart';

abstract class ImovieDetailDatasource {
  Future<DetailMovie> getDetail(String id);
}

class MovieDetailRemoteDatasource extends ImovieDetailDatasource {
  final Dio _dio;
  MovieDetailRemoteDatasource(this._dio);

  @override
  Future<DetailMovie> getDetail(String id) async {
    try {
      final response = await _dio.get(
        '?apikey=713b564a&i=$id',
      );

      return DetailMovie.fromJson(
          response.data); // Map response data to a single DetailMovie object
    } on DioException catch (ex) {
      throw Text(
        ex.message.toString(),
      );
    }
  }
}
