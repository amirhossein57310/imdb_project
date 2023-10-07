import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imdb_apk/data/datasource/detail_movie_datasource.dart';
import 'package:imdb_apk/data/datasource/movie_datasource.dart';
import 'package:imdb_apk/data/repository/detail_movie_repository.dart';
import 'package:imdb_apk/data/repository/movie_repository.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  await _initComponents();
  _initDatasources();
  _initRepositories();
}

void _initRepositories() {
  locator.registerSingleton<ImovieRepository>(MovieRepository(locator.get()));
  locator.registerSingleton<ImovieDetailRepository>(
      MovieDetailRepository(locator.get()));
}

void _initDatasources() {
  locator.registerSingleton<ImovieDatasource>(
      MovieRemoteDatasource(locator.get()));
  locator.registerSingleton<ImovieDetailDatasource>(
      MovieDetailRemoteDatasource(locator.get()));
}

Future<void> _initComponents() async {
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'http://www.omdbapi.com/')));
}
