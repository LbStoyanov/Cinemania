import 'package:cinemania/infrastructure/datasources/mappers/movie_mapper.dart';
import 'package:cinemania/infrastructure/datasources/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';
import 'package:cinemania/config/constants/environment.dart';
import 'package:cinemania/domain/datasources/movies_datasource.dart';
import 'package:cinemania/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': Environment.movieDbKey,
      'language': 'bg-BG'
    }),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((m) => MovieMapper.movieDBToEntity(m))
        .toList();

    return movies;
  }
}
