import 'package:cinemania/domain/entities/actor.dart';
import 'package:cinemania/presentation/providers/actors/actors_repository_provider.dart';

import 'package:cinemania/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
  (ref) {
    final actorRepo = ref.watch(actorsRepositoryProvider);

    return ActorsByMovieNotifier(getActors: actorRepo.getActorsByMovie);
  },
);

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  ActorsByMovieNotifier({required this.getActors}) : super({});

  final GetActorsCallback getActors;

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) {
      return;
    }

    final List<Actor> actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
