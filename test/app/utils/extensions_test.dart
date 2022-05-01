import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ravn_challenge/app/app.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Extensions', () {
    final controller = ScrollController();
    testWidgets('validating remainingHeight of ScrollController',
        (tester) async {
      await tester.pumpApp(
        ListView(controller: controller),
      );
      expect(controller.remainingHeight, 0.0);
    });
  });
}
