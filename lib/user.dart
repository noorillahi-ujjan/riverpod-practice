import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;

  User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(name: name ?? this.name, age: age ?? this.age);
  }
}

class UserNotfier extends StateNotifier<User> {
  UserNotfier(super.state);

// with the help of StateNotifier and StateNotifierProvider We can crate multiple function and all of these functions resides in one class
  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateAge(int age) {
    state = state.copyWith(age: age);
  }
}
