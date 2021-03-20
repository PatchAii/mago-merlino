import 'package:{{project_name}}/components/{{project_name}}/repo/{{project_name}}_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part '{{project_name}}_state.dart';
part '{{project_name}}_event.dart';
part '{{project_name}}_bloc.freezed.dart';

@injectable
class {{project_name_capitalize}}Bloc extends Bloc<{{project_name_capitalize}}Event, {{project_name_capitalize}}State> {
  {{project_name_capitalize}}Bloc({
    @required this.{{project_name}}Repo,
  }) : super(const _Idle());

  final {{project_name_capitalize}}Repo {{project_name}}Repo;

  @override
  Stream<{{project_name_capitalize}}State> mapEventToState({{project_name_capitalize}}Event gEvent) async* {
    yield* gEvent.map(
      temp: _temp,
    );
  }

  Stream<{{project_name_capitalize}}State> _temp(event) async* {
    await {{project_name}}Repo.getString();
  }
}
