import 'package:injectable/injectable.dart';

@injectable
class {{project_name_capitalize}}Repo {
  Future<String> get{{project_name_capitalize}}() async {
    return '{{project_name}}';
  }
}
