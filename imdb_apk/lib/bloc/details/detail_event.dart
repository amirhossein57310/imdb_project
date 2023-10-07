abstract class DetailMovieEvent {}

class InitDetailMovieEvent extends DetailMovieEvent {
  String id;
  InitDetailMovieEvent(this.id);
}
