import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ravn_challenge/app/app.dart';

import '../../helpers/helpers.dart';

void main() {
  testWidgets('validating primaryTextTheme and default styles', (tester) async {
    TextTheme? primaryTextTheme;
    await tester.pumpApp(
      Builder(
        builder: (context) {
          primaryTextTheme = context.primaryTextTheme;
          return const SizedBox.shrink();
        },
      ),
    );
    expect(primaryTextTheme, isNotNull);
    expect(primaryTextTheme?.h2, isNotNull);
    expect(primaryTextTheme?.h2Emphasis, isNotNull);
    expect(primaryTextTheme?.h2Light, isNotNull);
    expect(primaryTextTheme?.h2White, isNotNull);
    expect(primaryTextTheme?.p1, isNotNull);
    expect(primaryTextTheme?.p1Light, isNotNull);
  });
  test('validating capitalize extension', () {
    const value = 'value';
    expect(value.capitalize, 'Value');
  });
}
