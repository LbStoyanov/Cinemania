import 'package:cinemania/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemania/infrastructure/repositories/movie_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

//This repository is immutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
  //return MovieRepositoryImpl(IMDBDatasource());
});
