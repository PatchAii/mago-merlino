import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('{{project_name_capitalize}}Bloc', () {
    blocTest(
      'Test#1 emits "nothing" when {{project_name_capitalize}}Bloc is created',
      build: () => _create{{project_name_capitalize}}Bloc(),
      expect: [],
    );
}

{{project_name_capitalize}}Bloc _create{{project_name_capitalize}}Bloc() {
  return {{project_name_capitalize}}Bloc();
}
