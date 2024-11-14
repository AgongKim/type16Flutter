import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:type16_project/routing/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: ThemeData(
        fontFamily: "Pretendard",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          // colorScheme: ColorScheme.fromSeed(
          //   seedColor: Color(0xFFFF632B), // primaryColor 대신 seedColor 사용
          // ).copyWith(
          //     primary: Color(0xFFFF632B), // 원하는 색상으로 primary 덮어쓰기
          //     secondary: Color(0xFFFFA252)),
        canvasColor: Color(0xFFF5F5F5),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF2A2A2A));
              }
              return TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFFDEDAD3));
            })
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),

      ),
    );
  }
}
