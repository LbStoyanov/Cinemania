import 'package:cinemania/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_repository_provider.dart';

final movieDetailsProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>(
  (ref) {
    final movieRepo = ref.watch(movieRepositoryProvider);

    return MovieMapNotifier(getMovie: movieRepo.getMovieById);
  },
);

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  MovieMapNotifier({required this.getMovie}) : super({});

  final GetMovieCallback getMovie;

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) {
      return;
    }

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
