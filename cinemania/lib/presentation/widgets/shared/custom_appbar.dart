import 'package:cinemania/domain/entities/movie.dart';

import 'package:cinemania/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemania/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(
                Icons.movie_creation_rounded,
                color: colors.primary,
              ),
              const SizedBox(width: 10),
              Text('КиноМания',
                  style: TextStyle(
                      color: colors.secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              IconButton(
                onPressed: () {
                  final movieRepository = ref.watch(movieRepositoryProvider);
                  showSearch<Movie?>(
                    context: context,
                    delegate: SearchMovieDelegate(
                        searchMovies: movieRepository.searchMovies),
                  ).then((movie) {
                    if (movie == null) return;
                    context.push('/movie/${movie.id}');
                  });
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
