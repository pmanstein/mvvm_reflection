import 'package:flutter/material.dart';
import 'package:advanced_demo/app/app.dart';
import 'package:advanced_demo/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:advanced_demo/features/counter/domain/repositories/counter_repository.dart';
import 'package:advanced_demo/main.reflectable.dart';
import 'package:resolve_di/resolve_di.dart';

void main() {
  initializeReflectable();
  registerDependencies({CounterRepository: CounterRepositoryImpl});

  runApp(const App());
}
