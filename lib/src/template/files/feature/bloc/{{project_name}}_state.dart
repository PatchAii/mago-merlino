part of '{{project_name}}_bloc.dart';

@freezed
class {{project_name_capitalize}}State with _${{project_name_capitalize}}State {
  const factory {{project_name_capitalize}}State.loading() = _Loading;
  const factory {{project_name_capitalize}}State.loaded(String {{project_name}}) = _Loaded;
}
