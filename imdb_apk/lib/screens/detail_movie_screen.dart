import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_apk/bloc/details/details_bloc.dart';
import 'package:imdb_apk/bloc/details/details_state.dart';
import 'package:imdb_apk/data/model/movie.dart';

import '../data/model/detail_movie.dart';

class DetailmovieScreen extends StatelessWidget {
  final List<Movie> movie;

  const DetailmovieScreen(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: DetailContent(movie),
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final List<Movie> movie;

  const DetailContent(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      builder: (context, state) {
        if (state is ResponseDetailMovieState) {
          return state.response.fold(
            (l) {
              return Text(l);
            },
            (detailMovie) {
              return CustomScrollView(
                slivers: [
                  SliverAppbarContent(detailMovie),
                  SliverToBoxAdapter(
                    child: DetailMovieContent(
                      movie,
                      detailMovie,
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class DetailMovieContent extends StatelessWidget {
  const DetailMovieContent(this.movie, this.detailMovie, {super.key, thi});

  final List<Movie> movie;
  final DetailMovie detailMovie;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.watch_later_outlined),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            detailMovie.time,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.remove_red_eye_outlined),
                              const SizedBox(width: 10),
                              Text(
                                detailMovie.metascore,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              detailMovie.title,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          detailMovie.plot,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'IMDB : ${detailMovie.rank}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detailMovie.year,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 180,
                          width: 100,
                          child: Image.network(
                            detailMovie.poster,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    children: [
                      Icon(Icons.message),
                      Text(
                        'selected',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.message_outlined),
                      Text(
                        detailMovie.imdbVotes,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.favorite_border_outlined),
                      Text(
                        detailMovie.metascore,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      Icon(Icons.share),
                      Text(
                        'share',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                detailMovie.plot,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: 350,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: detailMovie.genre.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purpleAccent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              detailMovie.genre[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    'similar options',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_right),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  itemCount: movie.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 100,
                              width: 80,
                              child: Image.network(
                                movie[index].poster,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            movie[index].title.length > 10
                                ? '${movie[index].title.substring(0, 10)}...'
                                : movie[index].title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverAppbarContent extends StatelessWidget {
  final DetailMovie detailMovie;
  const SliverAppbarContent(
    this.detailMovie, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      expandedHeight: 330.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              detailMovie.poster,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 100,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 227, 210, 210).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_left_outlined,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 227, 210, 210).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.menu,
                  color: Colors.purple,
                ),
              ),
            ),
            Positioned(
              top: 150,
              right: 170,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 227, 210, 210).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.play_circle_outlined,
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
