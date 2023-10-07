import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:imdb_apk/data/model/movie.dart';

abstract class ImovieDatasource {
  Future<List<Movie>> getMovies();
}

class MovieRemoteDatasource extends ImovieDatasource {
  final Dio _dio;
  MovieRemoteDatasource(this._dio);
  @override
  Future<List<Movie>> getMovies() async {
    try {
      var response = await _dio.get('?apikey=713b564a&s=Batman');

      return response.data['Search']
          .map<Movie>((jsonObject) => Movie.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw Text(
        ex.message.toString(),
      );
    }
  }
}
