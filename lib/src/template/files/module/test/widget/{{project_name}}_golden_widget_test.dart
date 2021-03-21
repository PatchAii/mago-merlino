import 'package:{{project_name}}/components/{{project_name}}/ui/widget/{{project_name}}_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:intl/date_symbol_data_local.dart' as intl;

import '../golden_test_utils.dart';

Future<void> main() async {
  await loadAppFonts();
  await intl.initializeDateFormatting('it');
  setUpAll(() {});

  group('{{project_name_capitalize}}', () {
    testGoldens('{{project_name}}_widget goldens', (tester) async {
      GoldenTestUtils.configureToLookLikeIPhone11(tester);
      await tester.pumpWidget(
        GoldenTestUtils.configureMaterialApp(
          const {{project_name_capitalize}}Widget(),
        ),
      );
      await tester.pumpAndSettle();
      await screenMatchesGolden(tester, '{{project_name}}_widget');
    });
  });
}
