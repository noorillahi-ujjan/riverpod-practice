import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_practice/second_screen.dart';

// final nameProvider = Provider<String>((ref) => "Noor ");

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(
//     BuildContext context,
//   ) {
//     // final name = ref.watch(nameProvider);
//     return MaterialApp(
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:
//           // SecondScreen(),
//           Consumer(builder: (context, ref, child) {
//         final name = ref.watch(nameProvider);
//         return Center(
//           child: Container(
//             child: Text("Main Screen $name"),
//           ),
//         );
//       }),
//     );
//   }
// }

//************* if the widget is StatefullWidget */

final nameProvider = Provider<String>((ref) => "Noor ");

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final name = ref.watch(nameProvider);
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
            // SecondScreen(),
            Center(
          child: Container(
            child: Text("Main Screen $name"),
          ),
        ));
  }
}
