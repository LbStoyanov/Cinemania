import 'package:cinemania/config/constants/environment.dart';
import 'package:cinemania/domain/datasources/movies_datasource.dart';
import 'package:cinemania/domain/entities/movie.dart';
import 'package:dio/dio.dart';

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
    final List<Movie> movies = [];

    return [];
  }
}