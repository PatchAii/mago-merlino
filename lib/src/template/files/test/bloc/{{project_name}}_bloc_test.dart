import 'package:{{project_name}}/components/{{project_name}}/bloc/{{project_name}}_bloc.dart';
import 'package:{{project_name}}/components/{{project_name}}/repo/{{project_name}}_repo.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class Mock{{project_name_capitalize}}Repo extends Mock implements {{project_name_capitalize}}Repo {}

void main() {
  Mock{{project_name_capitalize}}Repo mock{{project_name_capitalize}}Repo;

  setUp(() {
    mock{{project_name_capitalize}}Repo = Mock{{project_name_capitalize}}Repo();
  });
  group('{{project_name_capitalize}}Bloc', () {
    blocTest(
      'Test#1 emits "nothing" when {{project_name_capitalize}}Bloc is created',
      build: () => _create{{project_name_capitalize}}Bloc(mock{{project_name_capitalize}}Repo),
      expect: [],
    );
  });
}

{{project_name_capitalize}}Bloc _create{{project_name_capitalize}}Bloc(Mock{{project_name_capitalize}}Repo mock{{project_name_capitalize}}Repo) {
  return {{project_name_capitalize}}Bloc({{project_name}}Repo: mock{{project_name_capitalize}}Repo);
}
