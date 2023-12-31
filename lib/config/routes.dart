import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app.dart';


/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage(title: 'Zawia',);
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return Container();
          },
        ),
      ],
    ),
  ],
);
