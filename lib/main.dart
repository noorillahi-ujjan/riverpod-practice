import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_practice/home_screen.dart';
import 'package:riverpod_practice/user.dart';

// Providers
// Provider
// StateProvider
// StateNotifier and StateNotifierProvider

final userProvider = StateNotifierProvider<UserNotfier, User>((ref) =>
    UserNotfier(User(
        name: "",
        age: 0))); // it just want the class inherating from StateNotifier

void main() {
  runApp(const ProviderScope(child: HomeScreen()));
}
