import 'package:bloc_test/bloc_test.dart';
import 'package:CHANGEME/feature/{{project_name}}/bloc/{{project_name}}_bloc.dart';
import 'package:CHANGEME/feature/{{project_name}}/repo/{{project_name}}_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{project_name_capitalize}}Repo extends Mock implements {{project_name_capitalize}}Repo {}

void main() {
  late {{project_name_capitalize}}Repo repo;

  group('{{project_name_capitalize}}Bloc', () {
    setUp(() {
      repo = Mock{{project_name_capitalize}}Repo();
    });

    blocTest<{{project_name_capitalize}}Bloc, {{project_name_capitalize}}State>(
      'emits [] when nothing is added',
      build: () => _getBloc(repo),
      expect: () => [],
    );

    blocTest<{{project_name_capitalize}}Bloc, {{project_name_capitalize}}State>(
      'emits [{{project_name_capitalize}}State.loaded] when fetch is added',
      setUp: () {
        when(() => repo.get{{project_name_capitalize}}()).thenAnswer(
          (_) => Future.value([]),
        );
      },
      build: () => _getBloc(repo),
      act: (bloc) => bloc.add(const {{project_name_capitalize}}Event.fetch()),
      expect: () =>
        const {{project_name_capitalize}}State.loaded('{{project_name}}'),
    );
  });
}

{{project_name_capitalize}}Bloc _getBloc({{project_name_capitalize}}Repo repo) => {{project_name_capitalize}}Bloc(repo: repo);
