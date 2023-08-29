import 'package:cinemania/domain/entities/movie.dart';
import 'package:cinemania/presentation/providers/movies/movies_repository_provider.dart';
import 'package:riverpod/riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  MoviesNotifier({
    required this.fetchMoreMovies,
  }) : super([]);

  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);

    state = [...state, ...movies];
  }
}
