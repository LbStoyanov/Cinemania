import 'package:cinemania/presentation/screens/movies/movie_screen.dart';
import 'package:cinemania/presentation/views/home_views/favorites_view.dart';
import 'package:cinemania/presentation/views/home_views/home_view.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemania/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
        builder: (context, state, child) {
          return HomeScreen(childView: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomeView();
            },
            routes: [
              GoRoute(
                path: 'movie/:id',
                name: MovieScreen.name,
                builder: (context, state) {
                  final movieId = state.pathParameters['id'] ?? 'no-id';
                  return MovieScreen(movieId: movieId);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/favorites',
            builder: (context, state) {
              return const FavoritesView();
            },
          ),
        ]),

    /* GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(
        childView: HomeView(),
      ),
      routes: [
        
      ],
    ), */
  ],
);
