class DetailMovie {
  String title;
  String year;
  String time;
  String plot;
  String poster;
  String rank;
  String metascore;
  String imdbVotes;
  List<String> genre; // Change the data type to a list of strings

  DetailMovie(
    this.title,
    this.year,
    this.time,
    this.plot,
    this.poster,
    this.rank,
    this.metascore,
    this.imdbVotes,
    this.genre,
  );

  factory DetailMovie.fromJson(Map<String, dynamic> jsonObject) {
    final genreString = jsonObject['Genre'];
    final genreList =
        genreString.split(', '); // Split the genre string into a list

    return DetailMovie(
      jsonObject['Title'],
      jsonObject['Year'],
      jsonObject['Runtime'],
      jsonObject['Plot'],
      jsonObject['Poster'],
      jsonObject['imdbRating'],
      jsonObject['Metascore'],
      jsonObject['imdbVotes'],
      genreList, // Assign the list of genres here
    );
  }
}
