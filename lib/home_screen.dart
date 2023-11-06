// import 'package:flutter/material.dart';
// import "package:flutter_riverpod/flutter_riverpod.dart";
// import 'package:riverpod_practice/main.dart';
// // Notifier
// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});

//   void onSubmitted(WidgetRef ref, String value) {
//     ref.read(nameProvider.notifier).update((state) => value);
//   }

//   @override
//   Widget build(
//       BuildContext context, WidgetRef ref,
//       ) {
//     final name = ref.watch(nameProvider) ?? "";
//     return MaterialApp(
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(name),
//         ),
//         body: Center(
//           child:
//           Column(
//               children: [
//                 TextField(
//                   onSubmitted: (value) => onSubmitted(ref, value) ,
//                 ),
//                 Center(
//                   child: Text(name),
//                 )
//               ]
//           ),

//         ),

//       ),
//     );
//   }
// }

// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_practice/country.dart';

class SecondHome extends StatefulWidget {
  const SecondHome({super.key});

  @override
  State<SecondHome> createState() => _SecondHomeState();
}

class _SecondHomeState extends State<SecondHome> {
  final List<Country> items = [];
  var selectedValue;

  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future readJson() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/sample.json');

      print(jsonString);
      final Map<String, dynamic> jsonData = json.decode(jsonString);

      if (jsonData.containsKey("items")) {
        final countryList = jsonData["items"];
        print(countryList);
        final List<Country> objects =
            countryList.map((e) => Country.fromJson(e)).toList();
        return objects;
      } else {
        throw Exception("JSON data does not contain 'items' key.");
      }
    } catch (e) {
      print("Error loading or parsing JSON: $e");
      // You can handle the error in an appropriate way here, e.g., return an empty list or re-throw the exception.
      return List<Country>.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Scaffold(
      backgroundColor: Colors.pinkAccent[100],
      appBar: AppBar(
        title: const Text('Drop Down Menu'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            FutureBuilder(
              future: readJson(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton(
                    isExpanded: true,
                    value: selectedValue,
                    items: snapshot.data!
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.code.toString(),
                            child: Text(e.country.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      selectedValue = value;
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
