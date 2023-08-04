import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instaclon/state/auth/provider/auth_state_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.watch(authStateProvider.notifier).signOut();
                  },
                  child: Text("log out")),
            )
          ],
        ),
      ),
    );
  }
}
