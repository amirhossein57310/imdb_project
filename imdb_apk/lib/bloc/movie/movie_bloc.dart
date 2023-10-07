import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:imdb_apk/data/repository/movie_repository.dart';

import '../../data/model/movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ImovieRepository _repository;
  MovieBloc(this._repository) : super(MovieInitial()) {
    on<InitialMovieEvent>((event, emit) async {
      final response = await _repository.getMovies();
      emit(
        MovieResponseState(response),
      );
    });
  }
}
