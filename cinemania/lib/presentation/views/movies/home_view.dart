import 'package:cinemania/presentation/providers/movies/movies_providers.dart';
import 'package:cinemania/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemania/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:cinemania/presentation/widgets/movies/movies_slideshow.dart';
import 'package:cinemania/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    //final initialLoading = ref.watch(initialLoadingProvider); !!!
    //if (initialLoading) return const FullScreenLoader

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideshowProvider);
    return CustomScrollView(slivers: [
      /*  const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ), */
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              const CustomAppbar(),
              MoviesSlideshow(movies: slideshowMovies),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'В кината',
                subTitle: 'Тази седмица',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: upcomingMovies,
                title: 'Скоро в кината',
                subTitle: 'Този месец',
                loadNextPage: () {
                  ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: popularMovies,
                title: 'Популярни',
                subTitle: 'Този месец',
                loadNextPage: () {
                  ref.read(popularMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: topRatedMovies,
                title: 'Най-висок рейтинг',
                subTitle: 'Този месец',
                loadNextPage: () {
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                },
              ),
              const SizedBox(height: 15)
            ],
          );
        },
        childCount: 1,
      ))
    ]);
  }
}
