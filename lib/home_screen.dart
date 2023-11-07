import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: ((value) => onSubmitted(ref, value)),
          ),
          TextField(
            onSubmitted: ((value) => onSubmitted(ref, value)),
          ),
          Center(
            child: Text(user.age.toString()),
          )
        ],
      ),
    );
  }

  onSubmitted(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  onAgeSubmitted(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }
}
