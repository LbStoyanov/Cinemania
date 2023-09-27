import 'package:cinemania/domain/datasources/movies_datasource.dart';
import 'package:cinemania/domain/entities/movie.dart';
import 'package:cinemania/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  MovieRepositoryImpl(this.datasource);

  final MoviesDatasource datasource;

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }
}
