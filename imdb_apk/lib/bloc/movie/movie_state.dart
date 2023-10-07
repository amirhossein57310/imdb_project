part of 'movie_bloc.dart';

abstract class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieResponseState extends MovieState {
  Either<String, List<Movie>> response;

  MovieResponseState(this.response);
}
