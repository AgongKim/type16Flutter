import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:type16_project/constants/scales.dart';
import 'package:type16_project/presentation/common_widgets/loading_widget.dart';
part 'app_startup.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  //DO SOMETHING BEFORE APP
}

/// Widget class to manage asynchronous app initialization
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (_) {
        // // 빌드가 완료된 후에 호출될 작업 예약
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   //유저데이터 잇는지 체크,
        //   final authRepository = ref.watch(authenticationRepositoryProvider);
        //   final didSetInitialroutine = authRepository.didSetInitialroutine();
        //   final hasLocalUserData = authRepository.hasLocalUserData();
        //
        //   //온보딩 하지 않았으면(=유저정보가 없으면)
        //   if (!hasLocalUserData) {
        //     context.goNamed(AppRoute.onboarding.name);
        //     return;
        //   }
        //   if (!didSetInitialroutine) {
        //     context.goNamed(AppRoute.onboardingInitialRoutine.name);
        //     return;
        //   }
        //   //온보딩 완료헀는지 체크
        //   context.goNamed(AppRoute.pet.name);
        //   return;
        // });
        // return LoadingWidget();
        return const SizedBox.shrink();
      },
      loading: () => const LoadingWidget(),
      error: (e, st) => AppStartupErrorWidget(
        message: e.toString(),
        onRetry: () => ref.invalidate(appStartupProvider),
      ),
    );
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget(
      {super.key, required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: Theme.of(context).textTheme.headlineSmall),
            gapH16,
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}