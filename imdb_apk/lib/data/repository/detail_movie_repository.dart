import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:imdb_apk/data/model/detail_movie.dart';

import '../datasource/detail_movie_datasource.dart';

abstract class ImovieDetailRepository {
  Future<Either<String, DetailMovie>> getDetail(String id);
}

class MovieDetailRepository extends ImovieDetailRepository {
  final ImovieDetailDatasource _repository;
  MovieDetailRepository(this._repository);
  @override
  Future<Either<String, DetailMovie>> getDetail(String id) async {
    try {
      var response = await _repository.getDetail(id);
      return right(response);
    } on DioException catch (ex) {
      return left(ex.message.toString());
    }
  }
}
