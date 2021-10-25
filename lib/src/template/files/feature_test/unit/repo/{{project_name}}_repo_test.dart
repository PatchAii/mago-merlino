import 'package:CHANGEME/feature/{{project_name}}/repo/{{project_name}}_repo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late {{project_name_capitalize}}Repo repo;
  group('{{project_name_capitalize}} repo', () {
    setUpAll(() {
      repo = {{project_name_capitalize}}Repo();
    });

    test('when get{{project_name_capitalize}}, return {{project_name}}', () async {
      final {{project_name}} = await repo.get{{project_name_capitalize}}();
      expect(
        {{project_name}},
        '{{project_name}}',
      );
    });
  });
}
