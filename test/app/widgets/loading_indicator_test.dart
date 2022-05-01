import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ravn_challenge/app/app.dart';

import '../../helpers/helpers.dart';

void main() {
  testWidgets(
    'Loading Indicator in Android',
    (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
      await tester.pumpApp(
        const LoadingIndicator(),
      );
      debugDefaultTargetPlatformOverride = null;
    },
  );
  testWidgets(
    'Loading Indicator in iOS',
    (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      await tester.pumpApp(
        const LoadingIndicator(),
      );
      debugDefaultTargetPlatformOverride = null;
    },
  );
}
