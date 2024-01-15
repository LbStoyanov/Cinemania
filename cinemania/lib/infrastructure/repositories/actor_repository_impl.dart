import 'package:cinemania/domain/datasources/actors_datasource.dart';
import 'package:cinemania/domain/entities/actor.dart';
import 'package:cinemania/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  ActorRepositoryImpl(this.dataSource);

  final ActorsDataSource dataSource;

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    return dataSource.getActorsByMovie(movieId);
  }
}
