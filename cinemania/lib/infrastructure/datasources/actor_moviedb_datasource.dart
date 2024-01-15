import 'package:cinemania/config/constants/environment.dart';
import 'package:cinemania/domain/datasources/actors_datasource.dart';
import 'package:cinemania/domain/entities/actor.dart';
import 'package:cinemania/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemania/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDataSource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
      'api_key': Environment.movieDbKey,
      'language': 'bg-BG'
    }),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
