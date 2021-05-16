import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:CHANGEME/feature/{{project_name}}/repo/{{project_name}}_repo.dart';

part '{{project_name}}_event.dart';
part '{{project_name}}_state.dart';
part '{{project_name}}_bloc.freezed.dart';

@injectable
class {{project_name_capitalize}}Bloc extends Bloc<{{project_name_capitalize}}Event, {{project_name_capitalize}}State> {
  {{project_name_capitalize}}Bloc({
    required this.{{project_name}}Repo,
  }) : super(const _Loading());

  final {{project_name_capitalize}}Repo {{project_name}}Repo;

  @override
  Stream<{{project_name_capitalize}}State> mapEventToState(
    {{project_name_capitalize}}Event event,
  ) async* {
    yield* event.map(
      fetch: _fetch,
    );
  }

  Stream<{{project_name_capitalize}}State> _fetch(_Fetch event) async* {
    final {{project_name}} = await {{project_name}}Repo.get{{project_name_capitalize}}();
    yield {{project_name_capitalize}}State.loaded({{project_name}});
  }
}
