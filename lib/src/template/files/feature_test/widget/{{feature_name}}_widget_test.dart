import 'package:{{package_name}}/core/core.dart';
import 'package:{{package_name}}/feature/feature.dart';
import 'package:{{package_name}}/feature/{{feature_name}}/{{feature_name}}.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../utils/widget_builder.dart';

Future<void> main() async {
  EasyLocalization.logger.enableBuildModes = [];
  await loadAppFonts();
  group('{{feature_name_capitalize}} View', () {

    // La pagina contiene il bloc ottenuto tramite getIt e manda in errore il test
    // testGoldens('{{feature_name_capitalize}}PageBuilder', (tester) async {
    //   await mockNetworkImagesFor(() async {
    //     final builder = getDefaultBuilder(
    //       const {{feature_name_capitalize}}PageBuilder(),
    //     );
    //     await tester.pumpDeviceBuilder(builder);
    //     await screenMatchesGolden(tester, '{{feature_name}}_page');
    //   });
    // });

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
