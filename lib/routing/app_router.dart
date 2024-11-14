import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:type16_project/presentation/base/base_scaffold_navigation.dart';
import 'package:type16_project/presentation/personality/personality_detail_screen.dart';
import 'package:type16_project/presentation/personality/personality_screen.dart';
import 'package:type16_project/routing/app_startup.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _articleNavigatorKey = GlobalKey<NavigatorState>();
final _personalityNavigatorKey = GlobalKey<NavigatorState>();
final _debateNavigatorKey = GlobalKey<NavigatorState>();
final _moreNavigatorKey = GlobalKey<NavigatorState>();

enum AppRoute { startup, article, personality, personalityDetail, debate, more }

@riverpod
GoRouter goRouter(Ref ref) {
  final appStartupState = ref.watch(appStartupProvider);
  return GoRouter(
      initialLocation: '/article',
      navigatorKey: _rootNavigatorKey,
      redirect: (context, state) {
        //로딩페이지
        if (appStartupState.isLoading || appStartupState.hasError) {
          return '/startup';
        }

        return null;
      },
      routes: [
        GoRoute(
            path: '/startup',
            name: AppRoute.startup.name,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: AppStartupWidget());
            }),
        StatefulShellRoute.indexedStack(
            pageBuilder: (context, state, navigationShell) => NoTransitionPage(
                  child: ScaffoldWithNestedNavigation(
                      navigationShell: navigationShell),
                ),
            branches: [
              StatefulShellBranch(navigatorKey: _articleNavigatorKey, routes: [
                GoRoute(
                    path: '/article',
                    name: AppRoute.article.name,
                    parentNavigatorKey: _articleNavigatorKey,
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: Placeholder());
                    })
              ]),
              StatefulShellBranch(navigatorKey: _personalityNavigatorKey, routes: [
                GoRoute(
                    path: '/personality',
                    name: AppRoute.personality.name,
                    parentNavigatorKey: _personalityNavigatorKey,
                    pageBuilder: (context, state) {
                      return const MaterialPage(child: PersonalityScreen());
                    },
                    routes: [
                      GoRoute(
                        path:'detail',
                        name: AppRoute.personalityDetail.name,
                        parentNavigatorKey: _personalityNavigatorKey,
                        pageBuilder: (context, state) {
                          return MaterialPage(child: PersonalityDetailScreen());
                        }
                      ),
                    ]
                ),
              ]),
              StatefulShellBranch(navigatorKey: _debateNavigatorKey, routes: [
                GoRoute(
                    path: '/debate',
                    name: AppRoute.debate.name,
                    parentNavigatorKey: _debateNavigatorKey,
                    pageBuilder: (context, state) {
                      return MaterialPage(child: Placeholder());
                    })
              ]),
              StatefulShellBranch(navigatorKey: _moreNavigatorKey, routes: [
                GoRoute(
                    path: '/more',
                    name: AppRoute.more.name,
                    parentNavigatorKey: _moreNavigatorKey,
                    pageBuilder: (context, state) {
                      return MaterialPage(child: Placeholder());
                    })
              ]),
            ]),
      ]);
}
