import 'package:flutter/material.dart';
import 'package:story_poker_app/app/app.dart';
import 'package:story_poker_app/main.reflectable.dart';
import 'package:story_poker_features/features.dart';
import 'package:resolve_di/resolve_di.dart';

void main() {
  initializeReflectable();
  registerDependencies({CounterRepository: CounterRepositoryImpl});

  runApp(const App());
}
