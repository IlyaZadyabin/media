import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qyre/home/view/screen/horizontal_dates.dart';
import 'package:qyre/main.dart';

void main() {
  testWidgets('Collapsed dates transition', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // Both horizontal dates are existing
    expect(find.byType(HorizontalDates), findsNWidgets(2));

    final collapsedDatesFinder = find.byWidgetPredicate(
      (widget) => widget is HorizontalDates && widget.isCollapsed,
    );

    // Collapsed dates are not visible
    expect(collapsedDatesFinder.hitTestable(), findsNothing);

    // Find one SizeTransition of collapsed dates
    final finder = find.byType(SizeTransition);
    expect(finder, findsOneWidget);

    // Check if transition animation didn't start
    final transitionWidget = finder.evaluate().single.widget as SizeTransition;
    expect(transitionWidget.sizeFactor.status, AnimationStatus.dismissed);

    // Scroll main view down to trigger animation
    final gesture = await tester
        .startGesture(const Offset(50, 500)); //Position of the scrollview
    await gesture.moveBy(const Offset(0, -500)); //How much to scroll by
    await tester.pumpAndSettle();

    // Check if transition animation completed at the end
    expect(transitionWidget.sizeFactor.status, AnimationStatus.completed);

    // Collapsed dates are visible
    expect(collapsedDatesFinder.hitTestable(), findsOneWidget);

    // Scroll main view up to trigger animation
    await gesture.moveBy(const Offset(0, 500)); //How much to scroll by
    await tester.pumpAndSettle();

    // Check if transition animation stopped at the start
    expect(transitionWidget.sizeFactor.status, AnimationStatus.dismissed);

    // Collapsed dates are not visible
    expect(collapsedDatesFinder.hitTestable(), findsNothing);
  });
}
