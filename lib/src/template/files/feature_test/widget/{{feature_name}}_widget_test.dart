import 'package:CHANGEME/core/core.dart';
import 'package:CHANGEME/feature/feature.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../utils/widget_builder.dart';

Future<void> main() async {
  EasyLocalization.logger.enableBuildModes = [];
  await loadAppFonts();
  group('{{feature_name_capitalize}} View', () {

    testGoldens('{{feature_name_capitalize}}PageBuilder', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = getDefaultBuilder(
          const {{feature_name_capitalize}}PageBuilder(),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, '{{feature_name}}_page');
      });
    });

    testGoldens('{{feature_name_capitalize}}Widget', (tester) async {
      await mockNetworkImagesFor(() async {
        final builder = getDefaultBuilder(
          const {{feature_name_capitalize}}Widget(),
        );
        await tester.pumpDeviceBuilder(builder);
        await screenMatchesGolden(tester, '{{feature_name}}_widget');
      });
    });
  });
}
