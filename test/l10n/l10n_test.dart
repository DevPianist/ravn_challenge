import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ravn_challenge/l10n/l10n.dart';

import '../helpers/helpers.dart';

void main() {
  testWidgets('validating l10n is not null', (tester) async {
    AppLocalizations? l10n;
    await tester.pumpApp(
      Builder(
        builder: (context) {
          l10n = context.l10n;
          return const SizedBox.shrink();
        },
      ),
    );
    expect(l10n, isNotNull);
  });
}
