import 'package:flutter/material.dart';
import 'package:mvvm_reflection/app/app.dart';
import 'package:mvvm_reflection/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:mvvm_reflection/features/counter/domain/repositories/counter_repository.dart';
import 'package:mvvm_reflection/main.reflectable.dart';
import 'package:resolve_di/resolve_di.dart';

void main() {
  initializeReflectable();
  registerDependencies({CounterRepository: CounterRepositoryImpl});

  runApp(const App());
}
