import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:imdb_apk/data/datasource/movie_datasource.dart';
import 'package:imdb_apk/data/model/movie.dart';

abstract class ImovieRepository {
  Future<Either<String, List<Movie>>> getMovies();
}

class MovieRepository extends ImovieRepository {
  final ImovieDatasource _repository;
  MovieRepository(this._repository);
  @override
  Future<Either<String, List<Movie>>> getMovies() async {
    try {
      var response = await _repository.getMovies();
      return right(response);
    } on DioException catch (ex) {
      return left(ex.message!);
    }
  }
}
