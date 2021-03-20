import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class {{project_name_capitalize}}Repo {
  Future<String> getString() async {
    return {{project_name}};
  }
}
