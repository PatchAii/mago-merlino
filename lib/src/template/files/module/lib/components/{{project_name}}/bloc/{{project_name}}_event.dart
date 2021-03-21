part of '{{project_name}}_bloc.dart';

@freezed
abstract class {{project_name_capitalize}}Event
    with _${{project_name_capitalize}}Event {
  const factory {{project_name_capitalize}}Event.temp() = _Temp;
}
