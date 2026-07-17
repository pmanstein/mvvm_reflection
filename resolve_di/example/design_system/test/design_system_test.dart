import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: avoid_relative_lib_imports
import '../lib/design_system.dart';

void main() {
  testWidgets('SpGallery renders every component', (tester) async {
    tester.view.physicalSize = const Size(1400, 3000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(theme: SpTheme.dark(), home: const SpGallery()),
    );
    await tester.pumpAndSettle();

    expect(find.byType(SpButton), findsWidgets);
    expect(find.byType(SpVoteCard), findsWidgets);
    expect(find.byType(SpParticipantRow), findsNWidgets(3));
    expect(find.byType(SpBadge), findsNWidgets(5));
    expect(find.byType(SpAvatar), findsNWidgets(3));
    expect(find.byType(SpProgressBar), findsOneWidget);
  });

  testWidgets('vote card selection shows glow state', (tester) async {
    String? voted;
    await tester.pumpWidget(
      MaterialApp(
        theme: SpTheme.dark(),
        home: Scaffold(
          body: Center(
            child: SpVoteCard(value: '8', onPressed: () => voted = '8'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('8'));
    expect(voted, '8');
  });

  testWidgets('showSpToast shows and closes', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: SpTheme.dark(),
        home: Scaffold(
          body: Builder(
            builder: (context) => SpButton(
              label: 'Toast',
              onPressed: () =>
                  showSpToast(context, message: 'Invite link copied'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Toast'));
    await tester.pump();
    await tester.pump(SpDurations.base);
    expect(find.text('Invite link copied'), findsOneWidget);

    await tester.pump(const Duration(seconds: 4));
    expect(find.text('Invite link copied'), findsNothing);
  });
}
