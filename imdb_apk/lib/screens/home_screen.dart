import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_apk/bloc/details/detail_event.dart';
import 'package:imdb_apk/bloc/details/details_bloc.dart';
import 'package:imdb_apk/bloc/movie/movie_bloc.dart';
import 'package:imdb_apk/di/di.dart';
import 'package:imdb_apk/screens/detail_movie_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(127, 53, 144, 0.22),
                    ),
                    child: Icon(Icons.menu),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    height: 40,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(127, 53, 144, 0.22),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: 5,
                          ),
                          Text('search'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  return CustomScrollView(
                    slivers: [
                      if (state is MovieResponseState) ...{
                        state.response.fold(
                          (l) {
                            return SliverToBoxAdapter(child: Text(l));
                          },
                          (r) {
                            return SliverGrid(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return BlocProvider(
                                          create: (context) {
                                            var bloc =
                                                DetailMovieBloc(locator.get());
                                            bloc.add(
                                              InitDetailMovieEvent(
                                                  r[index].imdbID),
                                            );
                                            return bloc;
                                          },
                                          child: DetailNewsScreen(r),
                                        );
                                      },
                                    ));
                                  },
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Card(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              r[index].poster,
                                              fit: BoxFit.cover,
                                              width: 100,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          r[index].title,
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }, childCount: r.length),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                            );
                          },
                        )
                      },
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
