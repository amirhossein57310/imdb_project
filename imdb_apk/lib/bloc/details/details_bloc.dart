import 'package:bloc/bloc.dart';
import 'package:imdb_apk/bloc/details/detail_event.dart';
import 'package:imdb_apk/bloc/details/details_state.dart';
import 'package:imdb_apk/data/repository/detail_movie_repository.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final ImovieDetailRepository _repository;
  DetailMovieBloc(this._repository) : super(InitDetailState()) {
    on<InitDetailMovieEvent>((event, emit) async {
      final response = await _repository.getDetail(event.id);
      emit(
        ResponseDetailMovieState(response),
      );
    });
  }
}
