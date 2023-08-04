import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instaclon/screens/auth/views/login_page.dart';
import 'package:instaclon/screens/homepage.dart';
import 'package:instaclon/state/auth/provider/isLoggedInProvider.dart';
import 'package:instaclon/firebase_options.dart';
import 'package:instaclon/utils/theme.dart';
import 'package:stack_trace/stack_trace.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is Trace) return stack.vmTrace;
    if (stack is Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(
      isLoggedInProvider,
    );
    return MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: isLoggedIn ? const HomePage() : const LoginPage());
  }
}
