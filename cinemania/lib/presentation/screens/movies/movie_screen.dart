import 'package:cinemania/domain/entities/movie.dart';
import 'package:cinemania/presentation/providers/movies/movie_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  const MovieScreen({super.key, required this.movieId});

  static const name = 'movie-screen';

  final String movieId;

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(movieDetailsProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieDetailsProvider)[widget.movieId];

    if (movie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  const _CustomSliverAppBar({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.lightBlue[400],
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        title: Text(
          movie.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black87],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1.0],
                  ),
                ),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
