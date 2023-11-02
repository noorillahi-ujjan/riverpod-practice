import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_practice/main.dart';

// class SecondScreen extends ConsumerWidget {
//   const SecondScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name = ref.watch(nameProvider);
//     return MaterialApp(
//       title: name,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Center(
//         child: Container(
//           child: Text("Second Screen $name"),
//         ),
//       ),
//     );
//   }
// }


// State Provider

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  void onSubmitted(WidgetRef ref, String value) {
    final name = ref.read(nameProvider.notifier).update((state) => value);

  }




  @override
  Widget build(
      BuildContext context, WidgetRef ref,
      ) {
    final name = ref.watch(nameProvider) ?? "";
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(name),
        ),
        body: Center(
          child:
          Column(
              children: [
                TextField(
                  onSubmitted: (value) => onSubmitted(ref, value) ,
                ),
                Center(
                  child: Text(name),
                )
              ]
          ),

        ),

      ),
    );
  }
}