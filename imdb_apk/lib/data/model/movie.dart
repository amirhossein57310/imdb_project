class Movie {
  String title;
  String imdbID;
  String poster;

  Movie(this.title, this.imdbID, this.poster);

  factory Movie.fromJson(Map<String, dynamic> jsonObject) {
    return Movie(
      jsonObject['Title'],
      jsonObject['imdbID'],
      jsonObject['Poster'],
    );
  }
}
