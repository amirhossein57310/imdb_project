import 'package:dartz/dartz.dart';
import 'package:imdb_apk/data/model/detail_movie.dart';

abstract class DetailMovieState {}

class InitDetailState extends DetailMovieState {}

class ResponseDetailMovieState extends DetailMovieState {
  Either<String, DetailMovie> response;

  ResponseDetailMovieState(this.response);
}
