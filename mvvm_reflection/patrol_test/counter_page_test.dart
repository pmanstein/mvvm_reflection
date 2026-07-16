import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_reflection/app/app.dart';
import 'package:mvvm_reflection/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:mvvm_reflection/features/counter/domain/repositories/counter_repository.dart';
import 'package:mvvm_reflection/main.reflectable.dart';
import 'package:patrol/patrol.dart';
import 'package:resolve_di/resolve_di.dart';

void main() {
  patrolTest('increments counter when tapping the plus button', ($) async {
    initializeReflectable();
    registerDependencies({CounterRepository: CounterRepositoryImpl});

    await $.pumpWidgetAndSettle(const App());

    expect($('0'), findsOneWidget);

    await $(FloatingActionButton).tap();
    await $.pumpAndSettle();

    expect($('1'), findsOneWidget);
  });
}
