import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_apk/bloc/movie/movie_bloc.dart';
import 'package:imdb_apk/screens/home_screen.dart';

import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();

  runApp(const ImdbApp());
}

class ImdbApp extends StatelessWidget {
  const ImdbApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) {
          var bloc = MovieBloc(
            locator.get(),
          );
          bloc.add(InitialMovieEvent());
          return bloc;
        },
        child: const HomeScreen(),
      ),
    );
  }
}
