import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_practice/home_screen.dart';

// Providers
// Provider
// StateProvider
// StateNotifier and StateNotifierProvider

final nameProvider = StateProvider<String?>((ref) => null);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  void onSubmitted(WidgetRef ref, String value) {
    final name = ref.read(nameProvider.notifier).state = value;
  }

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final name = ref.watch(nameProvider) ?? "";
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SecondHome(),

      // Scaffold(
      //   appBar: AppBar(
      //     title: Text(name),
      //   ),
      //   body: Center(
      //     child:
      //     Column(
      //         children: [
      //           TextField(
      //             onSubmitted: (value) => onSubmitted(ref, value) ,
      //           ),
      //           Center(
      //             child: Text(name),
      //           )
      //         ]
      //     ),

      //   ),

      // ),
    );
  }
}
