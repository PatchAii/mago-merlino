import 'package:bloc/bloc.dart';
import 'package:CHANGEME/feature/{{project_name}}/repo/{{project_name}}_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part '{{project_name}}_bloc.freezed.dart';
part '{{project_name}}_event.dart';
part '{{project_name}}_state.dart';

@injectable
class {{project_name_capitalize}}Bloc extends Bloc<{{project_name_capitalize}}Event, {{project_name_capitalize}}State> {
  {{project_name_capitalize}}Bloc({
    required this.repo,
  }) : super(const {{project_name_capitalize}}State.loading()) {
    on<{{project_name_capitalize}}Event>((event, emit) async {
      await event.map(
        fetch: (event) => _fetch(event, emit),
      );
    });
  }

  final {{project_name_capitalize}}Repo repo;

  Future _fetch(_Fetch event, Emitter<{{project_name_capitalize}}State> emit) async {
    final {{project_name}} = await {{project_name}}Repo.get{{project_name_capitalize}}();
    emit(const {{project_name_capitalize}}State.loaded({{project_name}}));
  }
}
